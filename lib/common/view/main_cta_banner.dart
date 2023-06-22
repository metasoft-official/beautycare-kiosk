import 'package:flutter/material.dart';

import '../layout/app_color.dart';
import '../layout/app_text.dart';

class MainCtaBanner extends StatelessWidget {
  const MainCtaBanner({
    Key? key,
    this.color,
    required this.title,
    required this.caption,
    required this.btnText,
    this.onPressed,
  }) : super(key: key);

  final Color? color;
  final String title;
  final String caption;
  final String btnText;
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(44, 40, 44, 28),
      color: color ?? AppColor.primary,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 타이틀
            Text(title, style: AppTextTheme.white24b),

            const SizedBox(height: 8),
            // 캡션
            Text(
              caption,
              style: AppTextTheme.white14m,
            ),

            const SizedBox(height: 70),

            // 버튼
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.semiBlue),
                  onPressed: onPressed,
                  child: Text(btnText),
                ))
          ],
        ),
      ),
    );
  }
}
