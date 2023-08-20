import 'package:beauty_care/common/dio/user_api.dart';
import 'package:beauty_care/common/dio/login_api.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/common/model/user_model.dart';

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

  Future<PageResponse<UserModel>?> getUserByUserName(String username) async {
    try {
      final response = await _userApi.getUserByUserName({username: username});
      return response;
    } catch (e, s) {
      logger.e("", e, s);
    }
    return null;
  }
}
