import 'package:beauty_care/main.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:beauty_care/common/dio/survey_api.dart';
import 'package:beauty_care/mbti/model/survey_question_model.dart';
import 'package:beauty_care/mbti/repository/survey_repository.dart';

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

// SurveyState 상태 관리 클래스의 인스턴스를 생성하는 Provider
final surveyStateProvider =
    StateNotifierProvider<SurveyState, AsyncValue<List<SurveyQuestionModel>>>(
  (ref) => SurveyState(ref.read(surveyRepositoryProvider)),
);

// SurveyState 클래스
class SurveyState extends StateNotifier<AsyncValue<List<SurveyQuestionModel>>> {
  final SurveyRepository repository;

  SurveyState(this.repository) : super(const AsyncValue.loading()) {
    loadData();
  }

  Future<void> loadData() async {
    try {
      final data = await repository.getSurveyQuestionsAll();
      if (data != null && data.items != null && data.items!.isNotEmpty) {
        state = AsyncValue.data(data.items!);
      }
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> reloadData() async {
    state = const AsyncValue.loading();
    await loadData();
  }
}
