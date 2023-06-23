import 'package:flutter/material.dart';

import '../../layout/app_color.dart';
import '../../layout/app_text.dart';
import '../mixins/mark_texts_mixin.dart';

class ListTitleWidget extends StatelessWidget {
  const ListTitleWidget(
      {Key? key, required this.markText, required this.text, this.onTap})
      : super(key: key);

  final String markText;
  final String text;
  final dynamic onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
      child: Row(
        children: [
          // 제목
          RichText(
            text: TextSpan(
                style: AppTextTheme.black20b,
                children: markTextsMixin(text, markText, AppTextTheme.blue20b)),
          ),
          const Spacer(),
          // 더보기
          InkWell(
            onTap: onTap,
            child: Row(
              children: const [
                Text('더보기', style: AppTextTheme.blue12b),
                // 화살표
                Icon(
                  Icons.navigate_next,
                  size: 16,
                  color: AppColor.appColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
