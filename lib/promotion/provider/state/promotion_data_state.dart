import 'package:beauty_care/common/model/code_model.dart';
import 'package:beauty_care/common/provider/code/code_provider.dart';
import 'package:beauty_care/promotion/model/promotion_model.dart';
import 'package:beauty_care/promotion/repository/promotion_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../main.dart';

class PromotionDataState
    extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final Ref ref;
  final PromotionRepository promotionRepository;

  PromotionDataState(this.ref, this.promotionRepository)
      : super(const AsyncValue.loading()) {
    loadData();
  }

  int selectedIndex = 0;
  Future<void> selectCategory(int index) async {
    selectedIndex = index;
    if (index != 0) {
      await getPromotionByCode(data['categoryName'][index].id);
    } else {
      await getPromotionList();
    }
    state = AsyncValue.data(data);
  }

  Map<String, dynamic> data = {};

  Future<void> loadData() async {
    try {
      await Future.wait([getPromotionList(), getPromotionCode()]);
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

  Future<void> getPromotionByCode(int? id) async {
    PromotionModel promotionModel = PromotionModel(categoryCode: id);
    logger.d(id);
    final response =
        await promotionRepository.getPromotionListByQuery(promotionModel);
    if (response != null && response.items != null) {
      data['promotions'] = response.items;
    }
  }

  Future<void> getPromotionCode() async {
    final response = await ref
        .read(codeRepositoryProvider)
        .codeApi
        .getCodeListByParentId({'parentId': 58});
    if (response.items != null) {
      List<CodeModel> list = List.from(response.items!);
      list.sort((a, b) => (a.orderNo ?? 0).compareTo(b.orderNo ?? 0));
      data['categoryName'] = list;
    } else {
      data['categoryName'] = [];
    }
  }

  void reload() {
    state = AsyncValue.data(data);
  }
}
