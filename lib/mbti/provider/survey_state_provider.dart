import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/dio/survey_api.dart';
import 'package:beauty_care/mbti/repository/survey_repository.dart';
import 'package:beauty_care/mbti/model/survey_question_model.dart';

import 'package:beauty_care/mbti/provider/state/survey_progress_state.dart';
import 'package:beauty_care/mbti/provider/state/survey_data_state.dart';

// api
final surveyApiProvider = Provider<SurveyApi>((ref) {
  final dio = ref.read(dioProvider);
  return SurveyApi(dio);
});

// repository
final surveyRepositoryProvider = Provider<SurveyRepository>((ref) {
  final surveyApi = ref.read(surveyApiProvider);
  return SurveyRepository(surveyApi);
});

// SurveyState
final surveyStateProvider =
    StateNotifierProvider<SurveyDataState, AsyncValue<Map<String, dynamic>>>(
  (ref) => SurveyDataState(ref, ref.read(surveyRepositoryProvider)),
);

// Survey 진행 상태
final surveyProgressStateProvider = StateNotifierProvider.family<
    SurveyProgressState,
    SurveyProgressData,
    Map<String, dynamic>>((ref, isClicked) => SurveyProgressState(isClicked));
