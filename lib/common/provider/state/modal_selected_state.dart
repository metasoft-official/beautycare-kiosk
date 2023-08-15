import 'package:hooks_riverpod/hooks_riverpod.dart';

class ModalSelectedState extends StateNotifier<ModalState> {
  ModalSelectedState() : super(ModalState.initial());

  void initializeModal(String modalId, int length, int selectedValue) {
    state.modals[modalId] = ModalSelectedData(
        List.generate(length, (index) => false), selectedValue);
  }

  void selectButton(String modalId, int curIndex) {
    if (state.modals.containsKey(modalId)) {
      final currentData = state.modals[modalId]!;
      final updatedIsClicked = List<bool>.from(currentData.isClicked)
        ..[curIndex] = true;

      state.modals[modalId] = ModalSelectedData(updatedIsClicked, curIndex);
      state = ModalState(Map.from(state.modals));
    }
  }
}

class ModalSelectedData {
  final List<bool> isClicked;
  final int curIndex;

  ModalSelectedData(this.isClicked, this.curIndex);
}

class ModalState {
  final Map<String, ModalSelectedData> modals;

  ModalState(this.modals);

  ModalState.initial() : modals = {};
}
