import 'package:beauty_care/common/dio/oxy_facial_api.dart';
import 'package:beauty_care/main.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/mbti/model/survey_question_model.dart';
import 'package:beauty_care/oxyfacial/model/oxy_facial_model.dart';

class OxyFacialRepository {
  final OxyFacialApi oxyFacialApi;

  OxyFacialRepository(this.oxyFacialApi);

  // 모두 가져오기
  Future<PageResponse<OxyFacialModel>?> getOxyFacialAll() async {
    try {
      final response = await oxyFacialApi.getOxyFacialAll();
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }

  // 특정 리스트 가져오기
  Future<PageResponse<OxyFacialModel>?> getOxyFacialListByQuery(
      OxyFacialModel oxyFacialModel) async {
    final Map<String, dynamic> query = {...oxyFacialModel.toJson()};
    try {
      final response = await oxyFacialApi.getOxyFacialListByQuery(query);
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }
}
