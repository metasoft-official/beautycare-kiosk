import 'package:beauty_care/common/component/mixins/hide_navigation_bar_mixin.dart';
import 'package:beauty_care/common/component/widgets/custom_app_bar.dart';
import 'package:beauty_care/common/component/widgets/custom_bottom_navigation_bar.dart';
import 'package:beauty_care/common/component/widgets/custom_dropdown_button_2.dart';
import 'package:beauty_care/common/component/widgets/custom_tabbar_view_widget.dart';
import 'package:beauty_care/common/component/widgets/custom_tabbar_widget.dart';
import 'package:beauty_care/common/layout/app_button_theme.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/user/provider/find_id_pw_provider.dart';
import 'package:beauty_care/user/provider/register_state_provider.dart';
import 'package:beauty_care/user/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../main.dart';

class FindIdPwPage extends ConsumerStatefulWidget {
  const FindIdPwPage({super.key});

  static String get routeName => 'findIdPw';

  @override
  _FindIdPwPageState createState() => _FindIdPwPageState();
}

class _FindIdPwPageState extends ConsumerState<FindIdPwPage>
    with TickerProviderStateMixin {
  late TabController tabController;
  HideNavbar scrollController = HideNavbar();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      ref.watch(dropdownChangeStateProvider.notifier).domainSelectedValue =
          null;
      ref.watch(formStateProvider.notifier).init();
      final findState = ref.watch(findChangeProvider);
      findState.resetState();
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(formStateProvider);
    final validState = ref.watch(formStateProvider.notifier);
    final dropdownState = ref.watch(dropdownChangeStateProvider);
    final sendEmailState = ref.watch(sendEmailProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('아이디·비밀번호 찾기'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomTabbarWidget(
            titles: const ['아이디 찾기', '비밀번호 찾기'],
            tabController: tabController,
          ),
        ),
      ),
      body: CustomTabbarViewWidget(tabController: tabController, widgets: [
        /// 아이디 찾기 =======================================================
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // 이메일
              const SizedBox(
                  width: double.infinity,
                  child: Text('이메일', style: AppTextTheme.black12b)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: TextFormField(
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) =>
                            {validState.updateInputState(value, 'email')},
                        decoration: InputDecoration(
                          hintText: '이메일',
                          errorText: formState.isEmailValid == true ||
                                  formState.isEmailValid == null
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
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // 인증코드 전송 버튼
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: AppButtonTheme.basicElevatedNoRoundedButtonTheme,
                  onPressed: () {
                    if (dropdownState.domainSelectedValue == null) {
                      toastMessage.topRedBoxWhiteText('이메일 주소를 선택해주세요.');
                    } else {
                      sendEmailState
                          .sendEmail(
                              email:
                                  '${formState.email}@${dropdownState.domainSelectedValue}')
                          .then((value) =>
                              toastMessage.topYellowBoxBlueText(value));
                    }
                  },
                  child: const Text('인증코드 전송'),
                ),
              ),
              const SizedBox(height: 20),
              // 인증코드 입력
              const SizedBox(
                  width: double.infinity,
                  child: Text('인증코드', style: AppTextTheme.black12b)),
              const SizedBox(height: 8),
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onChanged: (value) => {validState.updateCode(value)},
                decoration: InputDecoration(
                  hintText: '인증코드 6자리',
                  errorText: formState.isCodeValid == true ||
                          formState.isCodeValid == null
                      ? null
                      : '인증코드 여섯자리를 작성해주세요.',
                  suffixIcon: TextButton(
                    onPressed: () async {
                      if (formState.isCodeValid == true ||
                          formState.isCodeValid == null) {
                        int? response;
                        await sendEmailState
                            .matchCode(formState.code ?? '')
                            .then((value) => response = value);
                        if (response != null) {
                          if (response! > 0) {
                            // 성공
                            logger.d(sendEmailState.user);
                            () => context.push(
                                '/find-id-detail?username=${sendEmailState.user.username}');
                          } else {
                            toastMessage.topRedBoxWhiteText('인증번호를 다시 확인해주세요.');
                          }
                        }
                      }
                    },
                    child: const Text(
                      '확인',
                      style: AppTextTheme.blue12b,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        /// 비밀번호 찾기 =======================================================
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              CustomTextFormField(
                title: '아이디',
                hintText: '아이디',
                errorText: (formState.isUsernameValid == true ||
                        formState.isUsernameValid == null)
                    ? null
                    : '아이디는 영문과 숫자로 4자 이상, 12자 이하 이어야 합니다.',
                onChanged: (value) =>
                    {validState.updateInputState(value, 'username')},
              ),
              const SizedBox(height: 16),
              // 이메일
              const SizedBox(
                  width: double.infinity,
                  child: Text('이메일', style: AppTextTheme.black12b)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: TextFormField(
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) =>
                            {validState.updateInputState(value, 'email')},
                        decoration: InputDecoration(
                          hintText: '이메일',
                          errorText: formState.isEmailValid == true ||
                                  formState.isEmailValid == null
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
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // 인증코드 전송 버튼
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: AppButtonTheme.basicElevatedNoRoundedButtonTheme,
                  onPressed: () {
                    if (dropdownState.domainSelectedValue == null) {
                      toastMessage.topRedBoxWhiteText('이메일 주소를 선택해주세요.');
                    } else {
                      sendEmailState
                          .sendEmail(
                              email:
                                  '${formState.email}@${dropdownState.domainSelectedValue}')
                          .then((value) =>
                              toastMessage.topYellowBoxBlueText(value));
                    }
                  },
                  child: const Text('인증코드 전송'),
                ),
              ),
              const SizedBox(height: 20),
              // 인증코드 입력
              const SizedBox(
                  width: double.infinity,
                  child: Text('인증코드', style: AppTextTheme.black12b)),
              const SizedBox(height: 8),
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onChanged: (value) => {validState.updateCode(value)},
                decoration: InputDecoration(
                  hintText: '인증코드 6자리',
                  suffixIcon: TextButton(
                    onPressed: () async {
                      if (formState.isCodeValid == true ||
                          formState.isCodeValid == null) {
                        int? response;
                        await sendEmailState
                            .matchCode(formState.code ?? '')
                            .then((value) => response = value);
                        logger.d(response);
                        if (response != null) {
                          if (response! > 0) {
                            // 성공
                            logger.d('성공');
                          } else {
                            toastMessage.topRedBoxWhiteText('인증번호를 다시 확인해주세요.');
                          }
                        }
                      }
                    },
                    child: const Text(
                      '확인',
                      style: AppTextTheme.blue12b,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
