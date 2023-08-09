import 'package:beauty_care/cosmetic/model/skin_product_model.dart';
import 'package:beauty_care/cosmetic/repository/skin_product_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SkinProductDataState
    extends StateNotifier<AsyncValue<List<SkinProductModel>>> {
  final SkinProductRepository repository;

  SkinProductDataState(this.repository) : super(const AsyncValue.loading()) {
    loadData();
  }

  List<int> isClicked = [];

  Future<void> loadData() async {
    try {
      final data = await repository.getSkinProductAll();
      if (data != null && data.items != null) {
        state = AsyncValue.data(data.items!);
      }
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> reloadData() async {
    state = const AsyncValue.loading();
    await loadData();
  }
}
