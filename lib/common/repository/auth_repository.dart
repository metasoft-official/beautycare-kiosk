import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


import '../model/user_model.dart';
import '../dio/auth_api.dart';

class AuthRepository {

  final AuthApi _authApi;

  AuthRepository(this._authApi);

  Future<String> authenticated(String token) {
    return _authApi.authenticated(token);
  }


}
