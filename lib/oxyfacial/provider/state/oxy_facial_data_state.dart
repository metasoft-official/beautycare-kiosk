import 'package:beauty_care/oxyfacial/repository/oxy_facial_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OxyFacialDataState
    extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final Ref ref;
  final OxyFacialRepository oxyFacialRepository;

  OxyFacialDataState(this.ref, this.oxyFacialRepository)
      : super(const AsyncValue.loading()) {
    loadData();
  }

  Map<String, dynamic> data = {};

  Future<void> loadData() async {
    try {
      await Future.wait([
        getOxyFacialList(),
      ]);
      state = AsyncValue.data(data);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> getOxyFacialList() async {
    final response = await oxyFacialRepository.getOxyFacialAll();
    if (response != null && response.items != null) {
      data['oxyFacial'] = response.items;
    } else {
      data['oxyFacial'] = [];
    }
  }

  void reload() {
    state = AsyncValue.data(data);
  }
}
