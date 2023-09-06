import 'dart:io';

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

  UserModel editUser = UserModel();

  bool isPicked = false;
  File? updatedImage;

  void updateProfileImage(File image) {
    updatedImage = image;
    notifyListeners();
  }

  void initState() {
    UserModel user = ref.read(userNotifierProvider);
    final dropdownState = ref.read(dropdownChangeStateProvider);
    final validState = ref.read(formStateProvider.notifier);
    final addressState = ref.read(addressChangeStateProvider);

    Future(() {
      addressState.postcordTextController.text = user.zipCode ?? '';
      addressState.addressTextController.text = user.address1 ?? '';
      addressState.detailAddressTextController.text = user.address2 ?? '';
      selectedGender = user.gender ?? 'F';
      dropdownState.yearSelectedValue =
          DateTime.parse(user.birthDate).year.toString();
      dropdownState.monthSelectedValue =
          DateTime.parse(user.birthDate).month.toString();
      dropdownState.daySelectedValue =
          DateTime.parse(user.birthDate).day.toString();
      dropdownState.domainSelectedValue = validState.splitEmail(user.email!)[1];
      validState.updateInputState(user.name ?? '', 'name');
      validState.updateInputState(
          validState.splitEmail(user.email ?? '')[0] ?? '', 'email');
    });

    editUser = user.copyWith();
  }

  // 수정
  Future<String?> modifyUser() async {
    UserModel user = ref.read(userNotifierProvider);
    final userState = ref.watch(userNotifierProvider.notifier);
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
        AccountDtoModel(roleId: roleId, userId: user.id);

    final userResponse =
        await userRepository.putUser(accountDtoModel, modifyUser);
    if (userResponse != null) {
      userState.update(modifyUser);
      return userResponse;
    }

    return null;
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
