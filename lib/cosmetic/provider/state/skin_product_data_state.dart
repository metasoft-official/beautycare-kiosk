import 'package:carousel_slider/carousel_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/provider/skin_category_provider.dart';
import 'package:beauty_care/common/provider/modal/modal_grid_state_provider.dart';
import 'package:beauty_care/common/repository/skin_category_repository.dart';
import 'package:beauty_care/cosmetic/repository/skin_product_repository.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/common/model/skincare_category_model.dart';
import 'package:beauty_care/cosmetic/model/skin_product_model.dart';

import '../../../main.dart';

class SkinProductDataState
    extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final Ref ref;
  final SkinProductRepository skinProductRepository;
  final SkincareCategoryRepository skincareCategoryRepository;

  SkinProductDataState(
      this.ref, this.skinProductRepository, this.skincareCategoryRepository)
      : super(const AsyncValue.loading()) {
    loadData();
  }

  Map<String, dynamic> data = {};

  List<int> isClicked = [];
  List<SkinProductModel> products = [];
  List<SkincareCategoryModel> typeCategory = [];
  List<SkincareCategoryModel> lineCategory = [];
  Map<String, dynamic> categoryData = {};
  Map<String, dynamic> orderData = {};
  Map<String, dynamic> selectedData = {};
  int tabState = 0;

  List<String> promotionList = [
    'assets/images/promotion_banner_01.png',
    'assets/images/promotion_banner_02.png'
  ];

  Future<void> loadData() async {
    try {
      await Future.wait([
        getTypeCategoryList(),
        getLineCategoryList(),
        getOrderList(),
      ]);
      await Future.wait([
        getProductListByKey(productKey: 'shopMain'),
        getProductListByKey(productKey: 'shopTrouble'),
        getProductListByKey(productKey: 'shopPopularity'),
        getProductListByKey(productKey: 'shopType'),
        getProductListByKey(productKey: 'shopLine')
      ]);
      state = AsyncValue.data(data);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  List<SkincareCategoryModel> mergedCategories = [];
  Future<void> getProductListByKey(
      {required String productKey,
      int? selectedData,
      int? rowSize,
      String? sortBy}) async {
    final index = selectedData ?? 0;

    switch (productKey) {
      case 'shopType':
        await getProductList(
            productKey: 'shopType',
            skintypeCategoryId: data['typeCategory'][index].id);
        break;
      case 'shopLine':
        await getProductList(
            productKey: 'shopLine',
            productLineCategoryId: data['lineCategory'][index].id);
        break;
      case 'shopMain':
        mergedCategories = List.from(data['typeCategory'])
          ..addAll(List.from(data['lineCategory']));
        await getProductList(productKey: 'shopMain', rowSize: 4);
        break;
      case 'shopTrouble':
        await getProductList(
            productKey: 'shopTrouble',
            rowSize: 4,
            skintypeCategoryId: data['typeCategory'][index].id);
        break;
      case 'shopPopularity':
        mergedCategories = List.from(data['typeCategory'])
          ..addAll(List.from(data['lineCategory']));
        await getProductList(productKey: 'shopPopularity', rowSize: 3);
        break;
      default:
        mergedCategories = List.from(data['typeCategory'])
          ..addAll(List.from(data['lineCategory']));
        await getProductList(productKey: 'products');
        break;
    }
  }

  Future<void> getProductList(
      {required String productKey,
      int? skintypeCategoryId,
      int? productLineCategoryId,
      int? rowSize}) async {
    // 비교할 카테고리 리스트
    List<SkincareCategoryModel> categories = skintypeCategoryId != null
        ? data['typeCategory']
        : productLineCategoryId != null
            ? data['lineCategory']
            : mergedCategories;
    // 제품 조건
    SkinProductModel skinProductModel = SkinProductModel(
        skintypeCategoryId: skintypeCategoryId,
        productLineCategoryId: productLineCategoryId);

    // 제품 가져오기
    final response = await skinProductRepository.getSkinProductByQuery(
        skinProductModel, PageResponse(rowSize: rowSize));
    if (response != null && response.items != null) {
      data[productKey] = response.items;
      // 카테고리 이름 매칭
      List<dynamic> productCategoryNames = data[productKey]
          .map((product) => categories
              .firstWhere((category) =>
                  category.id == product.skintypeCategoryId ||
                  category.id == product.productLineCategoryId)
              .name)
          .toList();
      data['${productKey}Category'] = List.from(productCategoryNames);
    } else {
      data[productKey] = [];
      data['${productKey}Category'] = [];
    }
  }

  Future<void> getTypeCategoryList() async {
    final response = ref.read(typeCategoryProvider.future);
    return response.then((values) {
      data['typeCategory'] = values?.items;
    });
  }

  Future<void> getLineCategoryList() async {
    final response = ref.read(lineCategoryProvider.future);
    return response.then((values) {
      data['lineCategory'] = values?.items;
    });
  }

  Future<void> getOrderList() async {
    final modalDataState = ref.read(modalGridStateProvider.notifier);

    orderData['shopTrouble'] = await modalDataState.getOrderList(
        modalKey: 'shopTrouble', parentId: 43);
    selectedData['shopTrouble'] = orderData['shopTrouble'][0].name;

    orderData['shopTypeOrder'] = await modalDataState.getOrderList(
        modalKey: 'shopTypeOrder', parentId: 54);
    selectedData['shopType'] = orderData['shopTypeOrder'][0].name;

    orderData['shopLineOrder'] = await modalDataState.getOrderList(
        modalKey: 'shopLineOrder', parentId: 54);
    selectedData['shopLine'] = orderData['shopLineOrder'][0].name;

    if (orderData.isNotEmpty) {
      data['order'] = orderData;
      data['selectedOrder'] = selectedData;
    }
  }

  void reload() {
    state = AsyncValue.data(data);
  }
}
