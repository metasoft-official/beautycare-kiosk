import 'package:beauty_care/common/component/widgets/button_bottom_navigation_bar.dart';
import 'package:beauty_care/common/component/widgets/camera_capture_widget.dart';
import 'package:beauty_care/common/component/widgets/pre_check_list_widget.dart';
import 'package:beauty_care/mbti/view/widgets/survey_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PredictSkinDiseasePage extends ConsumerWidget {
  const PredictSkinDiseasePage({super.key});

  static String get routeName => 'predictSkinDisease';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI 피부 질환 예측하기'),
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
        child: const CameraWidget(isDisease: true),
      )),
    );
  }
}
