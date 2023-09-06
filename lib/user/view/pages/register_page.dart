import 'package:beauty_care/common/component/dialog/failed_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/user/provider/register_state_provider.dart';

import 'package:beauty_care/common/layout/app_button_theme.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/common/layout/app_color.dart';

import 'package:beauty_care/common/component/widgets/button_bottom_navigation_bar.dart';
import 'package:beauty_care/user/view/widgets/custom_text_form_field.dart';
import 'package:beauty_care/common/component/widgets/custom_dropdown_button_2.dart';

import '../../../main.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static String get routeName => 'register';

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends ConsumerState<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final registerState = ref.watch(registerDataStateProvider.notifier);
    final dropdownState = ref.watch(dropdownChangeStateProvider);
    final addressState = ref.watch(addressChangeStateProvider);
    final formState = ref.watch(formStateProvider);
    final validState = ref.watch(formStateProvider.notifier);
    final visiblePassword = ref.watch(passwordChangeProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(24, 34, 24, 42),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/oxygen_logo.png',
                    height: 40,
                    alignment: Alignment.centerLeft,
                  ),
                ),
                const SizedBox(height: 23),
                // 필수 입력
                const Text('필수 입력 정보', style: AppTextTheme.blue18b),
                const SizedBox(height: 20),

                TextFormField(
                  readOnly: false,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  initialValue: formState.username,
                  onChanged: (value) => {
                    registerState.confirmedId = false,
                    validState.updateInputState(value, 'username')
                  },
                  decoration: InputDecoration(
                      errorText: formState.isUsernameValid == true ||
                              formState.isUsernameValid == null
                          ? null
                          : '아이디는 영문과 숫자로 4자 이상, 12자 이하 이어야 합니다.',
                      hintText: '아이디',
                      suffixIcon: Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: TextButton(
                          onPressed: () {
                            if (formState.username != null) {
                              registerState.confirmId(formState.username!);
                            } else {
                              toastMessage
                                  .topRedBoxWhiteText('아이디를 정확히 입력해주세요.');
                            }
                          },
                          child: const Text(
                            '중복확인',
                            style: AppTextTheme.blue12b,
                          ),
                        ),
                      )),
                ),
                const SizedBox(height: 20),

                // 비밀번호
                CustomTextFormField(
                  title: '비밀번호',
                  hintText: '비밀번호',
                  errorText: formState.isPasswordValid == true ||
                          formState.isPasswordValid == null
                      ? null
                      : '비밀번호는 영문과 숫자로 8자 이상 이어야 합니다.',
                  initialValue: formState.password,
                  onChanged: (value) => {
                    validState.updateInputState(value, 'password'),
                    validState.updateInputState(
                        formState.rePassword ?? '', 'rePassword')
                  },
                  suffixIcon: IconButton(
                    icon: Icon(
                      visiblePassword.isVisiblePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColor.grey,
                    ),
                    onPressed: () => visiblePassword.setPasswordVisible(),
                  ),
                  obscureText: !visiblePassword.isVisiblePassword,
                ),

                // 비밀번호 확인
                CustomTextFormField(
                  title: '비밀번호 확인',
                  hintText: '비밀번호 확인',
                  errorText: formState.isRePasswordValid == true ||
                          formState.isRePasswordValid == null
                      ? null
                      : '비밀번호와 일치하지 않습니다.',
                  initialValue: formState.rePassword,
                  onChanged: (value) =>
                      {validState.updateInputState(value, 'rePassword')},
                  suffixIcon: IconButton(
                    icon: Icon(
                      visiblePassword.isVisibleRePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColor.grey,
                    ),
                    onPressed: () => visiblePassword.setRePasswordVisible(),
                  ),
                  obscureText: !visiblePassword.isVisibleRePassword,
                ),

                // 이름
                CustomTextFormField(
                  title: '이름',
                  hintText: '이름',
                  errorText: formState.isNameValid == true ||
                          formState.isNameValid == null
                      ? null
                      : '이름에 공백을 사용할 수 없습니다.',
                  initialValue: formState.name,
                  onChanged: (value) =>
                      {validState.updateInputState(value, 'name')},
                ),

                // 전화번호
                const Text(
                  '전화번호',
                  style: AppTextTheme.black12b,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        readOnly: false,
                        autocorrect: false,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: '010',
                          counterText: '',
                          errorText: formState.isPhFirstValid == true ||
                                  formState.isPhFirstValid == null
                              ? null
                              : '전화번호 형식을 다시 확인해주세요.',
                        ),
                        maxLength: 4,
                        initialValue: formState.phFirst,
                        onChanged: (value) =>
                            {validState.updateInputState(value, 'phFirst')},
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '-',
                        style: AppTextTheme.deepGrey12m,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        readOnly: false,
                        autocorrect: false,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: '0000',
                          counterText: '',
                          errorText: formState.isPhSecondValid == true ||
                                  formState.isPhSecondValid == null
                              ? null
                              : '전화번호 형식을 다시 확인해주세요.',
                        ),
                        maxLength: 4,
                        initialValue: formState.phSecond,
                        onChanged: (value) =>
                            {validState.updateInputState(value, 'phSecond')},
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '-',
                        style: AppTextTheme.deepGrey12m,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        readOnly: false,
                        autocorrect: false,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: '0000',
                          counterText: '',
                          errorText: formState.isPhThirdValid == true ||
                                  formState.isPhThirdValid == null
                              ? null
                              : '전화번호 형식을 다시 확인해주세요.',
                        ),
                        initialValue: formState.phThird,
                        maxLength: 4,
                        onChanged: (value) => {
                          validState.updateInputState(value, 'phThird'),
                          logger.d(value.length)
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // 생년월일
                const Text('생년월일', style: AppTextTheme.black12b),
                const SizedBox(height: 8),
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
                const Text('이메일', style: AppTextTheme.black12b),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: TextFormField(
                          readOnly: false,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          initialValue: formState.email,
                          onChanged: (value) =>
                              {validState.updateInputState(value, 'email')},
                          decoration: InputDecoration(
                            errorText: formState.isEmailValid == true ||
                                    formState.isEmailValid == null
                                ? null
                                : '이메일을 확인해주세요.',
                          ),
                        )),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child:
                            const Text('@', style: AppTextTheme.deepGrey12m)),
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
                const Text('성별', style: AppTextTheme.black12b),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                      child: Radio(
                        value: registerState.gender[1],
                        groupValue: registerState.selectedGender,
                        onChanged: (String? value) {
                          registerState.selectedGender = value!;
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
                        value: registerState.gender[0],
                        groupValue: registerState.selectedGender,
                        onChanged: (String? value) {
                          registerState.selectedGender = value!;
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

                const Divider(height: 80, thickness: 1),

                const Text('선택 입력 정보', style: AppTextTheme.blue18b),
                const SizedBox(height: 20),
                // 주소
                const Text('주소', style: AppTextTheme.black12b),
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
                                    shape:
                                        MaterialStateProperty.all(
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
      ),
      bottomNavigationBar: ButtonBottomNavigationBarWidget(
        buttonColor: AppColor.lightGreyButtonColor,
        textStyle: AppTextTheme.blue14b,
        label: '가입하기',
        onPressed: () async {
          if ((formState.isUsernameValid == true &&
                  formState.isPasswordValid == true &&
                  formState.isRePasswordValid == true &&
                  formState.isNameValid == true &&
                  formState.isPhFirstValid == true &&
                  formState.isPhSecondValid == true &&
                  formState.isPhThirdValid == true &&
                  formState.isEmailValid == true) !=
              true) {
            toastMessage.showError('필수값 입력을 확인해주세요!');
          } else if ((dropdownState.domainSelectedValue != null &&
                  dropdownState.yearSelectedValue != null &&
                  dropdownState.monthSelectedValue != null &&
                  dropdownState.daySelectedValue != null) !=
              true) {
            toastMessage.showError('필수값 선택을 확인해주세요!');
          } else if (registerState.confirmedId == false) {
            toastMessage.showError('아이디 중복확인을 해주세요!');
          } else {
            final response = await registerState.createUser();
            if (response != null) {
              if (!mounted) return;
              context.goNamed('login');
            } else {
              if (!mounted) return;
              showDialog(
                  context: context,
                  builder: (context) {
                    return const FailedDialog(
                        content: '가입에 실패했습니다.\n잠시 후 다시 시도해주세요.');
                  });
            }
          }
        },
      ),
    );
  }
}
