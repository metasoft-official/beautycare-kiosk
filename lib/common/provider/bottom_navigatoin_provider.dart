import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bottomStateProvider =
    AutoDisposeChangeNotifierProvider<BottomNavigationState>(
        (ref) => BottomNavigationState());

class BottomNavigationState extends ChangeNotifier {
  int clickedMenu = 0;

  void clickMenu(int index) {
    clickedMenu = index;
    notifyListeners();
  }
}
