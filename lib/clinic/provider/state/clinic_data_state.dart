import 'package:beauty_care/clinic/model/clinic_model.dart';
import 'package:beauty_care/clinic/repository/clinic_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ClinicDataState extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final Ref ref;
  final ClinicRepository repository;

  ClinicDataState(this.ref, this.repository)
      : super(const AsyncValue.loading()) {
    loadData();
  }

  Map<String, dynamic> data = {};

  Future<void> loadData() async {
    try {
      await Future.wait([]);
      state = AsyncValue.data(data);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> getClinicList() async {
    final response = await repository.getClinicAll();
    if (response != null && response.items != null) {
      data['clinics'] = response.items!;
    } else {
      data['clinics'] = [];
    }
    state = AsyncValue.data(data);
  }

  Future<void> getExpertClinicList() async {
    ClinicModel clinicModel = ClinicModel(visibilityStatus: 'E');
    final response = await repository.getClinicByQuery(clinicModel);
    if (response != null && response.items != null) {
      data['experts'] = response.items!;
    } else {
      data['experts'] = [];
    }
    state = AsyncValue.data(data);
  }

  void reload() {
    state = AsyncValue.data(data);
  }
}
