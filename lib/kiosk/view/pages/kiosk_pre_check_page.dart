import 'package:beauty_care/common/component/widgets/camera_capture_widget.dart';
import 'package:beauty_care/common/component/widgets/pre_check_list_widget.dart';
import 'package:beauty_care/common/layout/kiosk_button_theme.dart';
import 'package:beauty_care/common/layout/kiosk_text.dart';
import 'package:beauty_care/kiosk/view/widgets/kiosk_app_bar.dart';
import 'package:beauty_care/mbti/view/widgets/survey_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';

import 'package:beauty_care/common/component/widgets/button_bottom_navigation_bar.dart';
import 'package:beauty_care/common/component/widgets/pre_check_list_widget.dart';
import 'package:simple_shadow/simple_shadow.dart';

class KioskPreCheckPage extends ConsumerWidget {
  final String? type;
  const KioskPreCheckPage({super.key, this.type});

  static String get routeName => 'kioskPreCheck';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 1))
                ],
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(90),
                    bottomRight: Radius.circular(90))),
            child: Column(children: [
              const KioskAppBar(),
              const SizedBox(height: 30),
              Text(
                '피부$type 진단을 위한 촬영이 있습니다.',
                style: KioskTextTheme.black56b,
              ),
              const Text('촬영 한 번으로 피부 질환을 예측해드릴게요!',
                  style: KioskTextTheme.middleGrey42m),

              const SizedBox(height: 30),
              //이미지
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 30),
                    child: SimpleShadow(
                      offset: const Offset(0, 0),
                      sigma: 0.1,
                      child: Image.asset('assets/images/kiosk_pre_check.png',
                          width: 325),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '촬영화면이 나오면,',
                        style: KioskTextTheme.black42,
                      ),
                      RichText(
                          text: const TextSpan(children: [
                        TextSpan(
                            text: '하단의 버튼을 터치', style: KioskTextTheme.blue42m),
                        TextSpan(text: '해', style: KioskTextTheme.black42),
                      ])),
                      const Text(
                        '촬영을 진행할 수 있어요.',
                        style: KioskTextTheme.black42,
                      ),
                    ],
                  )
                ],
              ),
            ]),
          ),
          const SizedBox(height: 72),
          // 주의사항
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 72, vertical: 50),
            margin: const EdgeInsets.symmetric(horizontal: 72),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/ic_no_makeup.png', width: 72),
                const SizedBox(width: 50),
                RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                        text: '화장하지 않은 상태', style: KioskTextTheme.black48b),
                    TextSpan(text: '로 진단하세요', style: KioskTextTheme.black48m),
                  ]),
                )
              ],
            ),
          ),
          const SizedBox(height: 36),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 72, vertical: 50),
            margin: const EdgeInsets.symmetric(horizontal: 72),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/ic_no_hair.png', width: 72),
                const SizedBox(width: 50),
                RichText(
                  text: const TextSpan(children: [
                    TextSpan(text: '앞머리는 넘긴 채', style: KioskTextTheme.black48b),
                    TextSpan(text: '로 유지해주세요', style: KioskTextTheme.black48m),
                  ]),
                )
              ],
            ),
          ),
          const SizedBox(height: 36),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 72, vertical: 50),
            margin: const EdgeInsets.symmetric(horizontal: 72),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/ic_no_acc.png', width: 72),
                const SizedBox(width: 50),
                RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                        text: '안경, 마스크, 모자', style: KioskTextTheme.black48b),
                    TextSpan(text: '는 벗어주세요', style: KioskTextTheme.black48m),
                  ]),
                )
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 72, vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: KioskButtonTheme.outlinedBasicButtonTheme,
                    onPressed: () => context.goNamed('kioskHome'),
                    icon: const Icon(
                      Icons.home_filled,
                      size: 70,
                      color: AppColor.appColor,
                    ),
                    label: const Text('괜찮아요', style: KioskTextTheme.blue48b),
                  ),
                ),
                const SizedBox(width: 36),
                Expanded(
                  child: ElevatedButton(
                    style: KioskButtonTheme.basicElevatedButtonTheme,
                    onPressed: () => context.go('/kiosk-shooting?type=$type'),
                    child: const Text('할래요', style: KioskTextTheme.white48b),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
