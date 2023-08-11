import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:beauty_care/common/dio/skin_category_api.dart';
import 'package:beauty_care/common/repository/skin_category_repository.dart';

import 'dio_provider.dart';
import 'package:beauty_care/common/model/page_response_model.dart';
import 'package:beauty_care/common/model/skincare_category_model.dart';

final skinCategoryApiProvider = Provider<SkinCategoryApi>((ref) {
  final dio = ref.read(dioProvider);
  return SkinCategoryApi(dio);
});

final skincareCategoryProvider = Provider<SkincareCategoryRepository>((ref) {
  final skinCategoryApi = ref.read(skinCategoryApiProvider);
  return SkincareCategoryRepository(skinCategoryApi);
});

final typeCategoryProvider =
    FutureProvider<PageResponse<SkincareCategoryModel>?>((ref) async {
  final api = ref.read(skincareCategoryProvider);
  return await api.getSkincareCategoryByParentId(1);
});

final lineCategoryProvider =
    FutureProvider<PageResponse<SkincareCategoryModel>?>((ref) async {
  final api = ref.read(skincareCategoryProvider);
  return await api.getSkincareCategoryByParentId(8);
});
