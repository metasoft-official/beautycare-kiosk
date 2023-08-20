import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:beauty_care/common/layout/app_button_theme.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:beauty_care/main.dart';
import 'package:beauty_care/disease/model/disease_result_model.dart';
import 'package:beauty_care/mbti/model/user_disease_model.dart';
import 'package:beauty_care/mbti/provider/caemra_provider.dart';
import 'package:beauty_care/mbti/provider/diagnosis_provider.dart';
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
  var loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  CameraController? _cameraController;
  Future<void>? _initCameraControllerFuture;
  int cameraIndex = 0;

  bool isCapture = false;

  File? captureImage;

  var userImage;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    _cameraController =
        CameraController(cameras[cameraIndex], ResolutionPreset.veryHigh);
    _initCameraControllerFuture = _cameraController!.initialize().then((value) {
      setState(() {});
      widget.onInitialized();
    });
  }

  @override
  void dispose() {
    _cameraController!.dispose();
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    await _initCameraControllerFuture;
    ref.read(cameraStateProvider.notifier).state = true;
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
                            padding: EdgeInsets.fromLTRB(16, 20, 16, 16),
                            child: Image(
                              image:
                                  MemoryImage(captureImage!.readAsBytesSync()),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Color(0xff222222),
                    padding: EdgeInsets.fromLTRB(18, 30, 18, 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (size.width - 16 * 3) / 2,
                          child: ElevatedButton(
                            style: AppButtonTheme.outlinedBasicButtonTheme,
                            onPressed: () {
                              ref.read(cameraStateProvider.notifier).state =
                                  false;

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
                            child: Text('재촬영'),
                          ),
                        ),
                        Container(
                          width: (size.width - 16 * 3) / 2,
                          child: ElevatedButton(
                            style: AppButtonTheme.basicElevatedButtonTheme,
                            onPressed: () async {
                              ref.read(cameraStateProvider.notifier).state =
                                  false;

                              final imageBytes =
                                  captureImage!.readAsBytesSync();
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

                              // 피부 질환 예측 API 연동
                              if (isDisease == true) {
                                try {
                                  final response = await dio.post(
                                    'http://220.76.251.246:18812',
                                    data: formData,
                                    options: Options(
                                      headers: {
                                        'content-type': 'multipart/form-data',
                                      },
                                    ),
                                  );

                                  logger.d(response);

                                  Map<String, dynamic> jsonData =
                                      json.decode(response.data);

                                  UserDiseaseModel userDiseaseModel =
                                      UserDiseaseModel(
                                    userId: userState.id,
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
                                  // Success handling
                                } catch (e) {
                                  // Error handling
                                  print(e);
                                }
                              }
                            },
                            child: Text('확인'),
                          ),
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
                  // 촬영 영역
                  Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: FutureBuilder<void>(
                      future: _initializeCamera(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return SizedBox(
                            width: size.width,
                            height: size.width,
                            child: AspectRatio(
                                aspectRatio: _cameraController
                                            ?.value.aspectRatio ==
                                        null
                                    ? 1.0
                                    : 1 / _cameraController!.value.aspectRatio,
                                child: CameraPreview(_cameraController!)),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                  // 하단 영역
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // alignment: Alignment.center,
                    children: [
                      // 휴대폰 저장된 이미지 불러올 부분 *** 추가 예정
                      Container(
                        child: SizedBox(
                            height: 48,
                            width: 48,
                            child: IconButton(
                                onPressed: () async {
                                  var picker = ImagePicker();
                                  var image = await picker.pickImage(
                                      source: ImageSource.gallery);

                                  if (image != null) {
                                    setState(() {
                                      userImage = File(image.path);
                                      print('image 선택됨 ${image.path}');
                                    });
                                  }
                                },
                                icon: userImage != null
                                    ?
                                    // ? Image(image: FileImage(File(image.path)))
                                    Opacity(
                                        opacity: 0.0, // 0.0은 완전 투명, 1.0은 완전 불투명
                                        child: Image.file(
                                          File(userImage.path),
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : const Opacity(
                                        opacity: 0.0,
                                        child: Icon(Icons.add_box_outlined)))),
                      ),

                      GestureDetector(
                        onTap: () async {
                          try {
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
                      Align(
                          alignment: Alignment.centerRight,
                          child: Stack(children: [
                            Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(100)
                                  //more than 50% of width makes circle
                                  ),
                            ),
                            SizedBox(
                              height: 48,
                              width: 48,
                              child: IconButton(
                                onPressed: () async {
                                  /// 후면 카메라 <-> 전면 카메라 변경
                                  cameraIndex = cameraIndex == 0 ? 1 : 0;
                                  await _initCamera();
                                },
                                icon: const Icon(
                                  Icons.flip_camera_android,
                                  color: Colors.white,
                                  size: 34.0,
                                ),
                              ),
                            )
                          ])),
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
