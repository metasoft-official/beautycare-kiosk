import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final registerStateProvider = ChangeNotifierProvider<RegisterState>((ref) {
  return RegisterState();
});

class RegisterState extends ChangeNotifier {
  final idTextController = TextEditingController();
  final pwTextController = TextEditingController();
  final rePwTextController = TextEditingController();
  final nmTextController = TextEditingController();
  final phTextController = TextEditingController();
  final bdayTextController = TextEditingController();
  final emTextController = TextEditingController();
  final domainTextController = TextEditingController();
  final postcordTextController = TextEditingController();
  final addressTextController = TextEditingController();
  final detailAddressTextController = TextEditingController();
  final pwFocus = FocusNode();
  final idFocus = FocusNode();
  final rePwFocus = FocusNode();
  final nmFocus = FocusNode();
  final phFocus = FocusNode();
  final bdayFocus = FocusNode();
  final emFocus = FocusNode();
  final domainFocus = FocusNode();
  final postcordFocus = FocusNode();
  final addressFocus = FocusNode();
  final detailAddressFocus = FocusNode();

  List<String> list = <String>['직접입력', 'naver.com', 'gmail.com'];

  List<bool> isGenderSelected = [true, false];

  List<String> gender = ['F', 'M'];

  String selectedGender = 'F';

  void resetState() {
    RegisterState();
    notifyListeners();
  }
}
