import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/dio/search_api.dart';
import 'package:beauty_care/common/model/search_trend_model.dart';
import 'package:beauty_care/common/model/user_model.dart';
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
  Map<String, dynamic> data = {};

  Future<void> loadData() async {
    try {
      UserModel user = ref.watch(userNotifierProvider);
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
    reload();
  }

  reload() async {
    state = AsyncValue.data(data);
  }
}
