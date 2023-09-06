import 'package:flutter/foundation.dart';

class PasswordChangeState extends ChangeNotifier {
  bool isVisiblePassword = false;
  bool isVisibleRePassword = false;

  void setPasswordVisible() {
    isVisiblePassword = !isVisiblePassword;
    notifyListeners();
  }

  void setRePasswordVisible() {
    isVisibleRePassword = !isVisibleRePassword;
    notifyListeners();
  }
}
