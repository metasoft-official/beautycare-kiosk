import 'package:flutter/material.dart';

import '../layout/app_color.dart';
import '../layout/app_text.dart';

// 메인 배너 레이아웃
// 바탕 + 버튼
class HomeBannerCtaLayout extends StatelessWidget {
  const HomeBannerCtaLayout({
    Key? key,
    required this.type,
    required this.widget,
    this.onPressed,
  }) : super(key: key);

  final String type;
  final Widget widget;
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(44, 40, 44, 28),
      color: type == 'surgery' ? AppColor.primary : AppColor.blue,
      child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              widget,
              // 버튼
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: type == 'surgery'
                            ? AppColor.semiBlue
                            : AppColor.deepBlue,
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
                              type == 'surgery' ? '피부질환 예측하기' : '피부MBTI 예측하기',
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
          )),
    );
  }
}
