import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/provider/code/code_provider.dart';
import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:beauty_care/mbti/model/survey_param_model.dart';
import 'package:beauty_care/mbti/model/survey_question_model.dart';
import 'package:beauty_care/mbti/repository/survey_repository.dart';

class SurveyDataState extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  Ref ref;
  final SurveyRepository repository;

  SurveyDataState(this.ref, this.repository)
      : super(const AsyncValue.loading()) {
    loadData();
  }

  Map<String, dynamic> data = {};
  Map<String, dynamic> questions = {};
  Map<String, dynamic> isClicked = {};
  List<String> categoryName = [];
  List<int> questionIdList = [];

  bool resultLoadingState = false; // 답변 전달 로딩 상태

  Future<void> loadData() async {
    try {
      await Future.wait([
        getSurveyQuestionList(6),
        getCategoryName(5),
        getSurveyQuestionIdList()
      ]);
      data['questions'] = questions;
      state = AsyncValue.data(data);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  // 질문 목록 카테고리 별로 가져오기
  Future<void> getSurveyQuestionList(int startCode) async {
    final user = ref.read(userNotifierProvider.notifier).user;
    for (int i = startCode; i < startCode + 4; i++) {
      SurveyQuestionModel surveyQuestionModel =
          SurveyQuestionModel(categoryCode: i, visibilityStatus: 'A');
      final response =
          await repository.getSurveyQuestionsByCategory(surveyQuestionModel);
      if (response != null && response.items != null) {
        questions['$i'] = List.from(response.items!);
        int j = 0;
        while (j < questions['$i'].length) {
          if (questions['$i'][j].surveyAnswerList == null ||
              questions['$i'][j].surveyAnswerList.length == 0) {
            questions['$i'].removeAt(j);
          } else if (user.gender == 'M' &&
              i == 8 &&
              questions['8'][j].id == 25) {
            questions['8'].removeAt(j);
          } else {
            j++;
          }
        }
        for (var i in questions['$i']) {}
        isClicked['$i'] =
            List<int>.filled(questions['$i'].length, 0, growable: false);
        data['isClicked'] = isClicked;
      } else {
        data['questions'] = [];
      }
    }
  }

  // 전체 질문 아이디 리스트 (보낼 용)
  Future<void> getSurveyQuestionIdList() async {
    final user = ref.read(userNotifierProvider);
    final List<SurveyQuestionModel> allQuestions;
    final response = await repository.getSurveyQuestionsByCategory(
        SurveyQuestionModel(visibilityStatus: 'A'));
    if (response != null && response.items != null) {
      allQuestions = List.from(response.items!);
      //답변 리스트 없는 경우 제거
      int i = 0;
      while (i < allQuestions.length) {
        if (allQuestions[i].surveyAnswerList == null ||
            allQuestions[i].surveyAnswerList!.isEmpty) {
          allQuestions.removeAt(i);
        } else if (user.gender == 'M' && allQuestions[i].id == 25) {
          allQuestions.removeAt(i);
        } else {
          i++;
        }
      }
      for (var e in allQuestions) {
        questionIdList.add(e.id!);
      }
    }
  }

  // 카테고리 이름
  Future<void> getCategoryName(parentId) async {
    final codeRepository = ref.read(codeRepositoryProvider);
    final response = await codeRepository.getCodeListByParentId(parentId);
    if (response != null && response.items != null) {
      for (var e in response.items!) {
        categoryName.add(e.name ?? '-');
      }
    } else {
      categoryName = [];
    }
  }

  Future<void> reloadData() async {
    state = AsyncValue.data(data);
    await loadData();
  }

  // 답변 전달
  Future<int?> postSurveyResult() async {
    resultLoadingState = true;

    userInfo = ref.read(userNotifierProvider);
    final allAnswers = [];
    List<SurveyResponseModel> surveyResponseModels = [];

    // 답변 합치기
    for (int i = 6; i < 10; i++) {
      for (var e in data['isClicked']['$i']) {
        allAnswers.add(e);
      }
    }

    // 질문 답변 매칭
    for (int i = 0; i < questionIdList.length; i++) {
      surveyResponseModels.add(SurveyResponseModel(
          questionId: questionIdList[i], answerId: allAnswers[i]));
    }

    // 전달 모델
    SurveyParamModel surveyParamModel =
        SurveyParamModel(userId: userInfo.id, responses: surveyResponseModels);

    final response = await repository.postMbtiResult(surveyParamModel);
    if (response != null) {
      resultLoadingState = false;
      return response;
    } else {
      return null;
    }
  }
}
