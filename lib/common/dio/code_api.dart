import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/model/code_model.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'code_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class CodeApi {
  factory CodeApi(Dio dio, {String baseUrl}) = _CodeApi;

  @GET('/common/codes')
  Future<PageResponse<CodeModel>> getCodeListAll();

  @GET('/common/codes')
  Future<PageResponse<CodeModel>> getCodeListByParentId(
      @Queries() Map<String, dynamic> query);
}
