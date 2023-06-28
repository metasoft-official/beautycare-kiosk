import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final historyStateProvider = ChangeNotifierProvider<historyState>((ref) {
  return historyState();
});

class historyState extends ChangeNotifier {
  int stateIndex = 0;

  List<String> titles = ['전체', '피부질환', '피부MBTI'];

  void resetState() {
    historyState();
    notifyListeners();
  }
}
