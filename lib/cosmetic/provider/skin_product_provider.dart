import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/provider/skin_category_provider.dart';
import 'package:beauty_care/common/dio/skin_product_api.dart';
import 'package:beauty_care/cosmetic/provider/state/skin_product_data_state.dart';
import 'package:beauty_care/cosmetic/provider/state/skin_category_state.dart';
import 'package:beauty_care/cosmetic/repository/skin_product_repository.dart';

// Api 인스턴스를 생성하는 Provider
final skinProductApiProvider = Provider<SkinProductApi>((ref) {
  final dio = ref.read(dioProvider);
  return SkinProductApi(dio);
});

// Repository 인스턴스를 생성하는 Provider
final skinProductRepositoryProvider = Provider<SkinProductRepository>((ref) {
  final surveyApi = ref.read(skinProductApiProvider);
  return SkinProductRepository(surveyApi);
});

// 데이터 관리 클래스의 인스턴스를 생성하는 Provider
final skinProductStateProvider = StateNotifierProvider<SkinProductDataState,
    AsyncValue<Map<String, dynamic>>>(
  (ref) => SkinProductDataState(ref, ref.read(skinProductRepositoryProvider),
      ref.read(skincareCategoryProvider)),
);
final skinCategoryStateProvider =
    ChangeNotifierProvider<SkinCategoryState>((ref) {
  return SkinCategoryState(ref);
});
