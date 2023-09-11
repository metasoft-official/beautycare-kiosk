import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:beauty_care/user/provider/register_state_provider.dart';

import 'package:beauty_care/main.dart';
import 'package:beauty_care/common/model/user_model.dart';
import 'package:beauty_care/common/repository/user_repository.dart';

class RegisterDataState
    extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final Ref ref;
  final UserRepository userRepository;

  RegisterDataState(this.ref, this.userRepository)
      : super(const AsyncValue.loading());

  // 라디오 버튼
  List<bool> isGenderSelected = [true, false];
  List<String> gender = ['F', 'M'];
  String selectedGender = 'F';

  // 아이디 중복확인
  bool confirmedId = false;
  Future<void> confirmId(String username) async {
    final response = await userRepository.getUserByUsername(username);
    if (response != null &&
        response.items != null &&
        response.items!.isNotEmpty) {
      // 사용 불가능 아이디
      confirmedId = false;
      toastMessage.topRedBoxWhiteText("이미 존재하는 아이디입니다.");
    } else {
      confirmedId = true; // 사용 가능 아이디
      toastMessage.topYellowBoxBlueText("사용가능한 아이디입니다.");
    }
  }

  // 회원가입
  Future<String?> createNaverUser(user) async {
    return await userRepository.postUser(user);
  }

  Future<String?> createUser() async {
    final formState = ref.read(formStateProvider);
    final addressState = ref.read(addressChangeStateProvider);
    final dropdownState = ref.read(dropdownChangeStateProvider);

    DateTime birthDate = DateTime(
        int.parse(dropdownState.yearSelectedValue!),
        int.parse(dropdownState.monthSelectedValue!),
        int.parse(dropdownState.daySelectedValue!));

    UserModel newUser = UserModel(
      username: formState.username,
      password: formState.password,
      name: formState.name,
      email: '${formState.email}@${dropdownState.domainSelectedValue}',
      zipCode: addressState.postcordTextController.text,
      address1: addressState.addressTextController.text,
      address2: addressState.detailAddressTextController.text,
      age: calculateAge(birthDate),
      birthDate: birthDate,
      gender: selectedGender,
      mobileNumber:
          '${formState.phFirst}-${formState.phSecond}-${formState.phThird}',
      // socialLoginId: ,
      // socialLoginType : ''
    );
    return await userRepository.postUser(newUser);
  }

  int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();

    int age = currentDate.year - birthDate.year;
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }

    return age;
  }
}
