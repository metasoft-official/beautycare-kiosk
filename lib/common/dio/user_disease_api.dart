import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/user/model/user_disease_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'user_disease_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class UserDiseaseApi {
  factory UserDiseaseApi(Dio dio, {String baseUrl}) = _UserDiseaseApi;

  @GET('/common/user-diseases')
  Future<PageResponse<UserDiseaseModel>> getUserDiseaseAll();

  @GET('/common/user-diseases')
  Future<PageResponse<UserDiseaseModel>> getUserDiseaseByQuery(
      @Queries() Map<String, dynamic> query);

  @GET('/common/user-diseases/{id}')
  Future<UserDiseaseModel> getUserDiseaseById(@Path("id") int id);

  @POST('/common/user-diseases')
  Future<int> createUserDisease(@Body() UserDiseaseModel userDiseaseModel);

  @PUT('/common/user-diseases/attach-file/{id}')
  Future<int> saveImage(
      @Path('id') int id, @Body() UserDiseaseModel userDiseaseModel);
}
