import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/layout/app_box_theme.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/kiosk_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../common/provider/splash_mobile_provider.dart';

class KioskMainPage extends ConsumerStatefulWidget {
  const KioskMainPage({super.key});

  static String get routeName => 'kioskMain';
  @override
  KioskMainState createState() => KioskMainState();
}

class KioskMainState extends ConsumerState<KioskMainPage> {
  late VideoPlayerController controller;
  String splashImgId = '';

  @override
  void initState() {
    super.initState();
    loadSplashImage();
    // controller = VideoPlayerController.asset
    //   ..initialize().then((value) {
    //     setState(() {});
    //     controller.play();
    //     controller.setLooping(true);
    //   });
  }

  void loadSplashImage() async {
    final response =
        await ref.read(splashMobileRepositoryProvider).getSplashMobileByQuery();
    splashImgId = response?.items?.first.imageId.toString() ?? '';
    setState(
        () {}); // Update the state to trigger a rebuild with the loaded image URL
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => context.goNamed('kioskHome'),
        child: Stack(
          children: [
            // controller.value.isInitialized
            //     ? SizedBox.expand(
            //         child: FittedBox(
            //           fit: BoxFit.cover,
            //           child: SizedBox(
            //               width: controller.value.size.width,
            //               height: controller.value.size.height,
            //               child: VideoPlayer(controller)),
            //         ),
            //       )
            //     : const SizedBox(),
            Container(
              // child: SizedBox.expand(
              //   child: FittedBox(
              //     fit: BoxFit.cover,
              //     child: Image.network(
              //       '${Strings.imageUrl}$splashImgId',
              //       fit: BoxFit.cover,
              //       // 네트워크 Empty 예외처리
              //       errorBuilder: (BuildContext context, Object exception,
              //           StackTrace? stackTrace) {
              //         return Image.asset(
              //           'assets/images/splash_01.png',
              //           fit: BoxFit.cover,
              //         );
              //       },
              //     ),
              //   ),
              // ),
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                const Color(0xFFCDE1F9).withOpacity(0.6),
                const Color(0xFFECF8FF).withOpacity(0.6),
                const Color(0xFFC9DDF6).withOpacity(0.6)
              ])),
              child: Center(
                child: Column(children: [
                  const SizedBox(height: 110),
                  const Text(
                    '얼굴 인식으로 간편하게!',
                    style: KioskTextTheme.blue54m,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '피부질환 및 피부MBTI를\n예측해보세요.',
                    style: KioskTextTheme.black54b,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 140, vertical: 50),
                    margin: const EdgeInsets.symmetric(horizontal: 72),
                    decoration: AppBoxTheme.basicShadowWhiteBoxTheme.copyWith(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/oxygen_logo.png',
                          width: 500,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(height: 20),
                        Image.asset(
                          'assets/images/kiosk_main_banni.png',
                          width: 300,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(height: 25.h),
                        const Text(
                          '방문을 환영합니다',
                          style: KioskTextTheme.blue42b,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 80),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    color: AppColor.appColor,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/ic_round-touch-app.png',
                          width: 80.w,
                        ),
                        SizedBox(width: 8.w),
                        const Text('화면을 터치해 주세요.',
                            style: KioskTextTheme.white48b)
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
