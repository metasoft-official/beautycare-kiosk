import 'dart:convert';

import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/layout/kiosk_button_theme.dart';
import 'package:beauty_care/kiosk/provider/kiosk_provider.dart';
import 'package:beauty_care/kiosk/view/widgets/kiosk_camera_capture_widget.dart';
import 'package:beauty_care/mbti/provider/caemra_provider.dart';
import 'package:beauty_care/mbti/provider/user_disease_provider.dart';
import 'package:beauty_care/user/model/user_disease_model.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:async';

import 'package:camera_platform_interface/camera_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import '../../../main.dart';
import 'dart:io';
import 'package:beauty_care/common/layout/kiosk_text.dart';
import 'package:beauty_care/kiosk/view/widgets/kiosk_app_bar.dart';
import 'package:go_router/go_router.dart';

import 'package:beauty_care/common/layout/app_color.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

class KioskShootingPage extends ConsumerStatefulWidget {
  const KioskShootingPage({super.key, this.type});

  final String? type;
  static String get routeName => 'kioskShooting';

  @override
  KioskShootingState createState() => KioskShootingState();
}

class KioskShootingState extends ConsumerState<KioskShootingPage> {
  String _cameraInfo = 'Unknown';
  List<CameraDescription> _cameras = <CameraDescription>[];
  bool isCapture = false;
  int _cameraIndex = 0;
  int _cameraId = -1;
  bool _initialized = false;
  bool _recording = false;
  bool _recordingTimed = false;
  bool _recordAudio = true;
  bool _previewPaused = false;
  Size? _previewSize;
  XFile? file;
  File? captureImage;
  String? log;
  // bool _setCamera = false;
  ResolutionPreset _resolutionPreset = ResolutionPreset.veryHigh;
  StreamSubscription<CameraErrorEvent>? _errorStreamSubscription;
  StreamSubscription<CameraClosingEvent>? _cameraClosingStreamSubscription;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    _fetchCameras();
    _initializeCamera();
  }

  @override
  void dispose() {
    _disposeCurrentCamera();
    _errorStreamSubscription?.cancel();
    _errorStreamSubscription = null;
    _cameraClosingStreamSubscription?.cancel();
    _cameraClosingStreamSubscription = null;
    super.dispose();
  }

  /// Fetches list of available cameras from camera_windows plugin.
  Future<void> _fetchCameras() async {
    String cameraInfo;
    List<CameraDescription> cameras = <CameraDescription>[];

    int cameraIndex = 0;
    try {
      cameras = await CameraPlatform.instance.availableCameras();
      if (cameras.isEmpty) {
        cameraInfo = 'No available cameras';
      } else {
        cameraIndex = _cameraIndex % cameras.length;
        cameraInfo = 'Found camera: ${cameras[cameraIndex].name}';
      }
    } on PlatformException catch (e) {
      cameraInfo = 'Failed to get cameras: ${e.code}: ${e.message}';
    }
    if (mounted) {
      setState(() {
        _cameraIndex = cameraIndex;
        _cameras = cameras;
        _cameraInfo = cameraInfo;
      });
    }
  }

  /// 로지텍이 인식되면 카메라 생성
  Future<void> _initializeCamera() async {
    assert(!_initialized);

    // 사용가능 카메라가 없는 경우
    if (_cameras.isEmpty) {
      return;
    }

    int cameraId = -1;
    try {
      final int cameraIndex = _cameraIndex % _cameras.length;
      final CameraDescription camera = _cameras[cameraIndex];

      cameraId = await CameraPlatform.instance.createCamera(
        camera,
        _resolutionPreset,
        enableAudio: _recordAudio,
      );

      unawaited(_errorStreamSubscription?.cancel());
      _errorStreamSubscription = CameraPlatform.instance
          .onCameraError(_cameraId)
          .listen(_onCameraError);

      unawaited(_cameraClosingStreamSubscription?.cancel());
      _cameraClosingStreamSubscription = CameraPlatform.instance
          .onCameraClosing(_cameraId)
          .listen(_onCameraClosing);

      final Future<CameraInitializedEvent> initialized =
          CameraPlatform.instance.onCameraInitialized(_cameraId).first;

      await CameraPlatform.instance.initializeCamera(
        _cameraId,
      );

      final CameraInitializedEvent event = await initialized;
      _previewSize = Size(
        event.previewWidth,
        event.previewHeight,
      );

      if (mounted) {
        setState(() {
          _initialized = true;
          _cameraId = cameraId;
          _cameraIndex = cameraIndex;
          _cameraInfo = 'Capturing camera: ${camera.name}';
        });
      }
    } on CameraException catch (e) {
      try {
        if (_cameraId >= 0) {
          await CameraPlatform.instance.dispose(_cameraId);
        }
      } on CameraException catch (e) {
        debugPrint('Failed to dispose camera: ${e.code}: ${e.description}');
      }

      // Reset state.
      if (mounted) {
        setState(() {
          _initialized = false;
          _cameraId = -1;
          _cameraIndex = 0;
          _previewSize = null;
          _recording = false;
          _recordingTimed = false;
          _cameraInfo =
              'Failed to initialize camera: ${e.code}: ${e.description}';
        });
      }
    }
  }

  Future<void> _disposeCurrentCamera() async {
    if (_cameraId >= 0 && _initialized) {
      try {
        await CameraPlatform.instance.dispose(_cameraId);

        if (mounted) {
          setState(() {
            _initialized = false;
            _cameraId = -1;
            _previewSize = null;
            _cameraInfo = 'Camera disposed';
          });
        }
      } on CameraException catch (e) {
        if (mounted) {
          setState(() {
            _cameraInfo =
                'Failed to dispose camera: ${e.code}: ${e.description}';
          });
        }
      }
    }
  }

  Widget _buildPreview() {
    return CameraPlatform.instance.buildPreview(_cameraId);
  }

  Future<XFile?> _takePicture() async {
    setState(() {
      isCapture = true;
    });
    file = await CameraPlatform.instance.takePicture(_cameraId);
    logger.d('Picture captured to: ${file?.path}');
    return file;
  }

  Future<void> _togglePreview() async {
    if (_initialized && _cameraId >= 0) {
      if (!_previewPaused) {
        await CameraPlatform.instance.pausePreview(_cameraId);
      } else {
        await CameraPlatform.instance.resumePreview(_cameraId);
      }
      if (mounted) {
        setState(() {
          _previewPaused = !_previewPaused;
        });
      }
    }
  }

  Future<void> _switchCamera() async {
    if (_cameras.isNotEmpty) {
      // select next index;
      _cameraIndex = (_cameraIndex + 1) % _cameras.length;
      if (_initialized && _cameraId >= 0) {
        await _disposeCurrentCamera();
        await _fetchCameras();
        if (_cameras.isNotEmpty) {
          await _initializeCamera();
        }
      } else {
        await _fetchCameras();
      }
    }
  }

  void _onCameraError(CameraErrorEvent event) {
    if (mounted) {
      _scaffoldMessengerKey.currentState?.showSnackBar(
          SnackBar(content: Text('Error: ${event.description}')));

      // Dispose camera on camera error as it can not be used anymore.
      _disposeCurrentCamera();
      _fetchCameras();
    }
  }

  void _onCameraClosing(CameraClosingEvent event) {
    if (mounted) {
      _showInSnackBar('Camera is closing');
    }
  }

  void _showInSnackBar(String message) {
    _scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
    ));
  }

  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final imageQualityNotifier = ref.read(imageQualityProvider);

    final List<DropdownMenuItem<ResolutionPreset>> resolutionItems =
        ResolutionPreset.values
            .map<DropdownMenuItem<ResolutionPreset>>((ResolutionPreset value) {
      return DropdownMenuItem<ResolutionPreset>(
        value: value,
        child: Text(value.toString()),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
      ),
      body: isCapture
          ? SizedBox(
              height: size.height,
              child: Column(children: [
                const KioskAppBar(),

                /// 촬영 된 이미지 출력
                if (captureImage != null) ...[
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
                  )
                ],
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

                            if (widget.type == "질환") {
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
                                  userId: 1,
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
                                logger.e(e);
                              }
                            }
                            // 피부 MBTI
                            else {
                              logger.d("MBTI");
                              context.pushNamed('KioskSurvey');
                            }
                          },
                          child: const Text(
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
                    fit: FlexFit.tight,
                    child: FutureBuilder<void>(
                      future: _initializeCamera(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            _initialized &&
                            _cameraId > 0 &&
                            _previewSize != null) {
                          return AspectRatio(
                              aspectRatio:
                                  _previewSize!.width / _previewSize!.height,
                              child: _buildPreview());
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                  Text(_cameraInfo)
                ],
              ),
              // 하단 영역
              Column(
                children: [
                  if (!widget.type!.contains('질환')) ...[
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
                          await _takePicture().then((value) {
                            captureImage = File(file?.path ?? '');
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
