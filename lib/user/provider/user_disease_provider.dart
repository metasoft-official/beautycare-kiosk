import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/dio/user_disease_api.dart';
import 'package:beauty_care/user/repository/user_disease_repository.dart';

// Api 인스턴스를 생성하는 Provider
final userDiseaseApiprovider = Provider<UserDiseaseApi>((ref) {
  final dio = ref.read(dioProvider);
  return UserDiseaseApi(dio);
});

// Repository 인스턴스를 생성하는 Provider
final userDiseaseRepositoryProvider = Provider<UserDiseaseRepository>((ref) {
  final userDiseaseApi = ref.read(userDiseaseApiprovider);
  return UserDiseaseRepository(userDiseaseApi);
});
