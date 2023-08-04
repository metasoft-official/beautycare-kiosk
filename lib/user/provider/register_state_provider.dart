import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:remedi_kopo/remedi_kopo.dart';

import '../../main.dart';

final registerStateProvider = ChangeNotifierProvider<RegisterState>((ref) {
  return RegisterState();
});

class RegisterState extends ChangeNotifier {
  // 약관 동의 상태
  List<bool> termsStates = [false, false];
  bool allTermsState = false;

  // 텍스트 폼 필드
  TextEditingController idTextController = TextEditingController();
  TextEditingController pwTextController = TextEditingController();
  TextEditingController rePwTextController = TextEditingController();
  TextEditingController nmTextController = TextEditingController();
  TextEditingController phFirstTextController = TextEditingController();
  TextEditingController phSecondTextController = TextEditingController();
  TextEditingController phThirdTextController = TextEditingController();
  TextEditingController yearTextController = TextEditingController();
  TextEditingController monthTextController = TextEditingController();
  TextEditingController dayTextController = TextEditingController();
  TextEditingController emTextController = TextEditingController();
  TextEditingController domainTextController = TextEditingController();
  TextEditingController postcordTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  TextEditingController detailAddressTextController = TextEditingController();
  FocusNode pwFocus = FocusNode();
  FocusNode idFocus = FocusNode();
  FocusNode rePwFocus = FocusNode();
  FocusNode nmFocus = FocusNode();
  FocusNode phFirstFocus = FocusNode();
  FocusNode phSecondFocus = FocusNode();
  FocusNode phThirdFocus = FocusNode();
  FocusNode yearFocus = FocusNode();
  FocusNode monthFocus = FocusNode();
  FocusNode dayFocus = FocusNode();
  FocusNode emFocus = FocusNode();
  FocusNode domainFocus = FocusNode();
  FocusNode detailAddressFocus = FocusNode();

  // 드롭 다운
  List<String> domainValue = [
    'naver.com',
    'gmail.com',
    'daum.net',
    'nate.com',
    'empas.com',
    'gmail.com',
    'lycos.co.kr',
    'hotmail.com'
  ];

  List<String> yearValue = [
    for (int i = DateTime.now().year; i > 1920; i--) i.toString()
  ];
  List<String> monthValue = List<String>.generate(12, (i) => '${i + 1}');
  List<String> dayValue = List<String>.generate(31, (i) => '${i + 1}');

  String? domainSelectedValue;
  String? yearSelectedValue;
  String? monthSelectedValue;
  String? daySelectedValue;

  // 라디오 버튼
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

  selectDropdown(String? category, String? value) {
    if (value != null) {
      if (category == 'year') {
        yearSelectedValue = value;
      } else if (category == 'month') {
        monthSelectedValue = value;
      } else if (category == 'day') {
        daySelectedValue = value;
      } else if (category == 'domain') {
        domainSelectedValue = value;
      }

      notifyListeners();
    }
  }

  void resetState() {
    RegisterState();
    notifyListeners();
  }
}
