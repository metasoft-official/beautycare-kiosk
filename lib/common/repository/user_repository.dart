import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/user_model.dart';
import '../dio/user_api.dart';

class UserRepository {

  final UserApi _userApi;

  UserRepository(this._userApi);

  Future<String> login(String username, String password) {

    final response = _userApi.login({'username': username, 'password': password});
    return response;
  }

}
