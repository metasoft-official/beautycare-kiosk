import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/user/model/user_disease_model.dart';
import 'package:crop/crop.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'package:beauty_care/common/layout/app_button_theme.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:beauty_care/main.dart';
import 'package:beauty_care/mbti/provider/caemra_provider.dart';
import 'package:beauty_care/mbti/provider/user_disease_provider.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:http_parser/http_parser.dart';
import 'package:beauty_care/common/const/values.dart';

class CameraWidget extends ConsumerStatefulWidget {
  const CameraWidget(
      {super.key, required this.isDisease, required this.onInitialized});

  final VoidCallback onInitialized;

  static String get routeName => 'camera';

  final bool isDisease;
  @override
  CameraWidgetState createState() => CameraWidgetState();
}

class CameraWidgetState extends ConsumerState<CameraWidget> {
  late CropController _cropController;
  late Crop crop;

  var loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  CameraController? _cameraController;
  Future<void>? _initCameraControllerFuture;
  int cameraIndex = 0;

  bool isCapture = false;

  File? captureImage;

  File? userImage;

  @override
  void initState() {
    super.initState();
    _cropController = CropController();
    _initCamera();
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    _cameraController =
        CameraController(cameras[cameraIndex], ResolutionPreset.veryHigh);
    _initCameraControllerFuture = _cameraController!.initialize().then((value) {
      _cameraController?.setFlashMode(FlashMode.off);
      setState(() {});
      // widget.onInitialized();
    });
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    await _initCameraControllerFuture;
    ref.read(cameraStateProvider.notifier).state = true;
  }

