import 'package:beauty_care/common/layout/app_box_theme.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/kiosk_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class KioskMainPage extends StatelessWidget {
  const KioskMainPage({super.key});

  static String get routeName => 'kioskMain';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => context.goNamed('kioskHome'),
        child: Container(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 140, vertical: 50),
                margin: const EdgeInsets.symmetric(horizontal: 72),
                decoration: AppBoxTheme.basicShadowWhiteBoxTheme.copyWith(
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
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
                padding: EdgeInsets.symmetric(vertical: 30),
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
                    const Text('화면을 터치해 주세요.', style: KioskTextTheme.white48b)
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
