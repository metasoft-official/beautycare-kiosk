import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/common/model/splash_mobile_model.dart';

part 'splash_mobile_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class SplashMobileApi {
  factory SplashMobileApi(Dio dio, {String baseUrl}) = _SplashMobileApi;

  @GET('/common/splash-mobiles')
  Future<PageResponse<SplashMobileModel>> getSplashMobileAll();

  @GET('/common/splash-mobiles')
  Future<PageResponse<SplashMobileModel>> getSplashMobileByQuery(
      @Queries() Map<String, dynamic> query);
}
