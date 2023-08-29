import 'package:beauty_care/common/layout/app_color.dart';
import 'package:flutter/material.dart';
import 'package:beauty_care/common/layout/kiosk_button_theme.dart';
import 'package:beauty_care/common/layout/kiosk_text.dart';

class KioskBottomButtonWidget extends StatelessWidget {
  const KioskBottomButtonWidget({
    super.key,
    this.firstText,
    this.firstIcon,
    this.secondText,
    this.secondIcon,
    this.firstOnPressed,
    this.secondOnPressed,
  });

  final String? firstText;
  final bool? firstIcon;
  final String? secondText;
  final bool? secondIcon;
  final dynamic firstOnPressed;
  final dynamic secondOnPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(72, 30, 72, 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: firstIcon == true
                  ? ElevatedButton.icon(
                      style: KioskButtonTheme.outlinedBasicButtonTheme,
                      onPressed: firstOnPressed,
                      icon: const Icon(
                        Icons.home_filled,
                        size: 50,
                        color: AppColor.appColor,
                      ),
                      label: Text(firstText ?? '괜찮아요',
                          style: KioskTextTheme.blue36b),
                    )
                  : ElevatedButton(
                      style: KioskButtonTheme.outlinedBasicButtonTheme,
                      onPressed: firstOnPressed,
                      child: Text(firstText ?? '다시 측정하기',
                          style: KioskTextTheme.blue36b),
                    ),
            ),
            const SizedBox(width: 36),
            Expanded(
              child: secondIcon == true
                  ? ElevatedButton.icon(
                      style: KioskButtonTheme.basicElevatedButtonTheme,
                      onPressed: secondOnPressed,
                      icon: const Icon(
                        Icons.home_filled,
                        size: 50,
                        color: Colors.white,
                      ),
                      label: Text(secondText ?? '홈으로',
                          style: KioskTextTheme.white36b),
                    )
                  : ElevatedButton(
                      style: KioskButtonTheme.basicElevatedButtonTheme,
                      onPressed: secondOnPressed,
                      child: Text(secondText ?? '할래요',
                          style: KioskTextTheme.white36b),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
