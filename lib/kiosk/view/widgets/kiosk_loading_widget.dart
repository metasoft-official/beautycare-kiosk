import 'package:beauty_care/common/component/widgets/mark_texts_widget.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/common/layout/kiosk_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KioskLoadingWidget extends ConsumerStatefulWidget {
  const KioskLoadingWidget({super.key});

  @override
  KioskLoadingState createState() => KioskLoadingState();
}

class KioskLoadingState extends ConsumerState<KioskLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> sizeAnimation;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    sizeAnimation = Tween<double>(
      begin: 80.0,
      end: 160.0,
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) => Center(
                  child: Opacity(
                    opacity: opacityAnimation.value,
                    child: Container(
                      width: sizeAnimation.value,
                      height: sizeAnimation.value,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: AppColor.blue),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const MarkTextsWidget(
                defaultTextStyle: KioskTextTheme.black60b,
                text: '로딩 중 입니다.',
                markText: '로딩',
                markTextStyle: KioskTextTheme.blue60b),
            const SizedBox(
              height: 8,
            ),
            const Text(
              '조금만 기다려주세요!',
              style: AppTextTheme.middleGrey14m,
            )
          ],
        ),
      ),
    );
  }
}
