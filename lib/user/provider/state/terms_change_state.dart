import 'package:flutter/cupertino.dart';

class TermsChangeState extends ChangeNotifier {
  // 약관 동의 상태
  List<bool> termsStates = [false, false];
  bool allTermsState = false;

  //약관 동의
  agreeTerms(int i) {
    // 해당 동의 상태 변경
    termsStates[i] == true ? termsStates[i] = false : termsStates[i] = true;

    // termsStates가 모두 true면 allTermsState 상태 변경
    for (int j = 0; j < termsStates.length; j++) {
      if (termsStates[j] == true && j < termsStates.length - 1) {
        continue;
      } else if (termsStates[j] == true && j == termsStates.length - 1) {
        allTermsState = true;
      } else {
        allTermsState = false;
        break;
      }
    }
    notifyListeners();
  }

  // 약관 동의 상태
  agreeAllTerms() {
    if (allTermsState == true) {
      allTermsState = false;
      termsStates.fillRange(0, termsStates.length, false);
    } else {
      allTermsState = true;
      termsStates.fillRange(0, termsStates.length, true);
    }
    notifyListeners();
  }
}
