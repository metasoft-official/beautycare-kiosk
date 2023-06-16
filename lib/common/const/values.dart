import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const String BASE_URL = 'http://localhost:9000/api';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.options.baseUrl = 'http://api.example.com';
  return dio;
});
