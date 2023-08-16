import 'package:beauty_care/common/model/skincare_category_model.dart';
import 'package:beauty_care/common/provider/skin_category_provider.dart';
import 'package:beauty_care/common/repository/skin_category_repository.dart';
import 'package:beauty_care/cosmetic/model/skin_product_model.dart';
import 'package:beauty_care/cosmetic/repository/skin_product_repository.dart';
import 'package:beauty_care/main.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

  List<int> isClicked = [];
  Map<String, dynamic> data = {};
  List<SkinProductModel> products = [];
  List<SkincareCategoryModel> typeCategory = [];
  List<SkincareCategoryModel> lineCategory = [];

  int tabState = 0;

  List<String> promotionList = [
    'assets/images/promotion_banner_01.png',
    'assets/images/promotion_banner_02.png'
  ];
  int curIndex = 0;
  CarouselController carouselController = CarouselController();

  Future<void> loadData() async {
    try {
      await getProductList();
      await getTypeCategoryList();
      await getLineCategoryList();
      logger.d(data);
      if (data.isNotEmpty && data.length == 3) {
        state = AsyncValue.data(data);
      }
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> reloadData() async {
    state = const AsyncValue.loading();
    await loadData();
  }

  Future<void> getProductList(
      {int? skintypeCategoryId, int? productLineCategoryId}) async {
    SkinProductModel skinProductModel = SkinProductModel(
        skintypeCategoryId: skintypeCategoryId,
        productLineCategoryId: productLineCategoryId);
    final productData =
        await skinProductRepository.getSkinProductByQuery(skinProductModel);
    if (productData != null && productData.items != null) {
      data['products'] = productData.items!;
      if (data['products'] != null) {
        state = AsyncValue.data(data);
      }
    }
  }

  Future<void> getTypeCategoryList() async {
    final categoryData = ref.read(typeCategoryProvider.future);
    return categoryData.then((values) => data['typeCategory'] = values?.items);
  }

  Future<void> getLineCategoryList() async {
    final categoryData = ref.read(lineCategoryProvider.future);
    return categoryData.then(
      (values) => data['lineCategory'] = values?.items,
    );
  }

  // all page ======

  String troubleSelectedValue = '민감';
  String periodSelectedValue = '오늘';
  String orderSelectedValue = '인기순';
  changePage(int index) {
    curIndex = index;
  }
}
