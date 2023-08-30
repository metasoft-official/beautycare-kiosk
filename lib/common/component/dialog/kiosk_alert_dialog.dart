import 'package:beauty_care/common/layout/app_button_theme.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/common/layout/kiosk_button_theme.dart';
import 'package:beauty_care/common/layout/kiosk_text.dart';
import 'package:beauty_care/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class KioskAlertDialog extends StatelessWidget {
  const KioskAlertDialog(
      {super.key,
      required this.content,
      this.btnMessage,
      this.confirmBtnMessage,
      this.confirmOnPressed});

  final String content;
  final String? btnMessage;
  final String? confirmBtnMessage;
  final dynamic confirmOnPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(50, 30, 50, 20),
      elevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      content: Text(
        content,
        style: AppTextTheme.blue36b,
        textAlign: TextAlign.center,
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: KioskButtonTheme.roundedElevatedButtonTheme,
                      onPressed: confirmOnPressed,
                      child: Text(confirmBtnMessage ?? '저장',
                          style:
                              KioskTextTheme.white36m.copyWith(height: 1.0))),
                ),
                TextButton(
                    onPressed: () => context.pop(),
                    child: Text(btnMessage ?? '취소',
                        style: KioskTextTheme.middleGrey24
                            .copyWith(decoration: TextDecoration.underline)))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
