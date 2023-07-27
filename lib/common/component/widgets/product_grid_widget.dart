import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_shadow/simple_shadow.dart';

import 'package:beauty_care/cosmetic/provider/product_state_provider.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';

// todo 찜 로직 추가
class ProductGridWidget extends ConsumerWidget {
  const ProductGridWidget({
    Key? key,
    required this.products,
    this.columnSizes = 2,
    this.boxDecoration,
    this.widget,
    this.mainAxisSpacing = 10.0,
    this.crossAxisSpacing = 10.0,
  }) : super(key: key);

  // todo : product model 리스트 넘기면 model 정보 활용하도록 수정
  final List<Map<String, dynamic>> products; // 상품 리스트
  final int columnSizes;

  // 그 외 커스텀 가능한 설정값
  final double mainAxisSpacing; //행 간 거리
  final double crossAxisSpacing; //열 간 거리
  final BoxDecoration? boxDecoration;
  final Widget? widget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productStateProvider);

    return LayoutGrid(
      columnGap: crossAxisSpacing,
      rowGap: mainAxisSpacing,
      columnSizes: List<TrackSize>.filled(columnSizes, 1.fr),
      rowSizes:
          List<TrackSize>.filled((products.length / columnSizes).ceil(), auto),
      children: [
        ...List.generate(
          products.length,
          (index) {
            return GestureDetector(
              onTap: () {
                productState.openWeb(products[index]['productUrl']);
              },
              child: Container(
                decoration: boxDecoration,
                child: widget ??
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  border: Border.all(
                                      color: AppColor.lightGrey, width: 2)),
                              child: Center(
                                child: SimpleShadow(
                                    offset: const Offset(0, 1),
                                    sigma: 3,
                                    opacity: 0.3,
                                    child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Image.asset(
                                            products[index]['imgUrl']))),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Image.asset(
                                  'assets/icons/ic_wishlist_grey.png',
                                  width: 16,
                                  height: 16),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          products[index]['skintypeCategory'],
                          style: AppTextTheme.grey12.copyWith(height: 1.2),
                        ),
                        Text(
                          products[index]['name']
                              .replaceAll('', '\u{200B}'), //말줄임 적용
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextTheme.black14m.copyWith(height: 1.2),
                        ),
                        if (products[index]['price'] != null) ...[
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                products[index]['price'] ?? '-',
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
                      ],
                    ),
              ),
            );
          },
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
