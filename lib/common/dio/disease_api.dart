import 'package:beauty_care/disease/model/disease_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'package:beauty_care/common/const/values.dart';

import 'package:beauty_care/common/model/page_response_model.dart';

part 'disease_model.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class DiseaseApi {
  factory DiseaseApi(Dio dio, {String baseUrl}) = _DiseaseApi;

  @GET('/common/diseases')
  Future<PageResponse<DiseaseModel>> getDiseaseAll();

  @GET('/common/diseases')
  Future<PageResponse<DiseaseModel>> getDiseaseByQuery(
      @Queries() Map<String, dynamic> query);
}
