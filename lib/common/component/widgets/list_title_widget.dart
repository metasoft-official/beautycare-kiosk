import 'package:flutter/material.dart';

import 'package:beauty_care/common/component/mixins/mark_texts_mixin.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';

class ListTitleWidget extends StatelessWidget {
  const ListTitleWidget(
      {Key? key, this.markText, required this.text, this.onTap, this.btnText})
      : super(key: key);

  final String? markText;
  final String text;
  final dynamic onTap;
  final String? btnText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 제목
            markText != null
                ? Expanded(
                    child: RichText(
                      text: TextSpan(
                          style: AppTextTheme.black20m,
                          children: markTextsMixin(
                              text, markText!, AppTextTheme.blue20b)),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  )
                : Expanded(
                    child: Text(
                      text,
                      style: AppTextTheme.black20b,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
            // 더보기
            InkWell(
              onTap: onTap,
              child: Row(
                children: [
                  Text(btnText ?? '더보기', style: AppTextTheme.blue12b),
                  // 화살표
                  const Icon(
                    Icons.navigate_next,
                    size: 16,
                    color: AppColor.appColor,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
