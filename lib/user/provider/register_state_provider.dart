import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:remedi_kopo/remedi_kopo.dart';

final registerStateProvider = ChangeNotifierProvider<RegisterState>((ref) {
  return RegisterState();
});

class RegisterState extends ChangeNotifier {
  List<bool> termsStates = [false, false];
  bool allTermsState = false;

  TextEditingController idTextController = TextEditingController();
  TextEditingController pwTextController = TextEditingController();
  TextEditingController rePwTextController = TextEditingController();
  TextEditingController nmTextController = TextEditingController();
  TextEditingController phTextController = TextEditingController();
  TextEditingController bdayTextController = TextEditingController();
  TextEditingController emTextController = TextEditingController();
  TextEditingController domainTextController = TextEditingController();
  TextEditingController postcordTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  TextEditingController detailAddressTextController = TextEditingController();
  FocusNode pwFocus = FocusNode();
  FocusNode idFocus = FocusNode();
  FocusNode rePwFocus = FocusNode();
  FocusNode nmFocus = FocusNode();
  FocusNode phFocus = FocusNode();
  FocusNode bdayFocus = FocusNode();
  FocusNode emFocus = FocusNode();
  FocusNode domainFocus = FocusNode();
  FocusNode detailAddressFocus = FocusNode();

  List<String> list = <String>['직접입력', 'naver.com', 'gmail.com'];

  List<bool> isGenderSelected = [true, false];

  List<String> gender = ['F', 'M'];

  String selectedGender = 'F';

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

  searchPost(BuildContext context) async {
    KopoModel? model = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => RemediKopo(),
      ),
    );

    if (model != null) {
      postcordTextController.clear();
      addressTextController.clear();
      detailAddressTextController.clear();

      postcordTextController.text = model.zonecode.toString();
      addressTextController.text =
          model.buildingName != null && model.buildingName != ""
              ? '${model.address.toString()} (${model.buildingName.toString()})'
              : model.address.toString();
    }

    notifyListeners();
  }

  void resetState() {
    RegisterState();
    notifyListeners();
  }
}
