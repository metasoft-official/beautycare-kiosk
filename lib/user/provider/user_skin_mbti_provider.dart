import 'package:beauty_care/common/dio/user_skin_mbti_api.dart';
import 'package:beauty_care/user/repository/user_skin_mbti_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/const/values.dart';

// Api 인스턴스를 생성하는 Provider
final userSkinMbtiApiprovider = Provider<UserSkinMbtiApi>((ref) {
  final dio = ref.read(dioProvider);
  return UserSkinMbtiApi(dio);
});

// Repository 인스턴스를 생성하는 Provider
final userSkinMbtiRepositoryProvider = Provider<UserSkinMbtiRepository>((ref) {
  final userSkinMbtiApi = ref.read(userSkinMbtiApiprovider);
  return UserSkinMbtiRepository(userSkinMbtiApi);
});
