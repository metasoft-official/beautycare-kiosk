import 'package:beauty_care/main.dart';
import 'package:beauty_care/common/dio/code_api.dart';
import 'package:beauty_care/common/model/code_model.dart';
import 'package:beauty_care/common/model/page_response_model.dart';

class CodeRepository {
  final CodeApi codeApi;

  CodeRepository(this.codeApi);

  // 모든 코드
  Future<PageResponse<CodeModel>?> getCodeListAll() async {
    try {
      final response = await codeApi.getCodeListAll();
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }

  // 종류 별 코드
  Future<PageResponse<CodeModel>?> getCodeListByParentId(int parentId) async {
    final Map<String, dynamic> query = {'parentId': parentId, 'show': 'T'};
    try {
      final response = await codeApi.getCodeListByParentId(query);
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }
}
