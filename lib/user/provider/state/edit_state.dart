import 'package:beauty_care/common/model/user_model.dart';
import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:beauty_care/user/model/account_dto_model.dart';
import 'package:beauty_care/user/provider/register_state_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditState extends ChangeNotifier {
  Ref ref;

  EditState(this.ref) {
    initState();
  }

  List<String> gender = ['F', 'M'];
  String selectedGender = 'F';

  void initState() {}

  // 수정
  Future<String?> modifyUser() async {
    final user = ref.read(userNotifierProvider.notifier).user;
    final formState = ref.read(formStateProvider);
    final addressState = ref.read(addressChangeStateProvider);
    final dropdownState = ref.read(dropdownChangeStateProvider);
    final userRepository = ref.read(userRepositoryProvider);

    DateTime birthDate = DateTime(
        int.parse(dropdownState.yearSelectedValue!),
        int.parse(dropdownState.monthSelectedValue!),
        int.parse(dropdownState.daySelectedValue!));

    UserModel modifyUser = user.copyWith(
      name: formState.name,
      email: '${formState.email}@${dropdownState.domainSelectedValue}',
      zipCode: addressState.postcordTextController.text,
      address1: addressState.addressTextController.text,
      address2: addressState.detailAddressTextController.text,
      age: calculateAge(birthDate),
      birthDate: birthDate,
      gender: selectedGender,
    );

    int? roleId = 2;
    await userRepository
        .getUserRoleByUserId(user.id ?? -1)
        .then((value) => roleId = value!.roleId);
    AccountDtoModel accountDtoModel =
        AccountDtoModel(userDto: modifyUser, roleId: roleId, userId: user.id);
    return await userRepository.putUser(accountDtoModel);
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

  void reload() {
    notifyListeners();
  }
}
