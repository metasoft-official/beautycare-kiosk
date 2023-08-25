import 'package:beauty_care/common/component/dialog/failed_dialog.dart';
import 'package:beauty_care/common/component/widgets/button_bottom_navigation_bar.dart';
import 'package:beauty_care/common/component/widgets/custom_dropdown_button_2.dart';
import 'package:beauty_care/common/layout/app_button_theme.dart';
import 'package:beauty_care/common/model/user_model.dart';
import 'package:beauty_care/main.dart';
import 'package:beauty_care/user/provider/mypage_page_provider.dart';
import 'package:beauty_care/user/provider/register_state_provider.dart';
import 'package:beauty_care/user/view/widgets/left_text_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/provider/login_provider.dart';

import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/common/layout/app_color.dart';

import '../widgets/custom_text_form_field.dart';

class ProfileEditPage extends ConsumerStatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  static String get routeName => 'profileEdit';

  @override
  ProfileEditState createState() => ProfileEditState();
}

class ProfileEditState extends ConsumerState<ProfileEditPage> {
  @override
  Widget build(BuildContext context) {
    UserModel user = ref.read(userNotifierProvider);
    final editState = ref.watch(editStateProvider);
    final dropdownState = ref.watch(dropdownChangeStateProvider);
    final formState = ref.watch(formStateProvider);
    final validState = ref.watch(formStateProvider.notifier);
    final addressState = ref.watch(addressChangeStateProvider);

    Future(() {
      addressState.postcordTextController.text = user.zipCode ?? '';
      addressState.addressTextController.text = user.address1 ?? '';
      addressState.detailAddressTextController.text = user.address2 ?? '';
      editState.selectedGender = user.gender ?? 'F';
      dropdownState.yearSelectedValue = user.birthDate?.year.toString();
      dropdownState.monthSelectedValue = user.birthDate?.month.toString();
      dropdownState.daySelectedValue = user.birthDate?.day.toString();
      dropdownState.domainSelectedValue = validState.splitEmail(user.email!)[1];
      validState.updateInputState(user.name ?? '', 'username');
      validState.updateInputState(
          validState.splitEmail(user.email ?? '')[0] ?? '', 'email');
      editState.reload();
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('프로필 편집')),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(28, 40, 28, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 프로필 사진 ========================================================
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border:
                            Border.all(color: AppColor.lightGrey, width: 1)),
                    width: 100,
                    height: 100,
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage:
                          AssetImage("assets/images/character_coiz_3.png"),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: FittedBox(
                        child: FloatingActionButton.small(
                          backgroundColor: AppColor.appColor,
                          onPressed: () {},
                          child: const Icon(
                            Icons.edit,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              // 내 정보 ========================================================
              const SizedBox(
                width: double.infinity,
                child: Text('내 정보', style: AppTextTheme.blue18b),
              ),
              const SizedBox(
                height: 28,
              ),
              // 이름
              const CustomLeftTextTitle(title: '이름'),
              CustomTextFormField(
                initialValue: user.name ?? '이름',
                hintText: '이름',
                errorText: formState.isNameValid == true ||
                        formState.isNameValid == null
                    ? null
                    : '이름에 공백을 사용할 수 없습니다.',
                onChanged: (value) =>
                    {validState.updateInputState(value, 'name')},
              ),
              const SizedBox(height: 14),

              //생년월일
              const CustomLeftTextTitle(title: '생년월일'),
              Row(
                children: [
                  //생년
                  Expanded(
                    child: CustomDropdownButton2(
                      items: dropdownState.yearValue,
                      hint: '생년',
                      value: dropdownState.yearSelectedValue,
                      onChanged: (value) {
                        dropdownState.selectDropdown('year', value);
                      },
                    ),
                  ),
                  const SizedBox(width: 4),
                  //월
                  Expanded(
                    child: CustomDropdownButton2(
                      items: dropdownState.monthValue,
                      hint: '월',
                      value: dropdownState.monthSelectedValue,
                      onChanged: (value) {
                        dropdownState.selectDropdown('month', value);
                      },
                    ),
                  ),
                  const SizedBox(width: 4),
                  //일
                  Expanded(
                    child: CustomDropdownButton2(
                      items: dropdownState.dayValue,
                      hint: '일',
                      value: dropdownState.daySelectedValue,
                      onChanged: (value) {
                        dropdownState.selectDropdown('day', value);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // 이메일
              const CustomLeftTextTitle(title: '이메일'),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: TextFormField(
                        readOnly: false,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        initialValue: validState.splitEmail(user.email!)[0],
                        onChanged: (value) =>
                            {validState.updateInputState(value, 'email')},
                        decoration: InputDecoration(
                          errorText: formState.isEmailVallid == true ||
                                  formState.isEmailVallid == null
                              ? null
                              : '이메일을 확인해주세요.',
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Text('@', style: AppTextTheme.deepGrey12m)),
                  Expanded(
                    flex: 1,
                    child: CustomDropdownButton2(
                      items: dropdownState.domainValue,
                      hint: '선택',
                      value: dropdownState.domainSelectedValue,
                      onChanged: (value) {
                        dropdownState.selectDropdown('domain', value);
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),

              // 성별
              const CustomLeftTextTitle(
                title: '성별',
                height: 0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                    child: Radio(
                      value: editState.gender[1],
                      groupValue: editState.selectedGender,
                      onChanged: (String? value) {
                        editState.selectedGender = value!;
                        editState.reload();
                      },
                    ),
                  ),
                  const SizedBox(width: 7),
                  const Text(
                    '남성',
                    style: AppTextTheme.black12m,
                  ),
                  const SizedBox(width: 14),
                  SizedBox(
                    width: 20,
                    child: Radio(
                      value: editState.gender[0],
                      groupValue: editState.selectedGender,
                      onChanged: (String? value) {
                        editState.selectedGender = value!;
                        editState.reload();
                      },
                    ),
                  ),
                  const SizedBox(width: 7),
                  const Text(
                    '여성',
                    style: AppTextTheme.black12m,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // 주소
              const SizedBox(
                  width: double.infinity,
                  child: Text('주소', style: AppTextTheme.black12b)),
              const SizedBox(height: 8),
              Consumer(builder: (ref, innerContext, child) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                          readOnly: true,
                          autocorrect: false,
                          controller: addressState.postcordTextController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            hintText: '우편번호',
                          ),
                        )),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            addressState.searchPost(context);
                          },
                          style: AppButtonTheme.basicElevatedButtonTheme
                              .copyWith(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0))),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          horizontal: 14, vertical: 15))),
                          child: const Text('우편번호 검색',
                              style: AppTextTheme.white12b),
                        )
                      ],
                    ),
                  ],
                );
              }),

              const SizedBox(height: 8),
              CustomTextFormField(
                  readOnly: true,
                  hintText: '주소',
                  controller: addressState.addressTextController),
              // 상세주소
              CustomTextFormField(
                hintText: '상세주소를 입력해 주세요.',
                controller: addressState.detailAddressTextController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ButtonBottomNavigationBarWidget(
        buttonColor: AppColor.appColor,
        textStyle: AppTextTheme.white14b,
        label: '저장',
        onPressed: () async {
          logger.d(formState.isNameValid);
          logger.d(formState.isEmailVallid);
          if ((formState.isNameValid == true &&
                  formState.isEmailVallid == true) !=
              true) {
            toastMessage.showError('필수값 입력을 확인해주세요!');
          } else if ((dropdownState.domainSelectedValue != null &&
                  dropdownState.yearSelectedValue != null &&
                  dropdownState.monthSelectedValue != null &&
                  dropdownState.daySelectedValue != null) !=
              true) {
            toastMessage.showError('필수값 선택을 확인해주세요!');
          } else {
            final response = await editState.modifyUser();
            if (response != null) {
              if (!mounted) return;
              context.pop();
            } else {
              if (!mounted) return;
              showDialog(
                  context: context,
                  builder: (context) {
                    return const FailedDialog(
                        content: '저장에 실패했습니다.\n잠시 후 다시 시도해주세요.');
                  });
            }
          }
        },
      ),
    );
  }
}
