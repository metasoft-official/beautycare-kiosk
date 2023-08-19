import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/mbti/model/survey_question_model.dart';
import 'package:dio/dio.dart';

import 'package:retrofit/http.dart';
import 'package:beauty_care/common/const/values.dart';

part 'survey_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class SurveyApi {
  factory SurveyApi(Dio dio, {String baseUrl}) = _SurveyApi;

  @GET('/common/survey-questions')
  Future<PageResponse<SurveyQuestionModel>> getSurveyQuestionAll();

  @GET('/common/survey-questions')
  Future<PageResponse<SurveyQuestionModel>> getSurveyQuestionLByCategory(
      @Queries() Map<String, dynamic> query);

  @POST('/common/surveys')
  Future<int> postSkinMbti(@Body() Map<String, dynamic> query);
}
