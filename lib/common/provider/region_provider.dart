import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/dio/region_api.dart';
import 'package:beauty_care/common/repository/region_repository.dart';

final regionApiProvider = Provider<RegionApi>((ref) {
  final dio = ref.read(dioProvider);
  return RegionApi(dio);
});

final regionRepositoryProvider = Provider<RegionRepository>((ref) {
  final regionApi = ref.read(regionApiProvider);
  return RegionRepository(regionApi);
});
