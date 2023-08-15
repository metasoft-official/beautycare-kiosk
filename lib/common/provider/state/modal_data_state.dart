import 'package:hooks_riverpod/hooks_riverpod.dart';

class ModalDataState extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  ModalDataState() : super(const AsyncValue.loading()) {
    loadData();
  }

  Map<String, dynamic> data = {};

  Future<void> loadData() async {
    try {
      state = AsyncValue.data(data);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }

  Future<void> reloadData() async {
    state = const AsyncValue.loading();
    await loadData();
  }
}
