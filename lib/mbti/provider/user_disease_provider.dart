import 'package:beauty_care/common/dio/user_disease_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/const/values.dart';

final userDiseaseApiProvider = Provider<UserDiseaseApi>((ref) {
  final dio = ref.read(dioProvider);
  return UserDiseaseApi(dio, baseUrl: BASE_URL);
});
