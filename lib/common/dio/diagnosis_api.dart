import 'dart:io';

import 'package:beauty_care/mbti/model/diagnosis_result_model.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:beauty_care/main.dart';
import 'package:retrofit/http.dart';
import 'package:beauty_care/common/const/values.dart';

part 'diagnosis_api.g.dart';

@RestApi(baseUrl: 'http://220.76.251.246:18812')
abstract class DiagnosisApi {
  factory DiagnosisApi(Dio dio) = _DiagnosisApi;

  @MultiPart()
  @POST('')
  Future<DiagnosisResultModel> uploadDiagnosisImage(
      @Part(name: 'file') List<int> file);
}
