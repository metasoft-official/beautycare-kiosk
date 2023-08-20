import 'package:beauty_care/clinic/model/clinic_model.dart';
import 'package:beauty_care/clinic/provider/clinic_state_provider.dart';
import 'package:beauty_care/user/repository/user_disease_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/disease/model/disease_model.dart';
import 'package:beauty_care/disease/repository/disease_repository.dart';

class UserDiseaseDataState
    extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final Ref ref;
  final UserDiseaseRepository repository;
  final int id;

  UserDiseaseDataState(this.ref, this.repository, this.id)
      : super(const AsyncValue.loading()) {
    loadData();
  }

  Map<String, dynamic> data = {};

  Future<void> loadData() async {
    try {
      await Future.wait([getDiseaseById()]);
      state = AsyncValue.data(data);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  // 무조건 프로바이더에서 파라미터로 질환 아이디값 받아서 조회
  Future<void> getDiseaseById() async {
    final response = await repository.getUserDiseaseById(id);
    if (response != null) {
      data['result'] = response;
    } else {
      data['result'] = [];
    }
  }

  void reload() {
    state = AsyncValue.data(data);
  }
}