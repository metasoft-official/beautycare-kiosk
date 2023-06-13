import '../dio/user_api.dart';
import '../dio/login_api.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepository {
  final UserApi _userApi;
  final LoginApi _loginApi;

  UserRepository(this._userApi, this._loginApi);

  Future<String> login(String username, String password) async {
    final authorization =
        await _loginApi.login({'username': username, 'password': password});

    String token = authorization.replaceAll("[", "");
    token = token.replaceAll("]", "");

    // token = token.replaceAll('Bearer', '');
    // token = token.replaceAll("[", "");
    // token = token.replaceAll(" ", "");
    //
    // token = token.replaceAll("-", ".");

    return token;
  }

  Future<String> getUserInfoTokenList(String authHeader) async {
    final authorization = await _userApi.getUserInfoTokenList(authHeader);
    return authorization;
  }
}
