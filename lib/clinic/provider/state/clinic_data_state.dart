import 'package:beauty_care/clinic/model/clinic_model.dart';
import 'package:beauty_care/clinic/repository/clinic_repository.dart';
import 'package:beauty_care/common/model/region_model.dart';
import 'package:beauty_care/common/provider/region_provider.dart';
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
      await Future.wait([getClinicList(), getRegionList()]);
      state = AsyncValue.data(data);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  // 클리닉 모든 리스트
  Future<void> getClinicList() async {
    final response = await repository.getClinicAll();
    if (response != null && response.items != null) {
      data['clinics'] = response.items!;
    } else {
      data['clinics'] = [];
    }
    state = AsyncValue.data(data);
  }

  // todo 클리닉 전문점만
  Future<void> getExpertClinicList() async {
    ClinicModel clinicModel = ClinicModel(specialtyStoreStatus: 'T');
    final response = await repository.getClinicByQuery(clinicModel);
    if (response != null && response.items != null) {
      data['experts'] = response.items!;
    } else {
      data['experts'] = [];
    }
    state = AsyncValue.data(data);
  }

  Future<void> getRegionList() async {
    final map = {};
    final regionRepository = ref.read(regionRepositoryProvider);
    final response = await regionRepository.getRegionAll();
    if (response != null && response.items != null) {
      response.items?.forEach((e) {
        map.addAll({e.id: e.name});
      });
      data['regions'] = map;
    }
  }

  void reload() {
    state = AsyncValue.data(data);
  }
}
