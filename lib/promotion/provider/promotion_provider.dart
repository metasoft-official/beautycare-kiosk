import 'package:beauty_care/common/dio/promotion_api.dart';
import 'package:beauty_care/promotion/provider/state/promotion_data_state.dart';
import 'package:beauty_care/promotion/repository/promotion_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/const/values.dart';

// Api 인스턴스를 생성하는 Provider
final promotionApiProvider = Provider<PromotionApi>((ref) {
  final dio = ref.read(dioProvider);
  return PromotionApi(dio);
});

// Repository 인스턴스를 생성하는 Provider
final promotionRepositoryProvider = Provider<PromotionRepository>((ref) {
  final PromotionApi = ref.read(promotionApiProvider);
  return PromotionRepository(PromotionApi);
});

final promotionStateProvider =
    StateNotifierProvider<PromotionDataState, AsyncValue<Map<String, dynamic>>>(
        (ref) {
  return PromotionDataState(ref, ref.read(promotionRepositoryProvider));
});
