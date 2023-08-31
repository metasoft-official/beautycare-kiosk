import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/cosmetic/model/skin_product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_shadow/simple_shadow.dart';

import 'package:beauty_care/cosmetic/provider/product_state_provider.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../main.dart';
import '../../provider/click_count_provider.dart';

// todo 찜 로직 추가
class ProductGridWidget extends ConsumerWidget {
  const ProductGridWidget(
      {Key? key,
      required this.products,
      this.columnSizes = 2,
      this.boxDecoration,
      this.widget,
      this.mainAxisSpacing = 20.0,
      this.crossAxisSpacing = 16.0,
      this.addWishlist,
      this.filterCategory,
      this.itemCount})
      : super(key: key);

  final List<SkinProductModel> products; // 상품 리스트
  final int columnSizes;

  // 그 외 커스텀 가능한 설정값
  final double mainAxisSpacing; //행 간 거리
  final double crossAxisSpacing; //열 간 거리
  final BoxDecoration? boxDecoration;
  final Widget? widget;
  final dynamic addWishlist;
  final String? filterCategory;
  final int? itemCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = itemCount ?? products.length;

    return SingleChildScrollView(
      child: count != 0
          ? LayoutGrid(
              columnGap: crossAxisSpacing,
              rowGap: mainAxisSpacing,
              columnSizes: List<TrackSize>.filled(columnSizes, 1.fr),
              rowSizes:
                  List<TrackSize>.filled((count / columnSizes).ceil(), auto),
              children: [
                ...List.generate(
                  count,
                  (index) {
                    return Container(
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
                                            color: AppColor.lightGrey,
                                            width: 2)),
                                    child: Center(
                                      child: SimpleShadow(
                                        offset: const Offset(0, 1),
                                        sigma: 3,
                                        opacity: 0.3,
                                        child: products[index].imageId != null
                                            ? Image.network(
                                                '${Strings.imageUrl}${products[index].imageId}',
                                                height: 90,
                                                fit: BoxFit.scaleDown,
                                                errorBuilder: (BuildContext
                                                        context,
                                                    Object exception,
                                                    StackTrace? stackTrace) {
                                                  return Image.asset(
                                                    'assets/images/character_coiz_3.png',
                                                    height: 90,
                                                    fit: BoxFit.scaleDown,
                                                  );
                                                },
                                              )
                                            : Image.asset(
                                                'assets/images/character_coiz_3.png',
                                                height: 90,
                                                fit: BoxFit.scaleDown,
                                              ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: GestureDetector(
                                      onTap: addWishlist,
                                      child: Image.asset(
                                          'assets/icons/ic_wishlist_grey.png',
                                          width: 16,
                                          height: 16),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 8),
                              GestureDetector(
                                onTap: () async {
                                  await ref
                                      .read(clickCountRepositoryProvider)
                                      .updateClickCount(
                                          products[index].id ?? -1, 'S');
                                  Uri url = Uri.parse(
                                      products[index].productUrl ?? '-');
                                  if (!await launchUrl(url)) {
                                    throw Exception('Could not launch $url');
                                  }
                                },
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        filterCategory ??
                                            products[index]
                                                .skintypeCategoryId
                                                .toString() ??
                                            '-',
                                        style: AppTextTheme.grey12
                                            .copyWith(height: 1.2),
                                      ),
                                      Text(
                                        products[index]
                                                .name!
                                                .replaceAll('', '\u{200B}') ??
                                            '-', //말줄임 적//말줄임 적용
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextTheme.black14m
                                            .copyWith(height: 1.2),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            products[index].price != null
                                                ? products[index]
                                                    .price
                                                    .toString()
                                                : '-',
                                            style: AppTextTheme.black16b,
                                          ),
                                          const SizedBox(width: 4),
                                          const Text(
                                            '원',
                                            style: AppTextTheme.grey12,
                                          )
                                        ],
                                      ),
                                    ]),
                              )
                            ],
                          ),
                    );
                  },
                ),
              ],
            )
          : const SizedBox(),
    );
  }
}
