import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/common/model/skincare_category_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'skin_category_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class SkinCategoryApi {
  factory SkinCategoryApi(Dio dio, {String baseUrl}) = _SkinCategoryApi;

  @GET('/common/skincare-categories')
  Future<PageResponse<SkincareCategoryModel>> getSkincareCategoryAll();

  @GET('/common/skincare-categories')
  Future<PageResponse<SkincareCategoryModel>> getSkincareCategoryByParentId(
      @Queries() Map<String, dynamic> query);
}
