import 'package:beauty_care/clinic/model/clinic_model.dart';
import 'package:beauty_care/clinic/provider/clinic_state_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/disease/model/disease_model.dart';
import 'package:beauty_care/disease/repository/disease_repository.dart';

class DiseaseDataState extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final Ref ref;
  final DiseaseRepository repository;
  final int id;

  DiseaseDataState(this.ref, this.repository, this.id)
      : super(const AsyncValue.loading()) {
    loadData();
  }

  Map<String, dynamic> data = {};

  Future<void> loadData() async {
    try {
      await Future.wait([getDiseaseById(), getExpertClinicList()]);
      state = AsyncValue.data(data);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  // 무조건 프로바이더에서 파라미터로 질환 아이디값 받아서 조회
  Future<void> getDiseaseById() async {
    DiseaseModel diseaseModel = DiseaseModel(id: id);
    final response = await repository.getDiseaseByQuery(diseaseModel);
    if (response != null && response.items != null) {
      data['diseaseInfo'] = response.items!.first;
    } else {
      data['diseaseInfo'] = [];
    }
  }

  void reload() {
    state = AsyncValue.data(data);
  }

  // 전문점 클리닉 리스트 가져오기
  Future<void> getExpertClinicList() async {
    final clinicRepository = ref.read(clinicRepositoryProvider);

    ClinicModel clinicModel = ClinicModel(visibilityStatus: 'E');

    final response = await clinicRepository.getClinicByQuery(clinicModel);
    if (response != null && response.items != null) {
      data['clinics'] = response.items!;
    } else {
      data['clinics'] = [];
    }
    state = AsyncValue.data(data);
  }
}
