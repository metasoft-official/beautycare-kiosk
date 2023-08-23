import 'package:flutter/cupertino.dart';

import '../../../common/layout/app_text.dart';

class CustomLeftTextTitle extends StatelessWidget {
  const CustomLeftTextTitle({super.key, required this.title, this.height});

  final String title;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: RichText(
              text: TextSpan(children: [
            TextSpan(text: title, style: AppTextTheme.black12b),
            const TextSpan(text: ' *', style: AppTextTheme.red12b),
          ])),
        ),
        SizedBox(height: height ?? 8)
      ],
    );
  }
}
