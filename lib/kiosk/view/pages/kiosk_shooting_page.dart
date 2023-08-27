import 'package:beauty_care/common/component/widgets/button_bottom_navigation_bar.dart';
import 'package:beauty_care/common/component/widgets/camera_capture_widget.dart';
import 'package:beauty_care/common/component/widgets/loading_circle_animation_widget.dart';
import 'package:beauty_care/common/component/widgets/pre_check_list_widget.dart';
import 'package:beauty_care/kiosk/view/widgets/kiosk_camera_capture_widget.dart';
import 'package:beauty_care/mbti/provider/caemra_provider.dart';
import 'package:beauty_care/mbti/view/widgets/survey_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KioskShootingPage extends ConsumerWidget {
  const KioskShootingPage({super.key, this.type});

  final String? type;
  static String get routeName => 'kioskShooting';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          KioskCameraCaptureWidget(
            isDisease: type == '질환' ? true : false,
            onInitialized: () {
              ref.read(cameraStateProvider.notifier).state = true;
            },
          ),
        ],
      ),
    );
  }
}
