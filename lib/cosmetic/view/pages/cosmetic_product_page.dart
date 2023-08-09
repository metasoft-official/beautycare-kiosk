import 'package:beauty_care/common/component/widgets/loading_circle_animation_widget.dart';
import 'package:beauty_care/cosmetic/model/skin_product_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/cosmetic/provider/product_state_provider.dart';
import 'package:beauty_care/common/provider/home_state_provider.dart';
import 'package:beauty_care/skin/provider/skin_product_provider.dart';

import 'package:beauty_care/common/component/mixins/hide_navigation_bar_mixin.dart';
import 'package:beauty_care/common/component/widgets/custom_app_bar.dart';
import 'package:beauty_care/common/component/widgets/custom_bottom_navigation_bar.dart';
import 'package:beauty_care/common/component/widgets/custom_tabbar_widget.dart';
import 'package:beauty_care/common/component/widgets/product_sliver_grid_widget.dart';
import 'package:beauty_care/common/component/widgets/horizontal_category_widget.dart';
import 'package:beauty_care/cosmetic/view/widgets/cosmetic_product_all.dart';
import 'package:beauty_care/cosmetic/view/widgets/cosmetic_product_order.dart';

class CosmeticProductPage extends ConsumerStatefulWidget {
  const CosmeticProductPage({Key? key}) : super(key: key);

  static String get routeName => 'cosmeticProduct';

  @override
  CosmeticProductPageState createState() => CosmeticProductPageState();
}

class CosmeticProductPageState extends ConsumerState<CosmeticProductPage>
    with TickerProviderStateMixin {
  late TabController tabController;
  HideNavbar cosmeticHiding = HideNavbar();

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
    final asyncValue = ref.watch(skinProductStateProvider);
    final productState = ref.watch(productStateProvider);
    final homeState = ref.watch(homeStateProvider);

    List<SkinProductModel> products = [];

    return asyncValue.when(
      data: (data) {
        products = data;

        return Scaffold(
          backgroundColor: Colors.white,
          body: CustomBottomNavigationBar(
            child: CustomScrollView(
              controller: cosmeticHiding.controller,
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
                // 전체 ============================================================
                if (tabController.index == 0) ...[
                  const CosmeticProductAll(),
                ]
                // 피부 타입 별 =====================================================
                else if (tabController.index == 1) ...[
                  CosmeticProductOrder(
                    selectedValue: productState.orderSelectedValue,
                    orderCategories: productState.orders,
                    onTap: () {},
                  ),
                  SliverToBoxAdapter(
                    child: HorizontalCategoryWidget(
                      onPressed: (index) {
                        homeState.productTypeCurIndex = index;
                        homeState.resetState();
                      },
                      curIndex: homeState.productTypeCurIndex,
                      categories: homeState.typeCategories,
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 20),
                    sliver: ProductSliverGridWidget(products: products),
                  )
                ]
                // 사용 단계 별 =====================================================
                else ...[
                  CosmeticProductOrder(
                    selectedValue: productState.orderSelectedValue,
                    orderCategories: productState.orders,
                    onTap: () {},
                  ),
                  SliverToBoxAdapter(
                    child: HorizontalCategoryWidget(
                      onPressed: (index) {
                        homeState.productLineCurIndex = index;
                        homeState.resetState();
                      },
                      curIndex: homeState.productLineCurIndex,
                      categories: homeState.lineCategories,
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 20),
                    sliver: ProductSliverGridWidget(products: products),
                  )
                ]
              ],
            ),
          ),
        );
      },
      loading: () => const LoadingCircleAnimationWidget(),
      error: (e, s) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text('Error: $e'),
        ),
      ),
    );
  }
}
