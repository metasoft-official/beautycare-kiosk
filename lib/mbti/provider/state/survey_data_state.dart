import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:beauty_care/mbti/model/survey_question_model.dart';
import 'package:beauty_care/mbti/repository/survey_repository.dart';

class SurveyDataState
    extends StateNotifier<AsyncValue<List<SurveyQuestionModel>>> {
  final SurveyRepository repository;

  SurveyDataState(this.repository) : super(const AsyncValue.loading()) {
    loadData();
  }

  List<int> isClicked = [];

  Future<void> loadData() async {
    try {
      final data = await repository.getSurveyQuestionsAll();
      if (data != null && data.items != null) {
        state = AsyncValue.data(data.items!);
        isClicked = List<int>.filled(data.items!.length, 0, growable: false);
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
