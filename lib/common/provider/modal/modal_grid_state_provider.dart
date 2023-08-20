import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tuple/tuple.dart';
import 'package:beauty_care/common/provider/code/code_provider.dart';
import 'package:beauty_care/common/provider/modal/state/modal_data_state.dart';
import 'package:beauty_care/common/provider/modal/state/modal_selected_state.dart';

final modalGridStateProvider =
    StateNotifierProvider<ModalDataState, AsyncValue<Map<String, dynamic>>>(
        (ref) {
  return ModalDataState(ref, ref.read(codeRepositoryProvider));
});

final modalSelectProvider = StateNotifierProvider.family<ModalSelectedState,
    ModalState, Tuple3<String, int, int>>((ref, params) {
  return ModalSelectedState(params.item1, params.item2, params.item3);
});