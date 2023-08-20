import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/user/model/user_skin_mbti_model.dart';

part 'user_skin_mbti_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class UserSkinMbtiApi {
  factory UserSkinMbtiApi(Dio dio, {String baseUrl}) = _UserSkinMbtiApi;

  @GET('/common/user-skin-mbtis')
  Future<PageResponse<UserSkinMbtiModel>> getUserSkinMbtiAll();

  @GET('/common/user-skin-mbtis')
  Future<PageResponse<UserSkinMbtiModel>> getUserSkinMbtiByQuery(
      @Queries() Map<String, dynamic> query);

  @GET('/common/user-skin-mbtis/{id}')
  Future<UserSkinMbtiModel> getUserSkinMbtiById(@Path("id") int id);
}
