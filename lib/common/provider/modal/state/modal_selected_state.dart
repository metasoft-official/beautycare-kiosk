import 'package:hooks_riverpod/hooks_riverpod.dart';

// 모달 창 안에서 선택 값에 대한 상태관리
class ModalSelectedState extends StateNotifier<ModalState> {
  ModalSelectedState(modalId, selectedValue, length)
      : super(ModalState.initial(modalId, selectedValue, length));

  void initializeModal(String modalId, int length, int selectedValue) {
    final isClicked = List.generate(length, (index) => false);
    final initialIsClicked = List<bool>.from(isClicked)..[selectedValue] = true;
    state.modals[modalId] = ModalSelectedData(initialIsClicked, selectedValue);
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
  final int curIndex; //선택된 인덱스

  ModalSelectedData(this.isClicked, this.curIndex);
}

class ModalState {
  final Map<String, ModalSelectedData> modals;

  ModalState(this.modals);

  ModalState.initial(String modalId, int selectedValue, int length)
      : modals = {
          modalId: ModalSelectedData(
              List.generate(length, (index) => false), selectedValue)
        };
}