  Future<Uint8List> convertImageToByteData(ui.Image image) async {
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    var image = null;
    bool isDisease = widget.isDisease;

    final userState = ref.watch(userNotifierProvider);

    final imageQualityNotifier = ref.read(imageQualityProvider);

    Size size = MediaQuery.of(context).size;
    return Container(
      child: isCapture
          ? Stack(children: [
              Column(
                children: [
                  /// 촬영 된 이미지 출력
                  Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: SizedBox(
                      width: size.width,
                      height: size.height,
                      child: Container(
                        color: AppColor.black,
                        child: AspectRatio(
                          aspectRatio: 1 / _cameraController!.value.aspectRatio,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                            child: isDisease == true
                                ? Crop(
                                    controller: _cropController,
                                    child: Image(
                                      image: MemoryImage(
                                          captureImage!.readAsBytesSync()),
                                    ))
                                : Image(
                                    image: MemoryImage(
                                        captureImage!.readAsBytesSync()),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: const Color(0xff222222),
                    padding: const EdgeInsets.fromLTRB(18, 18, 18, 40),
                    child: Column(
                      children: [
                        const Text(
                          '두 손가락으로 이미지를 조절할 수 있어요',
                          style: AppTextTheme.white14m,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: (size.width - 16 * 3) / 2,
                              child: ElevatedButton(
                                style: AppButtonTheme.outlinedBasicButtonTheme,
                                onPressed: () {
                                  ref.read(cameraStateProvider.notifier).state =
                                      false;
                                  _initializeCamera();
                                  setState(() {
                                    isCapture = false;
                                    imageQualityNotifier.updateData(
                                      exposure: true,
                                      eyesOpen: true,
                                      frontal: true,
                                      mouseNotOpen: true,
                                    );
                                  });
                                },
                                child: const Text('재촬영'),
                              ),
                            ),
                            SizedBox(
                              width: (size.width - 16 * 3) / 2,
                              child: ElevatedButton(
                                style: AppButtonTheme.basicElevatedButtonTheme,
                                onPressed: () async {
                                  ref.read(cameraStateProvider.notifier).state =
                                      false;

                                  if (isDisease == true) {
                                    final croppedImage =
                                        await _cropController.crop();
                                    // 원본 파일 경로를 그대로 사용
                                    final Uint8List byteData =
                                        await convertImageToByteData(
                                            croppedImage);
                                    await captureImage?.writeAsBytes(byteData);

                                    final imageBytes =
                                        captureImage!.readAsBytesSync();
                                    final multipartFile =
                                        MultipartFile.fromBytes(imageBytes,
                                            filename: "my_image.jpg",
                                            contentType:
                                                MediaType("image", "jpeg"));

                                    final _data = FormData();
                                    _data.files.add(MapEntry(
                                        'file', // 서버에서 기대하는 키 이름
                                        multipartFile));

                                    final dio = ref.read(dioProvider);
                                    final formData = FormData.fromMap({
                                      'file': multipartFile,
                                    });

                                    // 피부 질환 예측 API 연동
                                    try {
                                      final response = await dio.post(
                                        'http://220.76.251.246:18812',
                                        data: formData,
                                        options: Options(
                                          headers: {
                                            'content-type':
                                                'multipart/form-data',
                                          },
                                        ),
                                      );

                                      logger.d(response);

                                      Map<String, dynamic> jsonData =
                                          json.decode(response.data);

                                      UserDiseaseModel userDiseaseModel =
                                          UserDiseaseModel(
                                        userId: userState.id ?? 34,
                                        topk1Label: jsonData['topk_label'][0],
                                        topk1Value: jsonData['topk_values'][0],
                                        topk2Label: jsonData['topk_label'][1],
                                        topk2Value: jsonData['topk_values'][1],
                                        topk3Label: jsonData['topk_label'][2],
                                        topk3Value: jsonData['topk_values'][2],
                                      );

                                      logger.d(userDiseaseModel);

                                      final userDiseaseId = await ref
                                          .watch(userDiseaseApiProvider)
                                          .createUserDisease(userDiseaseModel);
                                      logger.d(userDiseaseId);

                                      // 이미지 저장
                                      final multipartFileForUpload =
                                          MultipartFile.fromBytes(imageBytes,
                                              filename: "my_image.jpg",
                                              contentType:
                                                  MediaType("image", "jpeg"));

                                      final updateForfmData = FormData.fromMap({
                                        'image': multipartFileForUpload,
                                        'id': userDiseaseId
                                      });

                                      final updateResponse = await dio.put(
                                        '$BASE_URL/common/user-diseases/attach-file/$userDiseaseId',
                                        data: updateForfmData,
                                      );

                                      logger.d(updateResponse);

                                      if (!mounted) return;
                                      context.push(
                                          '/skin-result?diseaseId=$userDiseaseId');
                                      // Success handling
                                    } catch (e) {
                                      // Error handling
                                      print(e);
                                    }
                                  }
                                  // 피부 MBTI
                                  else {
                                    final imageBytes =
                                        captureImage!.readAsBytesSync();
                                    final multipartFile =
                                        MultipartFile.fromBytes(imageBytes,
                                            filename: "my_image.jpg",
                                            contentType:
                                                MediaType("image", "jpeg"));

                                    final dio = ref.read(dioProvider);
                                    final formData = FormData.fromMap({
                                      'file': multipartFile,
                                    });

                                    // // 이미지 저장
                                    // final multipartFileForUpload =
                                    //     MultipartFile.fromBytes(imageBytes,
                                    //         filename: "my_image.jpg",
                                    //         contentType:
                                    //             MediaType("image", "jpeg"));
                                    //
                                    // final updateForfmData = FormData.fromMap({
                                    //   'image': multipartFileForUpload,
                                    //   'id': userSkinMbtiId
                                    // });
                                    //
                                    // final updateResponse = await dio.put(
                                    //   '$BASE_URL/common/user-diseases/attach-file/$userDiseaseId',
                                    //   data: updateForfmData,
                                    // );

                                    context.pushNamed('survey');
                                  }
                                },
                                child: Text('확인'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 50,
                  // )
                ],
              ),
              // 하단 영역
              Column(children: [
                Column(
                  children: [
                    if (isDisease == false) ...[
                      // 카메라 앱 작동시 이미지 품질 검증에 필요한 사항, 얼굴 외곽선 등을 표시하는 부분
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('정면을 주시하세요'),
                              style: ref
                                          .read(imageQualityProvider.notifier)
                                          .frontal ==
                                      true
                                  ? AppButtonTheme
                                      .shootingIndicationButtonInactiveTheme
                                  : AppButtonTheme
                                      .shootingIndicationButtonActiveTheme,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('얼굴 조명을 균일하게'),
                              style: ref
                                          .read(imageQualityProvider.notifier)
                                          .exposure ==
                                      true
                                  ? AppButtonTheme
                                      .shootingIndicationButtonInactiveTheme
                                  : AppButtonTheme
                                      .shootingIndicationButtonActiveTheme,
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('눈을 뜨세요'),
                              style: ref
                                          .read(imageQualityProvider.notifier)
                                          .eyesOpen ==
                                      true
                                  ? AppButtonTheme
                                      .shootingIndicationButtonInactiveTheme
                                  : AppButtonTheme
                                      .shootingIndicationButtonActiveTheme,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('입을 벌리지 마세요'),
                              style: ref
                                          .read(imageQualityProvider.notifier)
                                          .mouseNotOpen ==
                                      true
                                  ? AppButtonTheme
                                      .shootingIndicationButtonInactiveTheme
                                  : AppButtonTheme
                                      .shootingIndicationButtonActiveTheme,
                            ),
                          ]),
                    ],
                  ],
                ),
              ]),
            ])
          : Stack(children: [
              Column(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: FutureBuilder<void>(
                      future: _initializeCamera(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            _cameraController != null &&
                            _cameraController!.value.isInitialized) {
                          double targetAspectRatio = 16 / 9;

                          logger.d(size.height, size.width);
                          logger.d(targetAspectRatio);

                          return AspectRatio(
                              aspectRatio: targetAspectRatio,
                              child: CameraPreview(_cameraController!));
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  if (isDisease == false) ...[
                    // 카메라 앱 작동시 이미지 품질 검증에 필요한 사항, 얼굴 외곽선 등을 표시하는 부분
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('정면을 주시하세요'),
                            style: ref
                                        .read(imageQualityProvider.notifier)
                                        .frontal ==
                                    true
                                ? AppButtonTheme
                                    .shootingIndicationButtonInactiveTheme
                                : AppButtonTheme
                                    .shootingIndicationButtonActiveTheme,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('얼굴 조명을 균일하게'),
                            style: ref
                                        .read(imageQualityProvider.notifier)
                                        .exposure ==
                                    true
                                ? AppButtonTheme
                                    .shootingIndicationButtonInactiveTheme
                                : AppButtonTheme
                                    .shootingIndicationButtonActiveTheme,
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('눈을 뜨세요'),
                            style: ref
                                        .read(imageQualityProvider.notifier)
                                        .eyesOpen ==
                                    true
                                ? AppButtonTheme
                                    .shootingIndicationButtonInactiveTheme
                                : AppButtonTheme
                                    .shootingIndicationButtonActiveTheme,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('입을 벌리지 마세요'),
                            style: ref
                                        .read(imageQualityProvider.notifier)
                                        .mouseNotOpen ==
                                    true
                                ? AppButtonTheme
                                    .shootingIndicationButtonInactiveTheme
                                : AppButtonTheme
                                    .shootingIndicationButtonActiveTheme,
                          ),
                        ]),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: Center(
                                child: Image(
                                  image: const AssetImage(
                                      'assets/images/face_guideline.png'),
                                  width: size.height * 0.4,
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ],
                ],
              ),

              // 카메라 버튼 아래에 고정
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 116,
                  color: Colors.black.withOpacity(0.5),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 48.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // alignment: Alignment.center,
                    children: [
                      // 휴대폰 저장된 이미지 불러올 부분 *** 추가 예정
                      SizedBox(
                        height: 48,
                        width: 48,
                        child: GestureDetector(
                            onTap: () async {
                              var picker = ImagePicker();
                              var image = await picker.pickImage(
                                  source: ImageSource.gallery);

                              if (image != null) {
                                if (image.path.toLowerCase().endsWith('.jpg')) {
                                  setState(() {
                                    userImage = File(image.path);
                                    isCapture = true;
                                    captureImage = userImage;
                                    logger.d('image 선택됨 ${image.path}');
                                  });
                                } else {
                                  toastMessage
                                      .topRedBoxWhiteText('jpg만 선택할 수 있습니다.');
                                }
                              }
                            },
                            // ? Image(image: FileImage(File(image.path)))
                            child: userImage != null
                                ? Image.file(
                                    File(userImage?.path ?? '-'),
                                    fit: BoxFit.cover,
                                  )
                                : Icon(
                                    Icons.photo,
                                    size: 45,
                                    color: Colors.white.withOpacity(0.5),
                                  )),
                      ),

                      GestureDetector(
                        onTap: () async {
                          try {
                            _cropController.scale = 1.0;
                            _cropController.rotation = 0;
                            await _cameraController!
                                .takePicture()
                                .then((value) {
                              captureImage = File(value.path);
                            });

                            final imageBytes = captureImage!.readAsBytesSync();
                            final multipartFile = MultipartFile.fromBytes(
                                imageBytes,
                                filename: "my_image.jpg",
                                contentType: MediaType("image", "jpeg"));

                            final _data = FormData();
                            _data.files.add(MapEntry(
                                'file', // 서버에서 기대하는 키 이름
                                multipartFile));

                            final dio = ref.read(dioProvider);
                            final formData = FormData.fromMap({
                              'file': multipartFile,
                            });

                            try {
                              final response = await dio.post(
                                'http://13.209.40.214:10049/REST/quality?image',
                                data: formData,
                                options: Options(
                                  headers: {
                                    'content-type': 'multipart/form-data',
                                  },
                                ),
                              );

                              // Success handling
                              print(response.data);

                              if (response.data['result_code'] == "S") {
                                imageQualityNotifier.updateData(
                                  exposure: response.data['exposure'] == 'Y',
                                  eyesOpen: response.data['eyes_open'] == 'Y',
                                  frontal: response.data['frontal'] == 'Y',
                                  mouseNotOpen:
                                      response.data['resolution'] == 'Y',
                                );
                              }
                            } catch (e) {
                              // Error handling
                              print(e);
                            }

                            /// 화면 상태 변경 및 이미지 저장
                            setState(() {
                              isCapture = true;
                            });
                          } catch (e) {
                            print("$e");
                          }
                        },
                        // 카메라 버튼
                        child: Container(
                          height: 64.0,
                          width: 64.0,
                          padding: const EdgeInsets.all(1.0),
                          child: const Image(
                            image:
                                AssetImage('assets/icons/ic_btn_shooting.png'),
                          ),
                        ),
                      ),
                      Container(
                          height: 43,
                          width: 43,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(100)
                              //more than 50% of width makes circle
                              ),
                          child: Align(
                            child: IconButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () async {
                                /// 후면 카메라 <-> 전면 카메라 변경
                                cameraIndex = cameraIndex == 0 ? 1 : 0;
                                await _initCamera();
                              },
                              icon: Icon(
                                Icons.flip_camera_android,
                                color: Colors.white.withOpacity(0.8),
                                size: 30.0,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ]),
    );
  }

  // Future<void> saveImage(
  //     String id, UserDiseaseModel model, MultipartFile file) async {
  //   // Construct your URL based on the id or any other data
  //   String url = "$BASE_URL/$id";
  //
  //   // Call the uploadFile function
  //   await uploadFile(url, file, model);
  // }
  //
  // Future<void> uploadFile(
  //     String url, MultipartFile file, UserDiseaseModel model) async {
  //   var request = http.MultipartRequest('POST', Uri.parse(url));
  //
  //   // Attach the file to the request
  //   request.files.add(file as http.MultipartFile);
  //
  //   // Optionally, send other data along with the request (like model fields)
  //   request.fields['image'] = model.image;
  //
  //   // Send the request
  //   var response = await request.send();
  //
  //   // Handle the response as needed
  //   if (response.statusCode == 200) {
  //     print('Upload successful');
  //   } else {
  //     print('Upload failed');
  //   }
  // }
}

final imageQualityProvider =
    ChangeNotifierProvider((ref) => ImageQualityNotifier());

class ImageQualityNotifier extends ChangeNotifier {
  bool exposure = true;
  bool eyesOpen = true;
  bool frontal = true;
  bool mouseNotOpen = true;

  void updateData({
    required bool exposure,
    required bool eyesOpen,
    required bool frontal,
    required bool mouseNotOpen,
  }) {
    this.exposure = exposure;
    this.eyesOpen = eyesOpen;
    this.frontal = frontal;
    this.mouseNotOpen = mouseNotOpen;
    notifyListeners();
  }
}
