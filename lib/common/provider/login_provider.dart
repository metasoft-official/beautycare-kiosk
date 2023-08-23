import 'package:beauty_care/user/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:beauty_care/common/model/user_model.dart';
import 'package:beauty_care/common/dio/login_api.dart';
import 'package:beauty_care/common/repository/user_repository.dart';

final loginApiProvider = Provider<LoginApi>((ref) => LoginApi(Dio()));

// 로그인 된 유저 상태 저장
final userRepositoryProvider = Provider<UserRepository>((ref) =>
    UserRepository(ref.read(userApiProvider), ref.read(loginApiProvider)));

final userNotifierProvider = StateNotifierProvider<UserNotifier, UserModel>(
    (ref) => UserNotifier(ref.read(userRepositoryProvider)));

final loginNotifierProvider =
    ChangeNotifierProvider<LoginState>((ref) => LoginState());

// 토큰 저장
class TokenStateNotifier extends StateNotifier<String> {
  TokenStateNotifier() : super('');

  void updateToken(String newValue) {
    state = newValue;
  }

  void clearToken() {
    state = '';
  }
}

final tokenStateNotifierProvider =
    StateNotifierProvider<TokenStateNotifier, String>(
        (ref) => TokenStateNotifier());

final emailControllerProvider = Provider((_) => TextEditingController());
final passwordControllerProvider = Provider((_) => TextEditingController());

final storage = FlutterSecureStorage(); // FlutterSecureStorage를 storage로 저장
dynamic userInfo = ''; // storage에 있는 유저 정보를 저장

class UserNotifier extends StateNotifier<UserModel> {
  final UserRepository _userRepository;
  UserModel user = UserModel();

  UserNotifier(this._userRepository) : super(UserModel());

  void update(UserModel userModel) {
    state = userModel;
  }

  Future<String> login(String username, String password) async {
    try {
      final uuid = await _userRepository.login(username, password);

      String token = await _userRepository.getUserInfoTokenList(uuid);

      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

      final response = await _userRepository
          .getUserByUsername(decodedToken['user']['username']);
      if (response != null && response.items != null) {
        user = response.items!.first;
      }

      state = state.copyWith(
        id: decodedToken['user']['id'],
        name: decodedToken['user']['name'],
        email: decodedToken['user']['email'],
        username: decodedToken['user']['username'],
      );

      return token;
    } catch (e) {
      print('login failed');
      print(e);
      state = UserModel();
    }
    return 'error';
  }
}

class LoginState extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isCheckedSavedId = false; // 아이디 저장
  bool isCheckedAutoLogin = false; // 자동 로그인

  void resetState() {
    LoginState();
    notifyListeners();
  }
}
