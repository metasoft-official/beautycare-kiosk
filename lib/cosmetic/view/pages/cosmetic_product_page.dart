import 'package:beauty_care/main.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:beauty_care/cosmetic/provider/product_state_provider.dart';
import 'package:beauty_care/common/provider/home_state_provider.dart';
import 'package:beauty_care/common/provider/login_provider.dart';

import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/common/component/widgets/custom_app_bar.dart';
import 'package:beauty_care/common/component/widgets/custom_bottom_navigation_bar.dart';
import 'package:beauty_care/common/component/widgets/custom_tabbar_widget.dart';
import 'package:beauty_care/common/component/widgets/list_title_widget.dart';
import 'package:beauty_care/common/component/widgets/product_grid_widget.dart';

class CosmeticProductPage extends ConsumerStatefulWidget {
  const CosmeticProductPage({Key? key}) : super(key: key);

  static String get routeName => 'cosmeticProduct';

  @override
  CosmeticProductPageState createState() => CosmeticProductPageState();
}

class CosmeticProductPageState extends ConsumerState<CosmeticProductPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      final productState = ref.watch(productStateProvider);
      productState.stateIndex = tabController.index;
      productState.resetState();
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productStateProvider);
    final user = ref.watch(userNotifierProvider);
    final homeState = ref.watch(homeStateProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomBottomNavigationBar(
        child: CustomScrollView(
          controller: hiding.controller,
          slivers: [
            CustomAppBar(
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: CustomTabbarWidget(
                    titles: productState.titles,
                    tabController: tabController,
                  ),
                ),
                bottomSize: 60),
            SliverToBoxAdapter(
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
                            autoPlay: false,
                            height: 240,
                            viewportFraction: 1,
                            enableInfiniteScroll: true,
                            padEnds: false,
                          ),
                          itemBuilder: (BuildContext context, int itemIndex,
                              int realIndex) {
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
                                  style: AppTextTheme.white12b
                                      .copyWith(height: 1.2))),
                        )
                      ],
                    ),

                    // 슬라이더 바 인디케이터
                    Stack(children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 4,
                          decoration:
                              const BoxDecoration(color: AppColor.lowGrey)),
                      Container(
                        width: ((MediaQuery.of(context).size.width) /
                                productState.promotionList.length) *
                            (productState.curIndex + 1),
                        height: 4,
                        decoration:
                            const BoxDecoration(color: AppColor.appColor),
                      ),
                    ]),
                    const SizedBox(height: 16),
                  ],
                  ListTitleWidget(
                    text: '${user.name}님 취향저격 화장품',
                    markText: user.name,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    width: double.infinity,
                    height: 50,
                    child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        shrinkWrap: true,
                        primary: false,
                        itemCount: homeState.keywords.length,
                        itemBuilder: (context, index) {
                          return Container(
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
                                '#${homeState.keywords[index]}',
                                style: AppTextTheme.blue14b,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                        scrollDirection: Axis.horizontal),
                  ),
                ],
              ),
            ),
            const ProductGridWidget(
              // todo : model 생성 후 model 리스트 전달
              productUrl: [
                'https://oxygenceuticals.co.kr/product/detail.html?product_no=35&cate_no=55&display_group=1'
              ],
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              imgUrl: ["assets/images/sample_c_01.png"],
              category: ['수분'],
              title: ['에이셀300 플루이드 50ml'],
              price: ['95,000'],
            )
          ],
        ),
      ),
    );
  }
}
