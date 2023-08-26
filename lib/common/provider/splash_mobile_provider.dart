import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/dio/splash_mobile_api.dart';
import 'package:beauty_care/common/repository/splash_mobile_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final splashMobileApiProvider = Provider<SplashMobileApi>((ref) {
  final dio = ref.read(dioProvider);
  return SplashMobileApi(dio);
});

final splashMobileRepositoryProvider = Provider<SplashMobileRepository>((ref) {
  final splashMobileApi = ref.read(splashMobileApiProvider);
  return SplashMobileRepository(splashMobileApi);
});
