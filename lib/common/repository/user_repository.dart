import '../dio/user_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepository {
  final UserApi _userApi;

  UserRepository(this._userApi);

  Future<String> login(String username, String password) async {
    final authorization =
        await _userApi.login({'username': username, 'password': password});

    String token = authorization.replaceAll('Bearer', '');
    token = token.replaceAll("[", "");
    token = token.replaceAll("]", "");
    token = token.replaceAll(" ", "");

    return token;
  }
}
