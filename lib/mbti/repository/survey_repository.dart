import 'dart:convert';

import 'package:beauty_care/common/dio/survey_api.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/main.dart';
import 'package:beauty_care/mbti/model/survey_question_model.dart';

class SurveyRepository {
  final SurveyApi surveyApi;

  SurveyRepository(this.surveyApi);

  // 모든 질문 가져오기
  Future<PageResponse<SurveyQuestionModel>?> getSurveyQuestionsAll() async {
    try {
      final response = await surveyApi.getSurveyQuestionAll();
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }

  // 카테고리 별 질문 가져오기
  Future<PageResponse<SurveyQuestionModel>?> getSurveyQuestionsByCategory(
      SurveyQuestionModel questionModel) async {
    final Map<String, dynamic> query = {...questionModel.toJson()};
    try {
      final response = await surveyApi.getSurveyQuestionLByCategory(query);
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }
}
