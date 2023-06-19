import 'package:beauty_care/common/provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../model/user_model.dart';
import '../dio/user_api.dart';
import '../dio/login_api.dart';
import 'package:beauty_care/common/provider/auth_provider.dart';
import '../repository/user_repository.dart';

final loginApiProvider = Provider<LoginApi>((ref) => LoginApi(Dio()));

// 로그인 된 유저 상태 저장
final userRepositoryProvider = Provider<UserRepository>((ref) =>
    UserRepository(ref.read(userApiProvider), ref.read(loginApiProvider)));

final userNotifierProvider = StateNotifierProvider<UserNotifier, UserModel>(
    (ref) => UserNotifier(ref.read(userRepositoryProvider)));

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

// class UserState {
//   final String? user;
//   final String? error;
//
//   UserState({this.user, this.error});
// }

class UserNotifier extends StateNotifier<UserModel> {
  final UserRepository _userRepository;

  UserNotifier(this._userRepository) : super(UserModel());

  Future<String> login(String username, String password) async {
    try {
      final uuid = await _userRepository.login(username, password);

      String token = await _userRepository.getUserInfoTokenList(uuid);
      print(token);

      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

      // print("----- state -----");
      // print(decodedToken);

      state = state.copyWith(name: decodedToken['user']['name']);

      // print("----- user -----");
      // print(decodedToken['user']['name']);

      return token;
    } catch (e) {
      print('login failed');
      print(e);
      state = UserModel();
    }
    return 'error';
  }
}
