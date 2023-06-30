import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/dio/user_api.dart';

final userApiProvider = Provider<UserApi>((ref) {
  final dio = ref.read(dioProvider);
  return UserApi(dio, baseUrl: BASE_URL);
});
