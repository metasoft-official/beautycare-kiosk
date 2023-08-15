import 'package:beauty_care/common/provider/state/modal_data_state.dart';
import 'package:beauty_care/common/provider/state/modal_selected_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final modalGridStateProvider =
    StateNotifierProvider<ModalDataState, AsyncValue<Map<String, dynamic>>>(
        (ref) => ModalDataState());

final modalSelectProvider =
    StateNotifierProvider<ModalSelectedState, ModalState>((ref) {
  return ModalSelectedState();
});
