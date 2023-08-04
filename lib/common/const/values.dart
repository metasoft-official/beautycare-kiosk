import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const String BASE_URL = 'http://10.0.2.2:9000/api';

// const String BASE_URL = 'http://192.168.0.101:9000/api';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.options.baseUrl = BASE_URL;
  return dio;
});
