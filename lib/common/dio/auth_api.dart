import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../const/values.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @GET('/')
  Future<String> authenticated(@Header('Authorization') String token);
}
