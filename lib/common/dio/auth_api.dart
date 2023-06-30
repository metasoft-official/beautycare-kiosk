import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/provider/login_provider.dart';

// final dioProvider = Provider<Dio>((ref) {
//   final dio = Dio();
//   dio.interceptors.add(InterceptorsWrapper(
//     onRequest: (options, handler) {
//       // Get the token
//       final token = ref.read(tokenStateNotifierProvider);
//
//       if (token.isNotEmpty) {
//         options.headers['Authorization'] = 'Bearer $token';
//       }
//
//       return handler.next(options);
//     },
//     onError: (DioError error, handler) {
//       if (error.response?.statusCode == 401) {
//         // If we get a 401, clear the token and redirect to the login page
//         ref.read(tokenStateNotifierProvider.notifier).clearToken();
//         // You will need to handle the redirection yourself here
//       }
//
//       return handler.next(error);
//     },
//   ));
//
//   return dio;
// });
