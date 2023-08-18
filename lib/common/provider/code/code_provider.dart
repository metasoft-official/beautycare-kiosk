import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/dio/code_api.dart';
import 'package:beauty_care/common/repository/code_repository.dart';

final codeApiProvider = Provider<CodeApi>((ref) {
  final dio = ref.read(dioProvider);
  return CodeApi(dio);
});

final codeRepositoryProvider = Provider<CodeRepository>((ref) {
  final codeApi = ref.read(codeApiProvider);
  return CodeRepository(codeApi);
});
