import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final skinHistoryStateProvider =
    ChangeNotifierProvider<skinHistoryState>((ref) {
  return skinHistoryState();
});

class skinHistoryState extends ChangeNotifier {
  int stateIndex = 0;

  List<String> titles = ['피부나이 변화', '피부점수'];

  void resetState() {
    skinHistoryState();
    notifyListeners();
  }
}
