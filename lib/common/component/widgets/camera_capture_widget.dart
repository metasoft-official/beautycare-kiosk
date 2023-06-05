import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraExample extends StatefulWidget {
  const CameraExample({super.key});

  static String get routeName => 'camera';

  @override
  _CameraExampleState createState() => _CameraExampleState();
}

class _CameraExampleState extends State<CameraExample> {
  CameraController? _cameraController;
  Future<void>? _initCameraControllerFuture;
  int cameraIndex = 0;

  bool isCapture = false;
  File? captureImage;

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Camera Example"),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.camera),
        //   // Provide an onPressed callback.
        //   onPressed: () async {
        //     try {
        //       // Ensure the camera is initialized.
        //       await _initCameraControllerFuture;
        //
        //       // Attempt to take a picture and log where it's been saved.
        //       final image = await _cameraController?.takePicture();
        //       print('Picture saved at ${image?.path}');
        //     } catch (e) {
        //       // If an error occurs, log the error to the console.
        //       print(e);
        //     }
        //   },
        // ),
        body: isCapture
            ? Stack(children: [
                Column(
                  children: [
                    /// 촬영 된 이미지 출력
                    Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: Container(
                        width: size.width,
                        height: size.width,
                        child: ClipRect(
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: SizedBox(
                              width: size.width,
                              child: AspectRatio(
                                aspectRatio:
                                    1 / _cameraController!.value.aspectRatio,
                                child: Container(
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: MemoryImage(
                                        captureImage!.readAsBytesSync()),
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: InkWell(
                        onTap: () {
                          /// 재촬영 선택시 카메라 삭제 및 상태 변경
                          captureImage!.delete();
                          captureImage = null;
                          setState(() {
                            isCapture = false;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              SizedBox(height: 16.0),
                              Text(
                                "다시 찍기",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ])
            : Stack(children: [
                Column(
                  children: [
                    Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: FutureBuilder<void>(
                        future: _initCameraControllerFuture,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return SizedBox(
                              width: size.width,
                              height: size.width,
                              child: ClipRect(
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: SizedBox(
                                    width: size.width,
                                    child: AspectRatio(
                                        aspectRatio: 1 /
                                            _cameraController!
                                                .value.aspectRatio,
                                        child:
                                            CameraPreview(_cameraController!)),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 48.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
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
                                height: 80.0,
                                width: 80.0,
                                padding: const EdgeInsets.all(1.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.black, width: 1.0),
                                  color: Colors.white,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.black, width: 3.0),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    // 카메라 앱 작동시 이미지 품질 검증에 필요한 사항, 얼굴 외곽선 등을 표시하는 부분
                    Text(''),
                  ],
                ),
              ]));
  }
}
