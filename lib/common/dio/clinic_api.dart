import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/clinic/model/clinic_model.dart';

part 'clinic_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class ClinicApi {
  factory ClinicApi(Dio dio, {String baseUrl}) = _ClinicApi;

  @GET('/common/clinics')
  Future<PageResponse<ClinicModel>> getClinicAll();

  @GET('/common/clinics')
  Future<PageResponse<ClinicModel>> getClinicByQuery(
      @Queries() Map<String, dynamic> query);
}
