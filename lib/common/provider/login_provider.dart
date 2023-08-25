import 'package:beauty_care/user/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:beauty_care/common/model/user_model.dart';
import 'package:beauty_care/common/dio/login_api.dart';
import 'package:beauty_care/common/repository/user_repository.dart';

import '../../main.dart';

final loginApiProvider = Provider<LoginApi>((ref) => LoginApi(Dio()));

// 로그인 된 유저 상태 저장
final userRepositoryProvider = Provider<UserRepository>((ref) =>
    UserRepository(ref.read(userApiProvider), ref.read(loginApiProvider)));

final userNotifierProvider = StateNotifierProvider<UserNotifier, UserModel>(
    (ref) => UserNotifier(ref.read(userRepositoryProvider)));

final loginNotifierProvider =
    AutoDisposeChangeNotifierProvider<LoginState>((ref) => LoginState());

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

final socialLoginTypeProvider =
    StateNotifierProvider<SocialLoginTypeStateNotifier, String>(
        (ref) => SocialLoginTypeStateNotifier());

class SocialLoginTypeStateNotifier extends StateNotifier<String> {
  SocialLoginTypeStateNotifier() : super('');
  void update(String newValue) {
    state = newValue;
  }
}

final storage = FlutterSecureStorage(); // FlutterSecureStorage를 storage로 저장
dynamic userInfo = ''; // storage에 있는 유저 정보를 저장

class UserNotifier extends StateNotifier<UserModel> {
  final UserRepository _userRepository;

  UserNotifier(this._userRepository) : super(UserModel());

  void update(UserModel userModel) {
    state = userModel;
  }

  Future<String> login(String username, String password) async {
    try {
      final uuid = await _userRepository.login(username, password);

      String token = await _userRepository.getUserInfoTokenList(uuid);

      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

      state = UserModel.fromJson(decodedToken['user']);

      return token;
    } catch (e) {
      logger.e('', e);
      state = UserModel();
    }
    return 'error';
  }
}

class LoginState extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginState([int initialCount = 0]) {}

  bool isCheckedSavedId = false; // 아이디 저장
  bool isCheckedAutoLogin = false; // 자동 로그인

  void resetState() {
    LoginState();
    notifyListeners();
  }
}
