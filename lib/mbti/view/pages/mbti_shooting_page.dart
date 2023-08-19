import 'package:beauty_care/common/component/widgets/button_bottom_navigation_bar.dart';
import 'package:beauty_care/common/component/widgets/camera_capture_widget.dart';
import 'package:beauty_care/common/component/widgets/loading_circle_animation_widget.dart';
import 'package:beauty_care/common/component/widgets/pre_check_list_widget.dart';
import 'package:beauty_care/mbti/provider/caemra_provider.dart';
import 'package:beauty_care/mbti/view/widgets/survey_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
      body: Stack(
        children: [
          CameraWidget(
            isDisease: false,
            onInitialized: () {
              ref.read(cameraStateProvider.notifier).state = true;
            },
          ),
          // if (ref.watch(cameraStateProvider) == false)
          //   Positioned.fill(
          //     child: Container(
          //       color: Colors.black.withOpacity(0.7),
          //       child: const Center(
          //         child: LoadingCircleAnimationWidget(),
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
