import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/mbti/model/survey_question_model.dart';
import 'package:beauty_care/mbti/model/user_disease_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'user_disease_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class UserDiseaseApi {
  factory UserDiseaseApi(Dio dio, {String baseUrl}) = _UserDiseaseApi;

  @GET('/common/user-diseases')
  Future<PageResponse<UserDiseaseModel>> getUserDiseaseList(
      @Queries() Map<String, dynamic> query);

  @POST('/common/user-diseases')
  Future<int> createUserDisease(@Body() UserDiseaseModel userDiseaseModel);

  @PUT('/common/user-diseases/attach-file/{id}')
  Future<int> saveImage(
      @Path('id') int id, @Body() UserDiseaseModel userDiseaseModel);
}
