import 'dart:io';
import 'package:beauty_care/common/dio/diagnosis_api.dart';
import 'package:beauty_care/common/layout/app_button_theme.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/main.dart';
import 'package:beauty_care/mbti/provider/diagnosis_provider.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:http_parser/http_parser.dart';
import 'package:beauty_care/common/const/values.dart';

class CameraWidget extends ConsumerStatefulWidget {
  const CameraWidget({super.key});

  static String get routeName => 'camera';

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
    });
  }

  @override
  void dispose() {
    _cameraController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var image = null;

    final diagnosisApi = ref.read(diagnosisProvider);

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
                    // child: Container(
                    //   width: size.width,
                    //   height: size.width,
                    // child: ClipRect(
                    //   child: FittedBox(
                    //     fit: BoxFit.fitWidth,
                    child: SizedBox(
                      width: size.width,
                      height: size.height,
                      child: Container(
                        color: AppColor.black,
                        child: AspectRatio(
                          aspectRatio: 1 / _cameraController!.value.aspectRatio,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(16, 20, 16, 80),
                            child: Image(
                              image:
                                  MemoryImage(captureImage!.readAsBytesSync()),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // 하단 영역
              Column(children: [
                Positioned(
                  // left: 16.0,
                  bottom: 16.0,
                  child: Container(
                    color: Colors.grey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: AppButtonTheme.outlinedBasicButtonTheme,
                            onPressed: () {},
                            child: Text('재촬영'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: AppButtonTheme.basicElevatedButtonTheme,
                            onPressed: () async {
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

                                // Success handling
                                print(response.data);
                              } catch (e) {
                                // Error handling
                                print(e);
                              }

                              // await diagnosisApi
                              //     .uploadDiagnosisImage(multipartFile);
                            },
                            child: Text('확인'),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                      future: _initCameraControllerFuture,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return SizedBox(
                            width: size.width,
                            height: size.width,
                            child: AspectRatio(
                                aspectRatio:
                                    1 / _cameraController!.value.aspectRatio,
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
                  // 카메라 앱 작동시 이미지 품질 검증에 필요한 사항, 얼굴 외곽선 등을 표시하는 부분
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('정면을 주시하세요'),
                          style: AppButtonTheme
                              .shootingIndicationButtonInactiveTheme,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('얼굴 조명을 균일하게'),
                          style: AppButtonTheme
                              .shootingIndicationButtonActiveTheme,
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('눈을 뜨세요'),
                          style: AppButtonTheme
                              .shootingIndicationButtonInactiveTheme,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('입을 벌리지 마세요'),
                          style: AppButtonTheme
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
                                    Image.file(
                                        File(userImage.path),
                                        fit: BoxFit.cover,
                                      )
                                    : const Icon(Icons.add_box_outlined))),
                      ),

                      GestureDetector(
                        onTap: () async {
                          try {
                            await _cameraController!
                                .takePicture()
                                .then((value) {
                              captureImage = File(value.path);
                            });

                            /// 화면 상태 변경 및 이미지 저장
                            setState(() {
                              isCapture = true;
                            });
                          } catch (e) {
                            print("$e");
                          }
                        },
                        // 카메라 버튼 색깔 변경하기
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
}
