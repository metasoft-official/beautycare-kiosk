import 'package:beauty_care/common/layout/app_button_theme.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FailedDialog extends StatelessWidget {
  const FailedDialog({super.key, required this.content, this.btnMessage});

  final String content;
  final String? btnMessage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.only(top: 16),
      elevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      content: Text(
        content,
        style: AppTextTheme.blue16b,
        textAlign: TextAlign.center,
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ElevatedButton(
              style: AppButtonTheme.roundedElevatedButtonTheme,
              child: Text(btnMessage ?? '확인',
                  style: AppTextTheme.white14b.copyWith(height: 1.0)),
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ),
      ],
    );
  }
}
