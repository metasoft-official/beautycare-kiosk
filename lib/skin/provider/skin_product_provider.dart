import 'package:beauty_care/skin/provider/state/skin_product_data_state.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/dio/skin_product_api.dart';
import 'package:beauty_care/cosmetic/model/skin_product_model.dart';
import 'package:beauty_care/cosmetic/repository/skin_product_repository.dart';

// Dio 인스턴스를 생성하는 Provider
final dioProvider = Provider<Dio>((_) => Dio());

// Api 인스턴스를 생성하는 Provider
final surveyApiProvider = Provider<SkinProductApi>((ref) {
  final dio = ref.read(dioProvider);
  return SkinProductApi(dio);
});

// Repository 인스턴스를 생성하는 Provider
final surveyRepositoryProvider = Provider<SkinProductRepository>((ref) {
  final surveyApi = ref.read(surveyApiProvider);
  return SkinProductRepository(surveyApi);
});

// 데이터 관리 클래스의 인스턴스를 생성하는 Provider
final skinProductStateProvider = StateNotifierProvider<SkinProductDataState,
    AsyncValue<List<SkinProductModel>>>(
  (ref) => SkinProductDataState(ref.read(surveyRepositoryProvider)),
);
