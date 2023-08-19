import 'package:beauty_care/main.dart';
import 'package:beauty_care/common/dio/disease_api.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/disease/model/disease_model.dart';

class DiseaseRepository {
  final DiseaseApi diseaseApi;

  DiseaseRepository(this.diseaseApi);

  // all
  Future<PageResponse<DiseaseModel>?> getDiseaseAll() async {
    try {
      final response = await diseaseApi.getDiseaseAll();
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }

  // by query
  Future<PageResponse<DiseaseModel>?> getDiseaseByQuery(
      DiseaseModel diseaseModel) async {
    final Map<String, dynamic> query = {...diseaseModel.toJson()};
    try {
      final response = await diseaseApi.getDiseaseByQuery(query);
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }
}
