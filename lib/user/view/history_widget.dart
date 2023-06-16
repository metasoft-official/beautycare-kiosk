import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/layout/app_box_theme.dart';
import '../../common/layout/app_text.dart';

// 이미지와 내용이 Row 형태인 리스트 공통 위젯
class HistoryWidget extends StatelessWidget {
  const HistoryWidget({
    Key? key,
    required this.itemCount,
    this.decoration,
    this.margin,
    this.padding,
    this.imgUrl,
    this.titles,
    this.captions,
  }) : super(key: key);

  final int itemCount;
  final BoxDecoration? decoration;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  final List<String>? imgUrl;
  final List<String>? titles;
  final List<String>? captions;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverList(
        delegate:
            SliverChildBuilderDelegate(childCount: itemCount, (context, index) {
          return SizedBox(
            child: InkWell(
              // 리스트 각 요소 선택 시 이벤트
              onTap: () => context.pushNamed('mbtiResult'),
              child: Container(
                decoration:
                    decoration ?? AppBoxTheme.basicShadowWhiteBoxTheme, // 전체 박스
                margin: margin ?? const EdgeInsets.only(top: 16),
                padding: padding ?? const EdgeInsets.all(8),
                child: Row(
                  children: [
                    // 이미지
                    if (imgUrl != null && imgUrl!.length >= itemCount) ...[
                      Container(
                        decoration: AppBoxTheme.greyBoxTheme,
                        padding: const EdgeInsets.all(16),
                        // todo : network
                        child: Image.asset(
                            imgUrl?[index] ?? 'assets/images/sample_cat_01.png',
                            width: 40),
                      ),
                      const SizedBox(width: 16),
                    ],

                    // img sample (지울 부분)
                    Container(
                        decoration: AppBoxTheme.greyBoxTheme,
                        padding: const EdgeInsets.all(16),
                        child: Image.asset('assets/images/sample_cat_01.png',
                            width: 40)),
                    const SizedBox(width: 16),

                    // 텍스트 내용 (null값 추후 수정)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          titles?[index] ?? 'DRPT',
                          style: AppTextTheme.black18b,
                        ),
                        Text(
                          captions?[index] ?? '2023년 4월 17일',
                          style: AppTextTheme.deepGrey16,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      )
    ]);
  }
}
