import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:beauty_care/common/const/values.dart';
import 'package:beauty_care/common/dio/clinic_api.dart';
import 'package:beauty_care/clinic/repository/clinic_repository.dart';
import 'package:beauty_care/clinic/provider/state/clinic_data_state.dart';

final clinicApiProvider = Provider<ClinicApi>((ref) {
  final dio = ref.read(dioProvider);
  return ClinicApi(dio);
});

final clinicRepositoryProvider = Provider<ClinicRepository>((ref) {
  final surveyApi = ref.read(clinicApiProvider);
  return ClinicRepository(surveyApi);
});

final clinicStateProvider =
    StateNotifierProvider<ClinicDataState, AsyncValue<Map<String, dynamic>>>(
        (ref) => ClinicDataState(ref, ref.read(clinicRepositoryProvider)));
