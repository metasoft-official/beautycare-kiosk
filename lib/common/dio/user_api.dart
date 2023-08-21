import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/common/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:beauty_care/common/const/values.dart';

part 'user_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class UserApi {
  factory UserApi(Dio dio, {String baseUrl}) = _UserApi;

  @GET('/util/user-info-token/my-token')
  Future<String> getUserInfoTokenList(
      @Header("Authorization") String authHeader);

  @GET('/common/users')
  Future<PageResponse<UserModel>> getUserList(
      @Queries() Map<String, dynamic> user);

  @GET('/common/users')
  Future<PageResponse<UserModel>> getUserByUserName(
      @Queries() Map<String, dynamic> username);

  @POST('/app/accounts')
  Future<int> postUser(@Body() Map<String, dynamic> query);
}
