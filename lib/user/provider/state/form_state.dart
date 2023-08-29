import 'package:beauty_care/user/model/form_state_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FormNotifier extends StateNotifier<FormStateModel> {
  FormNotifier(this.ref)
      : super(FormStateModel(
          username: '',
          password: '',
          rePassword: '',
          name: '',
          phFirst: '',
          phSecond: '',
          phThird: '',
          email: '',
          profileImageId: null,
          inputStartedFlags: {
            'username': false,
            'password': false,
            'rePassword': false,
            'name': false,
            'phFirst': false,
            'phSecond': false,
            'phThird': false,
            'email': false,
          },
        ));

  init() {
    FormNotifier(ref);
  }

  Ref ref;

  void updateInputState(String updateValue, String fieldName) {
    // 입력 시작 상태관리
    bool startedInput = updateValue.isNotEmpty && updateValue != '';
    final updatedFlags = Map<String, bool>.from(state.inputStartedFlags!)
      ..[fieldName] = startedInput;

    state = state.copyWith(inputStartedFlags: updatedFlags);

    updateForm(updateValue, fieldName);
  }

  void updateForm(String updateValue, String fieldName) {
    if (state.inputStartedFlags![fieldName] == true) {
      switch (fieldName) {
        case 'username':
          state = state.copyWith(
              username: updateValue,
              isUsernameValid: _validateUsername(updateValue));
          break;
        case 'password':
          state = state.copyWith(
              password: updateValue,
              isPasswordValid: _validatePassword(updateValue));
          break;
        case 'rePassword':
          state = state.copyWith(
              rePassword: updateValue,
              isRePasswordValid: _validateRePassword(updateValue));
          break;
        case 'name':
          state = state.copyWith(
              name: updateValue, isNameValid: _validateName(updateValue));
          break;
        case 'phFirst':
          state = state.copyWith(
              phFirst: updateValue,
              isPhFirstValid: _validatePhFirst(updateValue));
          break;
        case 'phSecond':
          state = state.copyWith(
              phSecond: updateValue,
              isPhSecondValid: _validatePhSecond(updateValue));
          break;
        case 'phThird':
          state = state.copyWith(
              phThird: updateValue,
              isPhThirdValid: _validatePhThird(updateValue));
          break;
        case 'email':
          state = state.copyWith(
              email: updateValue, isEmailVallid: _validateEmail(updateValue));
          break;
      }
    }
  }

  updateProfileImage(int id) {
    state = state.copyWith(profileImageId: id);
  }

  bool _validateUsername(String username) {
    // 아이디 : 4자 이상 12자 이하 , 영어와 숫자
    return username.length >= 4 && username.length < 13;
  }

  bool _validatePassword(String password) {
    // 비밀번호 : 8자 이상, 영어와 숫자
    return password.length >= 8 && containsEnglishAndNumber(password) == true;
  }

  bool _validateRePassword(String rePassword) {
    // 비밀번호 확인 : 비밀번호와 같은지
    return rePassword.contains(state.password!) &&
        containsEnglishAndNumber(rePassword) == true &&
        rePassword.length >= 8 &&
        containsEnglishAndNumber(rePassword) == true;
  }

  bool _validateName(String name) {
    // 이름 확인 : 이름이 한 글자 이상인지, 공백 없는지
    return name.isNotEmpty && !containsWhitespace(name);
  }

  bool _validatePhFirst(String phFirst) {
    // 첫번째 전화번호 0으로 시작하고 3글자 이하인지
    return phFirst.length >= 3 &&
        phFirst.substring(0, 1).contains('0') &&
        !containsWhitespace(phFirst) &&
        containsOnlyNum(phFirst);
  }

  bool _validatePhSecond(String phSecond) {
    // 두번째 전화번호 1로 시작하지 않고 3글자 이상 4글자 이하인지
    return (phSecond.length == 3 || phSecond.length == 4) &&
        phSecond.substring(0, 1).contains('1') == false &&
        containsWhitespace(phSecond) == false &&
        containsOnlyNum(phSecond) == true;
  }

  bool _validatePhThird(String phThird) {
    // 세번째 전화번호 4글자이고 공백이 없는지
    return phThird.length == 4 &&
        !containsWhitespace(phThird) &&
        containsOnlyNum(phThird);
  }

  bool _validateEmail(String email) {
    // 이메일 : 한글자보다 길고 공백이 없는지 영문숫자인지
    return email.isNotEmpty &&
        !containsWhitespace(email) &&
        containsEnglishAndNumber(email);
  }

  bool containsWhitespace(String text) {
    return text.contains(RegExp(r'\s'));
  }

  bool containsEnglishAndNumber(String text) {
    bool hasEnglish = text.contains(RegExp(r'[a-zA-Z]'));
    bool hasNumber = text.contains(RegExp(r'[0-9]'));

    return hasEnglish || hasNumber;
  }

  bool containsOnlyNum(String text) {
    bool hasNumber = text.contains(RegExp(r'[0-9]'));
    return hasNumber;
  }

  List<String> splitEmail(String email) {
    return email.split('@');
  }
}
