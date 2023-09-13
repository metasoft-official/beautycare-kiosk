import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/cosmetic/provider/product_state_provider.dart';
import 'package:beauty_care/promotion/model/promotion_model.dart';
import 'package:beauty_care/promotion/provider/promotion_provider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/provider/home/home_state_provider.dart';
import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:beauty_care/cosmetic/provider/skin_product_provider.dart';

import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';

import 'package:beauty_care/common/component/widgets/list_title_widget.dart';
import 'package:beauty_care/common/component/widgets/product_grid_widget.dart';
import 'package:beauty_care/common/component/widgets/product_list_widget.dart';
import 'package:beauty_care/common/component/mixins/modal_mixin.dart';

class CosmeticProductAll extends ConsumerWidget {
  const CosmeticProductAll({Key? key, required this.data}) : super(key: key);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(skinProductStateProvider.notifier);
    final user = ref.watch(userNotifierProvider);
    final homeState = ref.watch(homeDataStateProvider.notifier);
    final promotion = ref.watch(promotionStateProvider);
    final promotionState = ref.watch(promotionStateProvider.notifier);
    final sliderState = ref.watch(sliderChangeProvider);
    List<PromotionModel> promotions = promotionState.data['promotions'] ?? [];

    return Column(
      children: [
        if (promotionState.data['promotions'] != null) ...[
          // 프로모션 슬라이더
          Stack(
            children: [
              CarouselSlider.builder(
                itemCount: promotions.length,
                carouselController: sliderState.carouselController,
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    sliderState.changePage(index);
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
                        SizedBox(
                          height: 240,
                          width: double.infinity,
                          child: promotions[itemIndex].promotionImageId != null
                              ? Image.network(
                                  '${Strings.imageUrl}${promotions[itemIndex].promotionImageId}',
                                  fit: BoxFit.cover,
                                  // 네트워크 Empty 예외처리
                                  errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                    return Image.asset(
                                      'assets/images/sample_images_01.png',
                                      fit: BoxFit.cover,
                                    );
                                  },
                                )
                              // 이미지 아이디 Null 예외처리
                              : Image.asset(
                                  'assets/images/sample_images_01.png',
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              // 프로모션 더보기 버튼
              Positioned(
                bottom: 12,
                right: 20,
                child: GestureDetector(
                  onTap: () => context.pushNamed('promotion'),
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(12, 5, 6, 5),
                      decoration: BoxDecoration(
                        color: AppColor.black.withOpacity(0.6),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('프로모션 전체보기',
                              style:
                                  AppTextTheme.white12b.copyWith(height: 1.2)),
                          const Icon(
                            Icons.navigate_next,
                            size: 16,
                            color: Colors.white,
                          )
                        ],
                      )),
                ),
              )
            ],
          ),

          // 슬라이더 바 인디케이터 ===============================================
          Stack(children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: 4,
                decoration: const BoxDecoration(color: AppColor.lowGrey)),
            Container(
              width: ((MediaQuery.of(context).size.width) / promotions.length) *
                  (sliderState.curIndex + 1),
              height: 4,
              decoration: const BoxDecoration(color: AppColor.appColor),
            ),
          ]),
          const SizedBox(height: 16),
        ],

        // 취향저격 ===========================================================
        ListTitleWidget(
          text: '${user.name}님 취향저격 화장품',
          markText: user.name,
          btnText: '',
          btnVisible: false,
        ),
        // 카테고리
        SizedBox(
          width: double.infinity,
          child: Padding(
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
        ),
        // 취향저격 리스트
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: ProductGridWidget(
            products: data['shopMain'],
            categories: data['shopMainCategory'],
          ),
        ),
        const SizedBox(height: 20),
        // 광고 배너 ===========================================================
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
        // 공병템 =============================================================
        Wrap(
          children: [
            ListTitleWidget(
              text: '${user.name}님의 공병템이 될 상품',
              markText: user.name,
              onTap: () {},
            ),
          ],
        ),
        // 고민 필터
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              GestureDetector(
                onTap: () async {
                  // 모달창 생성
                  final selectedData = await ModalMixin.filterModalBottomSheet(
                    context: context,
                    title: '피부고민',
                    selectedValue: 0,
                    modalKey: 'shopTrouble',
                    list: data['order']['shopTrouble'] ?? [],
                  );
                  // 선택 내용 변경
                  data['selectedOrder']['shopTrouble'] =
                      data['order']['shopTrouble'][selectedData].name;
                  // 선택에 따른 내용 다시 가져오기
                  productState.getProductListByKey(
                      productKey: 'shopTrouble', selectedData: selectedData);
                  productState.reload();
                },
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: AppColor.appBackgroundColor))),
                  child: Row(
                    children: [
                      Text(
                        data['selectedOrder']['shopTrouble'] ??
                            data['order']['shopTrouble'][0].name ??
                            '-',
                        style: AppTextTheme.blue16b.copyWith(height: 1.2),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        size: 20,
                        color: AppColor.appColor,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 4),
              const Text(
                '이 고민이라면',
                style: AppTextTheme.middleGrey16m,
              )
            ],
          ),
        ),
        // 공병템 제품 리스트
        if (data['shopTrouble'] != null && data['shopTrouble'].length != 0) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: ProductGridWidget(
              products: data['shopTrouble'],
              categories: data['shopTroubleCategory'],
            ),
          )
        ],
        const SizedBox(height: 20),

        // 인기상품 ===========================================================
        // 기간 필터
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: AppColor.appBackgroundColor))),
                  child: Row(
                    children: [
                      Text(
                        '이번 주',
                        style: AppTextTheme.blue20b.copyWith(height: 1.2),
                      ),
                      // const Icon(
                      //   Icons.keyboard_arrow_down,
                      //   size: 20,
                      //   color: AppColor.appColor,
                      // ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 4),
              const Text(
                '제일 잘 나갔어요',
                style: AppTextTheme.black20m,
              ),
              const Spacer(),
              // 더보기
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text('더보기', style: AppTextTheme.blue12b),
                    // 화살표
                    Icon(
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
        const SizedBox(height: 8),
        // 인기 제품 리스트
        if (data['shopPopularity'] != null &&
            data['shopPopularity'].length != 0) ...[
          ProductListWidget(
            categories: data['shopPopularityCategory'],
            products: data['shopPopularity'],
            lankVisible: true,
            btnVisible: true,
            btnText: '인기상품 전체보기',
            markText: '인기상품',
            imgVisible: false,
          )
        ],
        const SizedBox(height: 30),
      ],
    );
  }
}
