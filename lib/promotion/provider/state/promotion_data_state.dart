import 'package:beauty_care/promotion/repository/promotion_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PromotionDataState
    extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final Ref ref;
  final PromotionRepository promotionRepository;

  PromotionDataState(this.ref, this.promotionRepository)
      : super(const AsyncValue.loading()) {
    loadData();
  }

  Map<String, dynamic> data = {};

  Future<void> loadData() async {
    try {
      await Future.wait([
        getPromotionList(),
      ]);
      state = AsyncValue.data(data);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> getPromotionList() async {
    final response = await promotionRepository.getPromotionAll();
    if (response != null && response.items != null) {
      data['promotions'] = response.items;
    } else {
      data['promotions'] = [];
    }
  }

  Future<void> getPromotionCode() async {
    final response = await promotionRepository.getPromotionAll();
    if (response != null && response.items != null) {
      data['promotionCode'] = response.items;
    } else {
      data['promotionCode'] = [];
    }
  }

  void reload() {
    state = AsyncValue.data(data);
  }
}
