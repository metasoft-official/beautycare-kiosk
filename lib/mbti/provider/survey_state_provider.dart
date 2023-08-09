import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/dio/survey_api.dart';
import 'package:beauty_care/mbti/repository/survey_repository.dart';
import 'package:beauty_care/mbti/model/survey_question_model.dart';

import 'package:beauty_care/mbti/provider/state/survey_progress_state.dart';
import 'package:beauty_care/mbti/provider/state/survey_data_state.dart';

// Dio 인스턴스를 생성하는 Provider
final dioProvider = Provider<Dio>((_) => Dio());

// SurveyApi 인스턴스를 생성하는 Provider
final surveyApiProvider = Provider<SurveyApi>((ref) {
  final dio = ref.read(dioProvider);
  return SurveyApi(dio);
});

// SurveyRepository 인스턴스를 생성하는 Provider
final surveyRepositoryProvider = Provider<SurveyRepository>((ref) {
  final surveyApi = ref.read(surveyApiProvider);
  return SurveyRepository(surveyApi);
});

// SurveyState 데이터 관리 클래스의 인스턴스를 생성하는 Provider
final surveyStateProvider = StateNotifierProvider<SurveyDataState,
    AsyncValue<List<SurveyQuestionModel>>>(
  (ref) => SurveyDataState(ref.read(surveyRepositoryProvider)),
);

// SurveyState 진행 상태 관리 클래스의 인스턴스를 생성하는 Provider
final surveyProgressStateProvider =
    StateNotifierProvider<SurveyProgressState, SurveyProgressData>(
        (_) => SurveyProgressState());
