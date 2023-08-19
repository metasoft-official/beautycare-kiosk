import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/oxyfacial/model/oxy_facial_model.dart';
import 'package:dio/dio.dart';

import 'package:retrofit/http.dart';
import 'package:beauty_care/common/const/values.dart';

part 'oxy_facial_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class OxyFacialApi {
  factory OxyFacialApi(Dio dio, {String baseUrl}) = _OxyFacialApi;

  @GET('/common/oxy-facials')
  Future<PageResponse<OxyFacialModel>> getOxyFacialAll();

  @GET('/common/oxy-facials')
  Future<PageResponse<OxyFacialModel>> getOxyFacialListByQuery(
      @Queries() Map<String, dynamic> query);
}
