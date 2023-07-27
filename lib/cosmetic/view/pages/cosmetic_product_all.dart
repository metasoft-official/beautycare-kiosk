import 'package:beauty_care/common/component/widgets/custom_dropdown_button_2.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/provider/home_state_provider.dart';
import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:beauty_care/cosmetic/provider/product_state_provider.dart';

import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';

import 'package:beauty_care/common/component/widgets/list_title_widget.dart';
import 'package:beauty_care/common/component/widgets/product_grid_widget.dart';
import 'package:beauty_care/common/component/widgets/product_list_widget.dart';

class CosmeticProductAll extends ConsumerWidget {
  const CosmeticProductAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productStateProvider);
    final user = ref.watch(userNotifierProvider);
    final homeState = ref.watch(homeStateProvider);

    return SliverToBoxAdapter(
      child: Column(
        children: [
          if (productState.promotionList.isNotEmpty) ...[
            // 전문점 소개 슬라이더
            Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: productState.promotionList.length,
                  carouselController: productState.carouselController,
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      productState.changePage(index);
                    },
                    autoPlay: true,
                    height: 240,
                    viewportFraction: 1,
                    enableInfiniteScroll: true,
                    padEnds: false,
                  ),
                  itemBuilder:
                      (BuildContext context, int itemIndex, int realIndex) {
                    return SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Image.asset(
                            productState.promotionList[itemIndex],
                            height: 240,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    );
                  },
                ),

                // 프로모션 더보기 버튼
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                      decoration: BoxDecoration(
                        color: AppColor.black.withOpacity(0.5),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Text('프로모션 전체보기',
                          style: AppTextTheme.white12b.copyWith(height: 1.2))),
                )
              ],
            ),

            // 슬라이더 바 인디케이터
            Stack(children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 4,
                  decoration: const BoxDecoration(color: AppColor.lowGrey)),
              Container(
                width: ((MediaQuery.of(context).size.width) /
                        productState.promotionList.length) *
                    (productState.curIndex + 1),
                height: 4,
                decoration: const BoxDecoration(color: AppColor.appColor),
              ),
            ]),
            const SizedBox(height: 16),
          ],
          ListTitleWidget(
            text: '${user.name}님 취향저격 화장품',
            markText: user.name,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i = 0; i < homeState.keywords.length; i++) ...[
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 12),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(35)),
                          border: Border.all(color: AppColor.appColor)),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '#${homeState.keywords[i]}',
                          style: AppTextTheme.blue14b,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ]
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: ProductGridWidget(
                // todo : model 생성 후 model 리스트 전달
                products: productState.products),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              // context.pushNamed('clinic');
            },
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/images/shop_banner.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          ListTitleWidget(
            text: '${user.name}님의 공병템이 될 상품',
            markText: user.name,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: ProductGridWidget(
                // todo : model 생성 후 model 리스트 전달
                products: productState.products),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              CustomDropdownButton2(
                items: productState.troubleCategories,
                hint: '민감',
                value: productState.troubleSelectedValue,
                onChanged: (value) {
                  productState.selectDropdown('trouble', value);
                },
              ),
            ],
          ),
          ProductListWidget(
              products: productState.lankProducts,
              lankVisible: true,
              btnVisible: true,
              btnText: '인기상품 전체보기',
              markText: '인기상품',
              imgVisible: false),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
