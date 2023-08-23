import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:remedi_kopo/remedi_kopo.dart';

class RegisterChangeState extends ChangeNotifier {
  // 드롭다운 선택
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

}
