import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/cosmetic/provider/product_state_provider.dart';
import 'package:beauty_care/cosmetic/provider/skin_product_provider.dart';

import 'package:beauty_care/common/component/mixins/modal_mixin.dart';
import 'package:beauty_care/common/component/mixins/hide_navigation_bar_mixin.dart';
import 'package:beauty_care/common/component/widgets/custom_app_bar.dart';
import 'package:beauty_care/common/component/widgets/custom_bottom_navigation_bar.dart';
import 'package:beauty_care/common/component/widgets/custom_tabbar_widget.dart';
import 'package:beauty_care/common/component/widgets/product_sliver_grid_widget.dart';
import 'package:beauty_care/common/component/widgets/horizontal_category_widget.dart';
import 'package:beauty_care/common/component/widgets/loading_circle_animation_widget.dart';
import 'package:beauty_care/cosmetic/view/widgets/cosmetic_product_all.dart';
import 'package:beauty_care/cosmetic/view/widgets/cosmetic_product_order.dart';

import '../../../main.dart';

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
      final productState = ref.watch(skinProductStateProvider.notifier);
      final categoryState = ref.watch(skinCategoryStateProvider);
      productState.tabState = tabController.index;
      final key = tabController.index == 0
          ? 'shopMain'
          : tabController.index == 1
              ? 'shopType'
              : 'shopLine';
      productState.getProductListByKey(
          productKey: key,
          selectedData: tabController.index == 1
              ? categoryState.productTypeCurIndex
              : tabController.index == 2
                  ? categoryState.productLineCurIndex
                  : null);

      productState.reload();
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productDataState = ref.watch(skinProductStateProvider.notifier);
    final asyncValue = ref.watch(skinProductStateProvider);
    final productState = ref.watch(productStateProvider);
    final categoryState = ref.watch(skinCategoryStateProvider);

    return asyncValue.when(
      data: (data) {
        logger.d(data);
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
                  bottomSize: 60,
                ),
                // 전체 ============================================================
                if (tabController.index == 0) ...[
                  SliverToBoxAdapter(child: CosmeticProductAll(data: data)),
                ]
                // 피부 타입 별 =====================================================
                else if (tabController.index == 1) ...[
                  CosmeticProductOrder(
                    selectedValue: data['selectedOrder']['shopType'],
                    onTap: () async {
                      final selectedData =
                          await ModalMixin.filterModalBottomSheet(
                              modalKey: 'shopTypeOrder',
                              context: context,
                              title: '정렬',
                              selectedValue: 0,
                              list: data['order']['shopTypeOrder']);
                      // 선택 내용 변경
                      data['selectedOrder']['shopType'] =
                          data['order']['shopTypeOrder'][selectedData].name;

                      // 선택에 따른 내용 다시 가져오기
                      await productDataState.getProductListByKey(
                          productKey: 'shopType',
                          selectedData: categoryState.productTypeCurIndex);

                      productDataState.reload();
                    },
                  ),
                  SliverToBoxAdapter(
                    child: HorizontalCategoryWidget(
                      onPressed: (index) async {
                        categoryState.select('shopType', index);
                        await productDataState.getProductListByKey(
                            productKey: 'shopType', selectedData: index);
                        productDataState.reload();
                      },
                      curIndex: categoryState.productTypeCurIndex,
                      categories: data['typeCategory'],
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 20),
                    sliver: ProductSliverGridWidget(
                        products: data['shopType'],
                        filterCategory: data['typeCategory']
                                [categoryState.productTypeCurIndex]
                            .name),
                  )
                ]
                // 사용 단계 별 =====================================================
                else ...[
                  CosmeticProductOrder(
                    selectedValue: data['selectedOrder']['shopLine'],
                    onTap: () async {
                      final selectedData =
                          await ModalMixin.filterModalBottomSheet(
                              modalKey: 'shopLineOrder',
                              context: context,
                              title: '정렬',
                              selectedValue: 0,
                              list: data['order']['shopLineOrder']);
                      // 선택 내용 변경
                      data['selectedOrder']['shopLine'] =
                          data['order']['shopLineOrder'][selectedData].name;
                      // 선택에 따른 내용 다시 가져오기
                      await productDataState.getProductListByKey(
                          productKey: 'shopLine',
                          selectedData: categoryState.productLineCurIndex);
                      productDataState.reload();
                    },
                  ),
                  SliverToBoxAdapter(
                    child: HorizontalCategoryWidget(
                      onPressed: (index) async {
                        categoryState.select('shopLine', index);
                        await productDataState.getProductListByKey(
                            selectedData: index, productKey: 'shopLine');
                        productDataState.reload();
                      },
                      curIndex: categoryState.productLineCurIndex,
                      categories: data['lineCategory'],
                    ),
                  ),
                  SliverPadding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 20),
                      sliver: ProductSliverGridWidget(
                          products: data['shopLine'],
                          filterCategory: data['lineCategory']
                                  [categoryState.productLineCurIndex]
                              .name)),
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
          child: Text('Error: $e, $s'),
        ),
      ),
    );
  }
}
