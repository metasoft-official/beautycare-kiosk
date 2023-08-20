import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/dio/disease_api.dart';
import 'package:beauty_care/disease/provider/state/disease_change_state.dart';
import 'package:beauty_care/disease/provider/state/disease_data_state.dart';
import 'package:beauty_care/disease/repository/disease_repository.dart';

final diseaseApiProvider = Provider<DiseaseApi>((ref) {
  final dio = ref.read(dioProvider);
  return DiseaseApi(dio);
});

final diseaseRepositoryProvider = Provider<DiseaseRepository>((ref) {
  final surveyApi = ref.read(diseaseApiProvider);
  return DiseaseRepository(surveyApi);
});

final diseaseStateProvider = StateNotifierProvider.family<DiseaseDataState,
        AsyncValue<Map<String, dynamic>>, int>(
    (ref, id) =>
        DiseaseDataState(ref, ref.read(diseaseRepositoryProvider), id));

final diseaseChangeProvider = ChangeNotifierProvider<DiseaseChangeState>((ref) {
  return DiseaseChangeState();
});
