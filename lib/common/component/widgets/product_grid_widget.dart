import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../cosmetic/provider/product_state_provider.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';

// todo 찜 로직 추가
class ProductGridWidget extends ConsumerWidget {
  const ProductGridWidget({
    Key? key,
    required this.imgUrl,
    required this.category,
    required this.title,
    required this.crossAxisCount,
    required this.productUrl,
    this.price,
    this.margin,
    this.padding,
    this.boxDecoration,
    this.alignment,
    this.widget,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
  }) : super(key: key);

  // 필수 요소
  final int crossAxisCount; // 한 줄에 들어갈 아이템 개수

  // todo : product model 리스트 넘기면 model 정보 활용하도록 수정
  // final List<dynamic> products; // 상품 리스트
  final List<String> imgUrl; // 상품 이미지
  final List<String> productUrl; // 상품 링크
  final List<String> category; // 카테고리
  final List<String> title; // 품명
  final List<String>? price; // 가격 => 시술의 경우 없음

  // 그 외 커스텀 가능한 설정값
  final double? mainAxisSpacing; //행 간 거리
  final double? crossAxisSpacing; //열 간 거리
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BoxDecoration? boxDecoration;
  final Alignment? alignment;
  final Widget? widget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productStateProvider);

    return CustomScrollView(slivers: [
      SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: mainAxisSpacing ?? 10.0,
            crossAxisSpacing: crossAxisSpacing ?? 10.0),
        delegate: SliverChildBuilderDelegate(
          childCount: category.length,
          (BuildContext context, int index) {
            return Wrap(
              children: [
                Container(
                  padding: padding ??
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: boxDecoration,
                  child: InkWell(
                    onTap: () {
                      productState.openWeb(productUrl[index]);
                    },
                    child: widget ??
                        Column(
                          children: [
                            Container(
                                width: double.infinity,
                                height: 150,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColor.lightGrey, width: 2)),
                                child: Image.asset(imgUrl[index])),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: double.infinity,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      category[index],
                                      style: AppTextTheme.grey12,
                                    ),
                                    Text(
                                      title[index]
                                          .replaceAll('', '\u{200B}'), //말줄임 적용
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextTheme.black14m,
                                    ),
                                    if (price != null) ...[
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Text(
                                            price![index] ?? '-',
                                            style: AppTextTheme.black16b,
                                          ),
                                          const SizedBox(width: 4),
                                          const Text(
                                            '원',
                                            style: AppTextTheme.grey12,
                                          )
                                        ],
                                      ),
                                    ],
                                  ]),
                            ),
                          ],
                        ),
                  ),
                ),
              ],
            );
          },
        ),
      )
    ]);
  }
}
