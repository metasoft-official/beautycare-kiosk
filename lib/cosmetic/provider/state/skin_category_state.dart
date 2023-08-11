import 'package:flutter/cupertino.dart';

class SkinCategoryState extends ChangeNotifier {
  int productTypeCurIndex = 0; //cosmetic
  int productLineCurIndex = 0; //cosmetic

  void resetState() {
    SkinCategoryState();
    notifyListeners();
  }
}
