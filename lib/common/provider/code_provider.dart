import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dio_provider.dart';
import 'package:beauty_care/common/dio/code_api.dart';
import 'package:beauty_care/common/model/code_model.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/common/repository/code_repository.dart';

final codeApiProvider = Provider<CodeApi>((ref) {
  final dio = ref.read(dioProvider);
  return CodeApi(dio);
});

final codeRepositoryProvider = Provider<CodeRepository>((ref) {
  final codeApi = ref.read(codeApiProvider);
  return CodeRepository(codeApi);
});

// 정렬, 필터 목록 가져오기
final orderProvider =
    FutureProvider.family<List<CodeModel>?, int>((ref, parentId) async {
  final api = ref.read(codeRepositoryProvider);
  try {
    final data = await api.getCodeListByParentId(parentId);
    if (data != null && data.items != null) {
      return data.items;
    }
  } catch (error) {
    // Handle error or throw to be caught by Provider
    rethrow;
  }
});
