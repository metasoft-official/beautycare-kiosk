import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_shadow/simple_shadow.dart';

import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:url_launcher/url_launcher.dart';

// todo 찜 로직 추가
class ProductSliverGridWidget extends ConsumerWidget {
  const ProductSliverGridWidget(
      {Key? key,
      required this.products,
      this.boxDecoration,
      this.widget,
      this.mainAxisSpacing = 20.0,
      this.crossAxisSpacing = 16.0,
      this.addWishlist})
      : super(key: key);

  // todo : product model 리스트 넘기면 model 정보 활용하도록 수정
  final List<Map<String, dynamic>> products; // 상품 리스트

  // 그 외 커스텀 가능한 설정값
  final double mainAxisSpacing; //행 간 거리
  final double crossAxisSpacing; //열 간 거리
  final BoxDecoration? boxDecoration;
  final Widget? widget;
  final dynamic addWishlist;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          int itemsPerRow = MediaQuery.of(context).size.width >= 600 ? 4 : 2;
          return buildGridRow(context, index, itemsPerRow);
        },
        childCount: (products.length / 2).ceil(),
      ),
    );
  }

  Widget buildGridRow(BuildContext context, int index, int itemsPerRow) {
    index *= 2;
    List<Widget> items = [];
    for (int i = 0; i < itemsPerRow; i++) {
      items.add(buildGridItem(index + i));
      if (i != itemsPerRow - 1) {
        items.add(const SizedBox(width: 16));
      }
    }
    return Row(children: items);
  }

  Widget buildGridItem(int index) {
    return Expanded(
      child: Container(
        decoration: boxDecoration,
        child: widget ??
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 제품 이미지
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 40),
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border:
                              Border.all(color: AppColor.lightGrey, width: 2)),
                      child: Center(
                        child: SimpleShadow(
                            offset: const Offset(0, 1),
                            sigma: 3,
                            opacity: 0.3,
                            child: Image.asset(
                              products[index]['image'],
                              height: 90,
                              fit: BoxFit.scaleDown,
                            )),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: addWishlist,
                        child: Image.asset('assets/icons/ic_wishlist_grey.png',
                            width: 16, height: 16),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () async {
                    Uri url = Uri.parse(products[index]['productUrl']);
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                        ]),
                  ),
                ),
                const SizedBox(height: 16)
              ],
            ),
      ),
    );
  }
}
