import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/user_model.dart';
import '../dio/user_api.dart';
import '../repository/user_repository.dart';

final userApiProvider = Provider<UserApi>((ref) => UserApi(Dio()));

final userRepositoryProvider = Provider<UserRepository>(
    (ref) => UserRepository(ref.read(userApiProvider)));

final userNotifierProvider = StateNotifierProvider<UserNotifier, UserState>(
    (ref) => UserNotifier(ref.read(userRepositoryProvider)));

final emailControllerProvider = Provider((_) => TextEditingController());
final passwordControllerProvider = Provider((_) => TextEditingController());

final storage = FlutterSecureStorage(); // FlutterSecureStorage를 storage로 저장
dynamic userInfo = ''; // storage에 있는 유저 정보를 저장

class UserState {
  final String? user;
  final String? error;

  UserState({this.user, this.error});
}

class UserNotifier extends StateNotifier<UserState> {
  final UserRepository _userRepository;

  UserNotifier(this._userRepository) : super(UserState());

  Future<void> login(String username, String password) async {
    try {
      final token = await _userRepository.login(username, password);
      try {
        final userCredential =
            await FirebaseAuth.instance.signInWithCustomToken(token);
        print("Sign-in successful.");
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "invalid-custom-token":
            print("The supplied token is not a Firebase custom auth token.");
            break;
          case "custom-token-mismatch":
            print("The supplied token is for a different Firebase project.");
            break;
          default:
            print("Unkown error.");
        }
      }
    } catch (e) {
      state = UserState(error: e.toString());
    }
  }
}
