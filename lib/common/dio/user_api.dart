import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api.g.dart';

@RestApi(baseUrl: 'http://localhost:9000/api')
abstract class UserApi {
  factory UserApi(Dio dio, {String baseUrl}) = _UserApi;

  @GET('/util/user-info-token/my-token')
  Future<String> getUserInfoTokenList(
      @Header("Authorization") String authHeader);
}
