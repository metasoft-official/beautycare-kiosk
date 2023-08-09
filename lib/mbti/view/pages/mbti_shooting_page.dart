import 'package:beauty_care/common/component/widgets/button_bottom_navigation_bar.dart';
import 'package:beauty_care/common/component/widgets/camera_capture_widget.dart';
import 'package:beauty_care/common/component/widgets/pre_check_list_widget.dart';
import 'package:beauty_care/mbti/view/widgets/survey_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/layout/app_button_theme.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/mbti/provider/quiz_state_provider.dart';

class MBTIShootingPage extends ConsumerWidget {
  const MBTIShootingPage({super.key});

  static String get routeName => 'mbtiShooting';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('피부 MBTI 예측하기'),
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_outlined)),
      ),
      body: Container(
          child: Container(
        alignment: Alignment.center,
        // margin: const EdgeInsets.fromLTRB(0, 40, 0, 20),
        child: CameraWidget(),
      )),
    );
    // bottomNavigationBar: ButtonBottomNavigationBarWidget(
    //   buttonColor: AppColor.appColor,
    //   textStyle: AppTextTheme.white14b,
    //   label: '확인 후 촬영하기',
    //   onPressed: () {},
    // ));
  }
}
