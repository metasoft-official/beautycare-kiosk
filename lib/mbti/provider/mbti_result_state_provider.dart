import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/dio/skin_mbti_api.dart';
import 'package:beauty_care/mbti/provider/state/mbti_result_change_state.dart';
import 'package:beauty_care/mbti/provider/state/mbti_result_data_state.dart';
import 'package:beauty_care/mbti/repository/skin_mbti_repository.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Api 인스턴스를 생성하는 Provider
final skinMbtiApiProvider = Provider<SkinMbtiApi>((ref) {
  final dio = ref.read(dioProvider);
  return SkinMbtiApi(dio);
});

// Repository 인스턴스를 생성하는 Provider
final skinMbtiRepositoryProvider = Provider<SkinMbtiRepository>((ref) {
  final surveyApi = ref.read(skinMbtiApiProvider);
  return SkinMbtiRepository(surveyApi);
});

// 데이터 관리 클래스의 인스턴스를 생성하는 Provider
final mbtiResultStateProvider = StateNotifierProvider.family<
    MbtiResultDataState, AsyncValue<Map<String, dynamic>>, int>(
  (ref, id) =>
      MbtiResultDataState(ref, ref.read(skinMbtiRepositoryProvider), id),
);

final mbtiResultChangeProvider =
    ChangeNotifierProvider<MbtiResultChangeState>((ref) {
  return MbtiResultChangeState();
});
