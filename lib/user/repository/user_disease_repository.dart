import 'package:beauty_care/common/dio/user_disease_api.dart';
import 'package:beauty_care/main.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/user/model/user_disease_model.dart';

class UserDiseaseRepository {
  final UserDiseaseApi userDiseaseApi;

  UserDiseaseRepository(this.userDiseaseApi);

  // all
  Future<PageResponse<UserDiseaseModel>?> getUserSkinMbtiAll() async {
    try {
      final response = await userDiseaseApi.getUserDiseaseAll();
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }

  // by query
  Future<PageResponse<UserDiseaseModel>?> getUserSkinMbtiByQuery(
      UserDiseaseModel userDiseaseModel) async {
    final Map<String, dynamic> query = {...userDiseaseModel.toJson()};
    try {
      final response = await userDiseaseApi.getUserDiseaseByQuery(query);
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }

  // by id
  Future<UserDiseaseModel?> getUserDiseaseById(int id) async {
    try {
      final response = await userDiseaseApi.getUserDiseaseById(id);
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }
}
