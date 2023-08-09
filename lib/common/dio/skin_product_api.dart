import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/cosmetic/model/skin_product_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'skin_product_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class SkinProductApi {
  factory SkinProductApi(Dio dio, {String baseUrl}) = _SkinProductApi;

  @GET('/common/skincare-products')
  Future<PageResponse<SkinProductModel>> getSkinProductAll();

  @GET('/common/skincare-products')
  Future<PageResponse<SkinProductModel>> getSkinProductByQuery(
      @Queries() Map<String, dynamic> query);
}
