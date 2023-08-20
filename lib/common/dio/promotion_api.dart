import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/promotion/model/promotion_model.dart';
import 'package:dio/dio.dart';

import 'package:retrofit/http.dart';
import 'package:beauty_care/common/const/values.dart';

part 'promotion_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class PromotionApi {
  factory PromotionApi(Dio dio, {String baseUrl}) = _PromotionApi;

  @GET('/common/promotions')
  Future<PageResponse<PromotionModel>> getPromotionAll();

  @GET('/common/promotions')
  Future<PageResponse<PromotionModel>> getPromotionListByQuery(
      @Queries() Map<String, dynamic> query);
}
