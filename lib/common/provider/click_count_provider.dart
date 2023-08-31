import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/dio/click_count_api.dart';
import 'package:beauty_care/common/repository/click_count_repository.dart';

final clickCountApiProvider = Provider<ClickCountApi>((ref) {
  final dio = ref.read(dioProvider);
  return ClickCountApi(dio);
});

final clickCountRepositoryProvider = Provider<ClickCountRepository>((ref) {
  final clickCountApi = ref.read(clickCountApiProvider);
  return ClickCountRepository(clickCountApi);
});
