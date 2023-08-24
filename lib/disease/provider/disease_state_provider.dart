import 'package:beauty_care/disease/provider/state/user_disease_data_state.dart';
import 'package:beauty_care/user/provider/user_disease_provider.dart';
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

final diseaseStateProvider = AutoDisposeStateNotifierProvider.family<
        DiseaseDataState, AsyncValue<Map<String, dynamic>>, int>(
    (ref, id) =>
        DiseaseDataState(ref, ref.read(diseaseRepositoryProvider), id));

final userDiseaseStateProvider = StateNotifierProvider.family<
        UserDiseaseDataState, AsyncValue<Map<String, dynamic>>, int>(
    (ref, id) =>
        UserDiseaseDataState(ref, ref.read(userDiseaseRepositoryProvider), id));

final diseaseChangeProvider =
    AutoDisposeChangeNotifierProvider<DiseaseChangeState>((ref) {
  return DiseaseChangeState();
});
