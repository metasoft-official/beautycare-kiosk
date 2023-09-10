import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/common/model/search_trend_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'search_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class SearchApi {
  factory SearchApi(Dio dio, {String baseUrl}) = _SearchApi;

  @GET('/common/search-trends')
  Future<PageResponse<SearchTrendModel>> getSearchTrendList();

  @GET('/common/search-trends')
  Future<PageResponse<SearchTrendModel>> getSearchTrendByQuery(
      @Queries() Map<String, dynamic> query);
}
