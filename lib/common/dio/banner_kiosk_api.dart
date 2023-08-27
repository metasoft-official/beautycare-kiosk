import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/kiosk/model/banner_kiosk_model.dart';

part 'banner_kiosk_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class BannerKioskApi {
  factory BannerKioskApi(Dio dio, {String baseUrl}) = _BannerKioskApi;

  @GET('/common/banner-kiosks')
  Future<PageResponse<BannerKioskModel>> getBannerKioskAll();

  @GET('/common/banner-kiosks')
  Future<PageResponse<BannerKioskModel>> getBannerKioskByQuery(
      @Queries() Map<String, dynamic> query);
}
