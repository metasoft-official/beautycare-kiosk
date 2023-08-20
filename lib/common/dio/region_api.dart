import 'package:dio/dio.dart';

import 'package:retrofit/http.dart';
import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/common/model/region_model.dart';

part 'region_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class RegionApi {
  factory RegionApi(Dio dio, {String baseUrl}) = _RegionApi;

  @GET('/common/regions')
  Future<PageResponse<RegionModel>> getRegionAll();
}
