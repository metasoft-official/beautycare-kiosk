import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


import '../model/user_model.dart';

part 'user_api.g.dart';

@RestApi(baseUrl: 'http://localhost:9000/api')
abstract class UserApi {
  factory UserApi(Dio dio, {String baseUrl}) = _UserApi;

  @POST('/login')
  Future<String> login (@Body() Map<String, dynamic> body);
}
