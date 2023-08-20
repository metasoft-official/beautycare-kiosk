import 'package:beauty_care/main.dart';
import 'package:beauty_care/common/dio/user_skin_mbti_api.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/user/model/user_skin_mbti_model.dart';

class UserSkinMbtiRepository {
  final UserSkinMbtiApi userSkinMbtiApi;

  UserSkinMbtiRepository(this.userSkinMbtiApi);

  // all
  Future<PageResponse<UserSkinMbtiModel>?> getUserSkinMbtiAll() async {
    try {
      final response = await userSkinMbtiApi.getUserSkinMbtiAll();
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }

  // by query
  Future<PageResponse<UserSkinMbtiModel>?> getUserSkinMbtiByQuery(
      UserSkinMbtiModel userSkinMbtiModel) async {
    final Map<String, dynamic> query = {...userSkinMbtiModel.toJson()};
    try {
      final response = await userSkinMbtiApi.getUserSkinMbtiByQuery(query);
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }

  // by id
  Future<UserSkinMbtiModel?> getUserSkinMbtiById(int id) async {
    try {
      final response = await userSkinMbtiApi.getUserSkinMbtiById(id);
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }
}
