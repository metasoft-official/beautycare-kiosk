import 'package:beauty_care/common/dio/user_api.dart';
import 'package:beauty_care/common/dio/login_api.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/common/model/role_user_model.dart';
import 'package:beauty_care/common/model/user_model.dart';
import 'package:beauty_care/user/model/account_dto_model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

//Todo 토큰 적용 및 정리
class UserRepository {
  final UserApi _userApi;
  final LoginApi _loginApi;

  UserRepository(this._userApi, this._loginApi);

  // 유저 있으면 토큰 반환
  Future<String> login(String username, String password) async {
    final authorization =
        await _loginApi.login({'username': username, 'password': password});

    String token = authorization.replaceAll("[", "");
    token = token.replaceAll("]", "");

    return token;
  }

  Future<void> refreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString('refresh_token');

    // final response = await LoginApi.post(
    //     'https://api.example.com/auth/refresh',
    //     body: {'refresh_token': refreshToken});

    // if (response.statusCode == 200) {
    //   final data = json.decode(response.body);
    //   prefs.setString('access_token', data['access_token']);
    //   prefs.setString('refresh_token', data['refresh_token']);
    // } else {
    //   throw Exception('토큰 갱신 실패');
    // }
  }

  // 자동 로그인
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access_token');
    // final refresh_token = prefs.getString('refresh_token');

    if (accessToken != null
        // && refresh_token != null
        ) {
      final decodedAccessToken = JwtDecoder.decode(accessToken);

      final now = DateTime.now();
      final expiresAt = decodedAccessToken['exp'];

      if (now.isBefore(expiresAt)) {
        return true;
      }
    }

    return false;
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
    final Map<String, dynamic> query = {
      'userId': null,
      'roleId': "2",
      'userDto': {...userModel.toJson()}
    };
    logger.d(query['age'] is String);
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
      AccountDtoModel accountDtoModel, UserModel userModel) async {
    final Map<String, dynamic> query = {
      'userId': '${accountDtoModel.userId}',
      'roleId': "${accountDtoModel.roleId}",
      'userDto': {...userModel.toJson()}
    };
    logger.d(query);
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
