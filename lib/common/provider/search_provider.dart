import 'package:beauty_care/clinic/provider/clinic_state_provider.dart';
import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/dio/search_api.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/common/model/search_trend_model.dart';
import 'package:beauty_care/common/model/user_model.dart';
import 'package:beauty_care/cosmetic/model/skin_product_model.dart';
import 'package:beauty_care/cosmetic/provider/skin_product_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'login_provider.dart';

final searchApiProvider = Provider<SearchApi>((ref) {
  final dio = ref.read(dioProvider);
  return SearchApi(dio);
});

final searchDataProvider = AutoDisposeStateNotifierProvider<SearchDataState,
    AsyncValue<Map<String, dynamic>>>(
  (ref) => SearchDataState(
    ref,
  ),
);

class SearchDataState extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final Ref ref;

  SearchDataState(this.ref) : super(const AsyncValue.loading()) {
    loadData();
  }

  bool isSubmitted = false;
  TextEditingController content = TextEditingController();
  Map<String, dynamic> data = {};

  Future<void> loadData() async {
    try {
      await Future.wait([getTrendList()]);
      state = AsyncValue.data(data);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  List<SearchTrendModel>? list;
  Future<void> getTrendList() async {
    final api = ref.read(searchApiProvider);

    final response = await api.getSearchTrendByQuery({'visibilityStatus': 'T'});
    if (response.items != null) {
      if (response.items!.isNotEmpty) {
        list = response.items!;
        data['trend'] = list;
      } else {
        data['trend'] = [];
      }
    }
  }

  Future<void> submitContent(String content) async {
    isSubmitted = true;
    // await ref.read(clinicRepositoryProvider).getClinicByQuery(clinicModel);
    final productResponse = await ref
        .read(skinProductRepositoryProvider)
        .getSkinProductByQuery(
            SkinProductModel(nameLike: content), PageResponse(rowSize: 100));
    if (productResponse != null && productResponse.items != null) {
      data['product'] = productResponse.items!;
    }

    reload();
  }

  reload() async {
    state = AsyncValue.data(data);
  }
}
