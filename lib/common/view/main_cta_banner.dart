import 'package:flutter/material.dart';

import '../../main.dart';
import '../component/mixins/mark_texts_mixin.dart';
import '../layout/app_color.dart';
import '../layout/app_text.dart';

class MainCtaBanner extends StatelessWidget {
  const MainCtaBanner({
    Key? key,
    this.color,
    required this.title,
    required this.markText,
    required this.caption,
    required this.btnText,
    this.onPressed,
    required this.imgUrl,
  }) : super(key: key);

  final Color? color;
  final String title;
  final String markText;
  final String caption;
  final String btnText;
  final String imgUrl;
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(44, 40, 44, 28),
      color: color ?? AppColor.primary,
      child: SizedBox(
        width: double.infinity,
        child: Stack(children: [
          // 배경 이미지
          Positioned(
            bottom: 4,
            right: -30,
            child: Image.asset(imgUrl, width: 240),
          ),

          // 내용 및 버튼
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 타이틀
              RichText(
                  text: TextSpan(
                      children:
                          markTexts(title, markText, AppTextTheme.yellow24b),
                      style: AppTextTheme.white24b)),
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
                        backgroundColor: AppColor.semiBlue,
                        padding: const EdgeInsets.fromLTRB(0, 9, 0, 9)),
                    onPressed: onPressed,
                    child: SizedBox(
                      width: double.infinity,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 버튼 이름
                            Text(
                              btnText,
                              style: AppTextTheme.white16b,
                            ),
                            // 화살표
                            const Icon(
                              Icons.navigate_next,
                              size: 26,
                            )
                          ]),
                    ),
                  ))
            ],
          ),
        ]),
      ),
    );
  }
}
