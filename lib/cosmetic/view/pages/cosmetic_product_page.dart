import 'package:beauty_care/common/component/widgets/custom_tabbar_widget.dart';
import 'package:beauty_care/main.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/cosmetic/provider/product_state_provider.dart';

import 'package:beauty_care/common/component/widgets/product_grid_widget.dart';
import 'package:beauty_care/common/component/widgets/custom_app_bar.dart';
import 'package:beauty_care/common/component/widgets/custom_bottom_navigation_bar.dart';

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

    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomBottomNavigationBar(
            child: CustomScrollView(
          controller: hiding.controller,
          slivers: [
            const CustomAppBar(),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomTabbarWidget(
                      titles: productState.titles,
                      tabController: tabController),
                  const Expanded(
                    child: ProductGridWidget(
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
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),));
  }
}
