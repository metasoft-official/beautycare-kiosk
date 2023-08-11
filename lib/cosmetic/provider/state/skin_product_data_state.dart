import 'package:beauty_care/common/model/skincare_category_model.dart';
import 'package:beauty_care/common/provider/skin_category_provider.dart';
import 'package:beauty_care/common/repository/skin_category_repository.dart';
import 'package:beauty_care/cosmetic/model/skin_product_model.dart';
import 'package:beauty_care/cosmetic/repository/skin_product_repository.dart';
import 'package:beauty_care/main.dart';
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

  Future<void> loadData() async {
    try {
      await getProductList();
      await getTypeCategoryList();
      await getLineCategoryList();
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

  Future<void> getProductList() async {
    final productData = await skinProductRepository.getSkinProductAll();
    if (productData != null && productData.items != null) {
      data['products'] = productData.items!;
    }
  }

  Future<void> getTypeCategoryList() async {
    final categoryData = ref.watch(typeCategoryProvider);
    return categoryData.when(
      data: (values) => data['typeCategory'] = values?.items,
      loading: () => null,
      error: (e, s) => logger.e('', e, s),
    );
  }

  Future<void> getLineCategoryList() async {
    final categoryData = ref.watch(lineCategoryProvider);
    return categoryData.when(
      data: (values) => data['lineCategory'] = values?.items,
      loading: () => null,
      error: (e, s) => logger.e('', e, s),
    );
  }
}
