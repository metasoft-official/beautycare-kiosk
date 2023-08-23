import 'package:beauty_care/common/dio/user_api.dart';
import 'package:beauty_care/common/dio/login_api.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/common/model/role_user_model.dart';
import 'package:beauty_care/common/model/user_model.dart';
import 'package:beauty_care/user/model/account_dto_model.dart';

import '../../main.dart';

class UserRepository {
  final UserApi _userApi;
  final LoginApi _loginApi;

  UserRepository(this._userApi, this._loginApi);

  Future<String> login(String username, String password) async {
    final authorization =
        await _loginApi.login({'username': username, 'password': password});

    String token = authorization.replaceAll("[", "");
    token = token.replaceAll("]", "");

    return token;
  }

  Future<String> getUserInfoTokenList(String authHeader) async {
    final authorization = await _userApi.getUserInfoTokenList(authHeader);
    return authorization;
  }

  Future<PageResponse<UserModel>?> getUserByUsername(String username) async {
    try {
      final response = await _userApi.getUserList({'username': username});
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }

  Future<RoleUserModel?> getUserRoleByUserId(int userId) async {
    try {
      final response = await _userApi.getUserRoleByUserId({'userId': userId});
      if (response.items != null && response.items?.first != null) {
        return response.items?.first;
      }
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }

  Future<String?> postUser(UserModel userModel) async {
    AccountDtoModel accountDtoModel =
        AccountDtoModel(userDto: userModel, roleId: 2);
    final Map<String, dynamic> query = {
      ...accountDtoModel.toJson(),
    };
    try {
      final response = await _userApi.postUser(query);
      logger.d(response);
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }

  Future<String?> putUser(
    AccountDtoModel accountDtoModel,
  ) async {
    final Map<String, dynamic> query = {
      ...accountDtoModel.toJson(),
    };
    try {
      final response = await _userApi.putUser(query);
      logger.d(response);
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }
}
