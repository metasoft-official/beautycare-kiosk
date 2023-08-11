import 'package:beauty_care/common/dio/code_api.dart';
import 'package:beauty_care/common/model/code_model.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/common/model/skincare_category_model.dart';
import 'package:beauty_care/common/repository/code_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'dio_provider.dart';

final codeApiProvider = Provider<CodeApi>((ref) {
  final dio = ref.read(dioProvider);
  return CodeApi(dio);
});

final codeProvider = Provider<CodeRepository>((ref) {
  final codeApi = ref.read(codeApiProvider);
  return CodeRepository(codeApi);
});

// 피부고민
final skinKeywordOrderProvider =
    FutureProvider<PageResponse<CodeModel>?>((ref) async {
  final api = ref.read(codeProvider);
  return await api.getCodeListByParentId(43);
});

// 조회기간
final viewPeriodOrderProvider =
    FutureProvider<PageResponse<CodeModel>?>((ref) async {
  final api = ref.read(codeProvider);
  return await api.getCodeListByParentId(50);
});

// 정렬
final sortOrderProvider = FutureProvider<PageResponse<CodeModel>?>((ref) async {
  final api = ref.read(codeProvider);
  return await api.getCodeListByParentId(54);
});
