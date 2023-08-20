import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'package:beauty_care/common/const/values.dart';

import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/mbti/model/skin_mbti_model.dart';

part 'skin_mbti_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class SkinMbtiApi {
  factory SkinMbtiApi(Dio dio, {String baseUrl}) = _SkinMbtiApi;

  @GET('/common/skin-mbtis')
  Future<PageResponse<SkinMbtiModel>> getSkinMbtiAll();

  @GET('/common/skin-mbtis')
  Future<PageResponse<SkinMbtiModel>> getSkinMbtiByQuery(
      @Queries() Map<String, dynamic> query);

  @GET('/common/skin-mbtis/{id}')
  Future<SkinMbtiModel> getSkinMbtiById(@Path("id") int id);
}
