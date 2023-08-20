import 'package:beauty_care/clinic/model/clinic_model.dart';
import 'package:beauty_care/clinic/provider/clinic_state_provider.dart';
import 'package:beauty_care/common/provider/modal/modal_grid_state_provider.dart';
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
      await Future.wait([getDiseaseById(id), getDiseaseList()]);
      state = AsyncValue.data(data);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> getDiseaseById(int? id) async {
    DiseaseModel diseaseModel = DiseaseModel(id: id);
    final response = await repository.getDiseaseByQuery(diseaseModel);
    if (response != null && response.items != null) {
      data['diseaseInfo'] = response.items!.first;
    } else {
      data['diseaseInfo'] = [];
    }
  }

  List<DiseaseModel>? modalData = [];
  String? selectedData = '';

  Future<void> getDiseaseList() async {
    final modalDataState = ref.read(modalGridStateProvider.notifier);

    modalData = await modalDataState.getDiseaseList('disease');
    // selectedData = modalData?[0].name ?? '-';

    data['modalData'] = modalData;
    // data['selectedData'] = selectedData;
  }

  void reload() {
    state = AsyncValue.data(data);
  }
}
