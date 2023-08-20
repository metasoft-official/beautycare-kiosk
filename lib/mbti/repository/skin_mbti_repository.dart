import 'package:beauty_care/main.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/mbti/model/skin_mbti_model.dart';
import 'package:beauty_care/common/dio/skin_mbti_api.dart';

class SkinMbtiRepository {
  final SkinMbtiApi skinMbtiApi;

  SkinMbtiRepository(this.skinMbtiApi);

  // all
  Future<PageResponse<SkinMbtiModel>?> getSkinMbtiAll() async {
    try {
      final response = await skinMbtiApi.getSkinMbtiAll();
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }

  // by query
  Future<PageResponse<SkinMbtiModel>?> getSkinMbtiByQuery(
      SkinMbtiModel skinMbtiModel) async {
    final Map<String, dynamic> query = {...skinMbtiModel.toJson()};
    try {
      final response = await skinMbtiApi.getSkinMbtiByQuery(query);
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }

  // by id
  Future<SkinMbtiModel?> getSkinMbtiById(int id) async {
    try {
      final response = await skinMbtiApi.getSkinMbtiById(id);
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }
}
