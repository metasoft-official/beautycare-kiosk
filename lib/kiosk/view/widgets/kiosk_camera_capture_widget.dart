import 'dart:convert';
import 'dart:io';
import 'package:beauty_care/common/layout/kiosk_button_theme.dart';
import 'package:beauty_care/common/layout/kiosk_text.dart';
import 'package:beauty_care/kiosk/view/widgets/kiosk_app_bar.dart';
import 'package:beauty_care/user/model/user_disease_model.dart';
import 'package:camera/camera.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'package:beauty_care/common/layout/app_button_theme.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:beauty_care/main.dart';
import 'package:beauty_care/disease/model/disease_result_model.dart';
import 'package:beauty_care/mbti/provider/caemra_provider.dart';
import 'package:beauty_care/mbti/provider/diagnosis_provider.dart';
import 'package:beauty_care/mbti/provider/user_disease_provider.dart';
// import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:http_parser/http_parser.dart';
import 'package:beauty_care/common/const/values.dart';

class KioskCameraCaptureWidget extends ConsumerStatefulWidget {
  const KioskCameraCaptureWidget(
      {super.key,
      required this.isDisease,
      required this.onInitialized,
      required this.camera});

  final VoidCallback onInitialized;

  static String get routeName => 'camera';

  final bool isDisease;
  final CameraDescription camera;

  @override
  KioskCameraWidgetState createState() => KioskCameraWidgetState();
}

class KioskCameraWidgetState extends ConsumerState<KioskCameraCaptureWidget> {
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
    _initCamera();
  }

  Future<void> _initCamera() async {
    _cameraController =
        CameraController(widget.camera, ResolutionPreset.veryHigh);
    _initCameraControllerFuture = _cameraController!.initialize().then((value) {
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

  @override
  Widget build(BuildContext context) {
    var image = null;
    bool isDisease = widget.isDisease;

    final userState = ref.watch(userNotifierProvider);

    final imageQualityNotifier = ref.read(imageQualityProvider);

    Size size = MediaQuery.of(context).size;
    return Container(
      child: isCapture
          ? SizedBox(
              height: size.height,
              child: Column(children: [
                const KioskAppBar(),

                /// 촬영 된 이미지 출력
                Expanded(
                  child: Container(
                    width: size.width,
                    padding: const EdgeInsets.all(40),
                    color: AppColor.black,
                    child: Center(
                      child: Image(
                        fit: BoxFit.scaleDown,
                        image: MemoryImage(captureImage!.readAsBytesSync()),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width,
                  color: const Color(0xff222222),
                  padding: const EdgeInsets.all(72),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: KioskButtonTheme.outlinedBasicButtonTheme,
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
                          child: const Text(
                            '재촬영',
                            style: KioskTextTheme.blue36b,
                          ),
                        ),
                      ),
                      const SizedBox(width: 36),
                      Expanded(
                        child: ElevatedButton(
                          style: KioskButtonTheme.basicElevatedButtonTheme,
                          onPressed: () async {
                            ref.read(cameraStateProvider.notifier).state =
                                false;

                            if (isDisease == true) {
                              logger.d("질환");
                              logger.d(captureImage);

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

                                if (!mounted) return;
                                context.push(
                                    '/kiosk-disease-result?diseaseId=$userDiseaseId');

                                // Success handling
                              } catch (e) {
                                // Error handling
                                print(e);
                              }
                            }
                            // 피부 MBTI
                            else {
                              print("MBTI");
                              context.pushNamed('KioskSurvey');
                            }
                          },
                          child: Text(
                            '확인',
                            style: KioskTextTheme.white48b,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            )
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
                        if (snapshot.connectionState == ConnectionState.done &&
                            _cameraController != null &&
                            _cameraController!.value.isInitialized) {
                          return SizedBox(
                              width: size.width,
                              height: size.width,
                              child: AspectRatio(
                                aspectRatio: (_cameraController
                                                ?.value.aspectRatio ??
                                            0) <
                                        0.001
                                    ? 1.0
                                    : 1 / _cameraController!.value.aspectRatio,
                                child: CameraPreview(_cameraController!),
                              ));
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
                    const SizedBox(height: 50),
                    // 카메라 앱 작동시 이미지 품질 검증에 필요한 사항, 얼굴 외곽선 등을 표시하는 부분
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ref
                                        .read(imageQualityProvider.notifier)
                                        .frontal ==
                                    true
                                ? KioskButtonTheme
                                    .shootingIndicationButtonInactiveTheme
                                : KioskButtonTheme
                                    .shootingIndicationButtonActiveTheme,
                            child: const Text('정면을 주시하세요'),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ref
                                        .read(imageQualityProvider.notifier)
                                        .exposure ==
                                    true
                                ? KioskButtonTheme
                                    .shootingIndicationButtonInactiveTheme
                                : KioskButtonTheme
                                    .shootingIndicationButtonActiveTheme,
                            child: const Text('얼굴 조명을 균일하게'),
                          ),
                        ]),
                    const SizedBox(height: 20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ref
                                        .read(imageQualityProvider.notifier)
                                        .eyesOpen ==
                                    true
                                ? KioskButtonTheme
                                    .shootingIndicationButtonInactiveTheme
                                : KioskButtonTheme
                                    .shootingIndicationButtonActiveTheme,
                            child: const Text('눈을 뜨세요'),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ref
                                        .read(imageQualityProvider.notifier)
                                        .mouseNotOpen ==
                                    true
                                ? KioskButtonTheme
                                    .shootingIndicationButtonInactiveTheme
                                : KioskButtonTheme
                                    .shootingIndicationButtonActiveTheme,
                            child: const Text('입을 벌리지 마세요'),
                          ),
                        ]),
                    const SizedBox(height: 50),
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
                  height: 300,
                  color: Colors.black.withOpacity(0.5),
                  alignment: Alignment.center,
                  child: Center(
                    child: GestureDetector(
                      onTap: () async {
                        try {
                          await _cameraController!.takePicture().then((value) {
                            captureImage = File(value.path);
                          });

                          final imageBytes = captureImage!.readAsBytesSync();
                          final multipartFile = MultipartFile.fromBytes(
                              imageBytes,
                              filename: "my_image.jpg",
                              contentType: MediaType("image", "jpeg"));

                          final data = FormData();
                          data.files.add(MapEntry(
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
                            logger.d(response.data);

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
                      child: const SizedBox(
                        height: 192.0,
                        width: 192.0,
                        child: Image(
                          image: AssetImage('assets/icons/ic_btn_shooting.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
    );
  }
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
