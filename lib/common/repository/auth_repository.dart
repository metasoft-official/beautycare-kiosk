// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// import 'package:go_router/go_router.dart';
// import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';
//
// import '../model/user_model.dart';
// import '../dio/auth_api.dart';
//
// class AuthRepository {
//   final AuthApi _authApi;
//
//   AuthRepository(this._authApi);
//
//   Future<Dio> authenticated(BuildContext context) async {
//     const storage = FlutterSecureStorage();
//
//     var dio = Dio();
//
//     dio.interceptors.clear();
//     dio.interceptors
//         .add(InterceptorsWrapper(onRequest: (options, handler) async {
//       // 기기에 저장된 access token 로드
//       final accessToken = await storage.read(key: 'ACCESS_TOKEN');
//
//       // 요청시 헤더에 accessToken 포함
//       options.headers['Authorization'] = 'Bearer $accessToken';
//       return handler.next(options);
//     }, onError: (error, handler) async {
//       if (error.response?.statusCode == 401) {
//         final accessToken = await storage.read(key: 'ACCESS_TOKEN');
//         final refreshToken = await storage.read(key: 'REFRESH_TOKEN');
//
//         var refreshDio = Dio();
//
//         refreshDio.interceptors.clear();
//         refreshDio.interceptors
//             .add(InterceptorsWrapper(onError: (error, handler) async {
//           // refreshToken 만료
//           if (error.response?.statusCode == 401) {
//             await storage.deleteAll();
//
//             // 로그인 만료 알림.
//             // 로그인 페이지 이동
//           }
//         }));
//
//         // 토큰 갱신 api 요청시 access token 만료
//
//         refreshDio.options.headers['authorization'] = 'Bearer $accessToken';
//         refreshDio.options.headers['Refresh'] = 'Bearer $accessToken';
//
//         // 토큰 갱신 api 요청
//         final refreshResponse = await refreshDio.get('/token/refresh');
//
//         // response로부터 새로 갱신된 AccessToken과 RefreshToken 파싱
//         final newAccessToken = refreshResponse.headers['Authorization']![0];
//         final newRefreshToken = refreshResponse.headers['Refresh']![0];
//
//         // 기기에 저장된 AccessToken과 RefreshToken 갱신
//         await storage.write(key: 'ACCESS_TOKEN', value: newAccessToken);
//         await storage.write(key: 'REFRESH_TOKEN', value: newRefreshToken);
//
//         // AccessToken의 만료로 수행하지 못했던 API 요청에 담겼던 AccessToken 갱신
//         error.requestOptions.headers['Authorization'] =
//             'Bearer $newAccessToken';
//
//         // 수행하지 못했던 API 요청 복사본 생성
//         final clonedRequest = await dio.request(error.requestOptions.path,
//             options: Options(
//                 method: error.requestOptions.method,
//                 headers: error.requestOptions.headers),
//             data: error.requestOptions.data,
//             queryParameters: error.requestOptions.queryParameters);
//
//         // API 복사본으로 재요청
//         return handler.resolve(clonedRequest);
//       }
//       return handler.next(error);
//     }));
//     return dio;
//   }
// }
