import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/user/provider/register_state_provider.dart';

import 'package:beauty_care/common/layout/app_button_theme.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/common/layout/app_color.dart';

import 'package:beauty_care/common/component/widgets/button_bottom_navigation_bar.dart';
import 'package:beauty_care/user/view/widgets/custom_text_form_field.dart';
import '../../../common/component/widgets/custom_dropdown_button_2.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static String get routeName => 'register';

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends ConsumerState<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final registerState = ref.watch(registerStateProvider); //프로바이더 구독

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
                  controller: registerState.idTextController,
                  focusNode: registerState.idFocus,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  // onChanged: (){},
                  // validator: validator,
                  decoration: InputDecoration(
                      hintText: '아이디',
                      suffixIcon: Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: TextButton(
                          onPressed: () {},
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
                    controller: registerState.pwTextController,
                    focusNode: registerState.pwFocus,
                    hintText: '비밀번호'),

                // 비밀번호 확인
                CustomTextFormField(
                    title: '비밀번호 확인',
                    controller: registerState.rePwTextController,
                    focusNode: registerState.rePwFocus,
                    hintText: '비밀번호 확인'),

                // 이름
                CustomTextFormField(
                    title: '이름',
                    controller: registerState.nmTextController,
                    focusNode: registerState.nmFocus,
                    hintText: '이름'),

                // 전화번호
                const Text('전화번호', style: AppTextTheme.black12b),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        readOnly: false,
                        autocorrect: false,
                        controller: registerState.phFirstTextController,
                        focusNode: registerState.phFirstFocus,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: '010',
                          counterText: '',
                        ),
                        maxLength: 4,
                        //   onChanged :(value) => {
                        //     return null;
                        //   },
                        // validator : (value) => {
                        //   return null;
                        // },
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
                        controller: registerState.phSecondTextController,
                        focusNode: registerState.phSecondFocus,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: '0000',
                          counterText: '',
                        ),
                        maxLength: 4,
                        //   onChanged :(value) => {
                        //     return null;
                        //   },
                        // validator : (value) => {
                        //   return null;
                        // },
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
                        controller: registerState.phThirdTextController,
                        focusNode: registerState.phThirdFocus,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: '0000',
                          counterText: '',
                        ),
                        maxLength: 4,
                        //   onChanged :(value) => {
                        //     return null;
                        //   },
                        // validator : (value) => {
                        //   return null;
                        // },
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
                        items: registerState.yearValue,
                        hint: '생년',
                        value: registerState.yearSelectedValue,
                        onChanged: (value) {
                          registerState.selectDropdown('year', value);
                        },
                      ),
                    ),
                    const SizedBox(width: 4),
                    //월
                    Expanded(
                      child: CustomDropdownButton2(
                        items: registerState.monthValue,
                        hint: '월',
                        value: registerState.monthSelectedValue,
                        onChanged: (value) {
                          registerState.selectDropdown('month', value);
                        },
                      ),
                    ),
                    const SizedBox(width: 4),
                    //일
                    Expanded(
                      child: CustomDropdownButton2(
                        items: registerState.dayValue,
                        hint: '일',
                        value: registerState.daySelectedValue,
                        onChanged: (value) {
                          registerState.selectDropdown('day', value);
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
                          controller: registerState.emTextController,
                          focusNode: registerState.emFocus,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          //   onChanged :(value) => {
                          //     return null;
                          //   },
                          // validator : (value) => {
                          //   return null;
                          // },
                        )),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child:
                            const Text('@', style: AppTextTheme.deepGrey12m)),
                    Expanded(
                      flex: 1,
                      child: CustomDropdownButton2(
                        items: registerState.domainValue,
                        hint: '선택',
                        value: registerState.domainSelectedValue,
                        onChanged: (value) {
                          registerState.selectDropdown('domain', value);
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
                          registerState.resetState();
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
                          registerState.resetState();
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
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      readOnly: true,
                      autocorrect: false,
                      controller: registerState.postcordTextController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: '우편번호',
                      ),
                      // validator : (value) => {
                      //   return null;
                      // },
                    )),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        registerState.searchPost(context);
                      },
                      style: AppButtonTheme.basicElevatedButtonTheme.copyWith(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0))),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 15))),
                      child:
                          const Text('우편번호 검색', style: AppTextTheme.white12b),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                    readOnly: true,
                    controller: registerState.addressTextController,
                    hintText: '주소'),
                // 상세주소
                CustomTextFormField(
                    controller: registerState.detailAddressTextController,
                    focusNode: registerState.detailAddressFocus,
                    hintText: '상세주소를 입력해 주세요.'),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: ButtonBottomNavigationBarWidget(
        buttonColor: AppColor.lightGreyButtonColor,
        textStyle: AppTextTheme.blue14b,
        label: '가입하기',
        onPressed: () {
          context.goNamed('login');
        },
      ),
    );
  }
}
