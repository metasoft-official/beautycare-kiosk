import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';

import '../model/user_model.dart';
import '../dio/user_api.dart';
import '../repository/user_repository.dart';


final userApiProvider = Provider<UserApi>((ref) => UserApi(Dio()));

final userRepositoryProvider = Provider<UserRepository>((ref) => UserRepository(ref.read(userApiProvider)));

final userNotifierProvider = StateNotifierProvider<UserNotifier, UserState>((ref) => UserNotifier(ref.read(userRepositoryProvider)));


final emailControllerProvider = Provider((_) => TextEditingController());
final passwordControllerProvider = Provider((_) => TextEditingController());


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
      final user = await _userRepository.login(username, password);
      state = UserState(user: "");
    } catch (e) {
      state = UserState(error: e.toString());
    }
  }
}