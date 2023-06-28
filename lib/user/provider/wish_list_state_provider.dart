import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final wishListStateProvider = ChangeNotifierProvider<wishListState>((ref) {
  return wishListState();
});

class wishListState extends ChangeNotifier {
  int stateIndex = 0;

  List<String> titles = ['스킨케어', '클리닉'];

  void resetState() {
    wishListState();
    notifyListeners();
  }
}
