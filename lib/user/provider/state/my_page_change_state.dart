import 'package:flutter/cupertino.dart';

class MypageState extends ChangeNotifier {
  List<bool> isLongClicked =
      List<bool>.filled(3, false); //length == histories.length -> await 사용
  int longClickState = -1;

  void resetState() {
    MypageState();
    notifyListeners();
  }
}
