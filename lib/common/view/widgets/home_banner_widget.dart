import 'package:beauty_care/common/view/widgets/home_banner_cta_layout.dart';
import 'package:flutter/material.dart';

import '../../component/mixins/mark_texts_mixin.dart';
import 'package:beauty_care/common/layout/app_text.dart';

// 홈 메인 배너
// 메인 배너 레이아웃 + 타이틀 + 캡션 + 이미지 + 추가 위젯
class HomeBannerWidget extends StatelessWidget {
  const HomeBannerWidget(
      {Key? key,
      required this.type,
      this.title,
      this.markText,
      this.caption,
      this.onPressed,
      this.imgUrl,
      this.top,
      this.bottom,
      this.left,
      this.right,
      this.width,
      this.widget})
      : super(key: key);

  final String type; // 'mbti' or 'surgery'

  final String? title; // 대표 문구
  final String? markText; // 대표 문구 중 강조할 텍스트 한 부분
  final String? caption; // 대표 문구 아래 설명
  final dynamic onPressed; // cta btn 클릭 이벤트

  // 배경 이미지 옵션
  final String? imgUrl;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double? width;

  // 내용 아래 추가 위젯
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return HomeBannerCtaLayout(
      type: type,
      onPressed: onPressed,
      widget: SizedBox(
        width: double.infinity,
        child: Stack(children: [
          // 배경 이미지
          if (imgUrl != null) ...[
            Positioned(
              top: top,
              bottom: bottom ?? 0,
              left: left,
              right: right ?? 0,
              child: Image.asset(imgUrl!, width: width ?? 160),
            )
          ],

          // 내용
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 타이틀
                if (title != null) ...[
                  markText != null
                      ? RichText(
                          text: TextSpan(
                              children: markTextsMixin(
                                  title!, markText!, AppTextTheme.yellow24b),
                              style:
                                  AppTextTheme.white24b.copyWith(height: 1.4)))
                      : Text(title!,
                          style: AppTextTheme.white24b.copyWith(height: 1.4)),
                  const SizedBox(height: 8)
                ],

                // 캡션
                if (caption != null) ...[
                  Text(
                    caption!,
                    style: AppTextTheme.white14m,
                  )
                ],

                // 위젯 추가
                widget ?? const SizedBox(height: 70),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
