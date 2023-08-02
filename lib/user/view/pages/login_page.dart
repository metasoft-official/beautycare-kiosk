import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart'
    as KakaoUser;

import 'package:beauty_care/user/provider/user_provider.dart';
import 'package:beauty_care/common/provider/auth_provider.dart';
import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:beauty_care/common/model/user_model.dart';

import 'package:beauty_care/common/component/widgets/button_bottom_navigation_bar.dart';
import 'package:beauty_care/common/layout/app_button_theme.dart';
import 'package:beauty_care/common/layout/app_input_theme.dart';
import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key, required this.onLoginSuccess});
  final String Function() onLoginSuccess; // 새로운 콜백
  static String get routeName => 'login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userNotifierProvider);
    final loginState = ref.watch(loginNotifierProvider);

    return Scaffold(
      backgroundColor: AppColor.whiteBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35, 130, 35, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: const Image(
                          // width: 197,
                          height: 40,
                          fit: BoxFit.scaleDown,
                          image: AssetImage('assets/images/oxygen_logo.png')),
                    ),
                    const SizedBox(height: 24),
                    const Text('로그인 후\n이용이 가능합니다.',
                        style: AppTextTheme.middleGrey24b),
                    const SizedBox(height: 73),
                    TextFormField(
                      controller: loginState.usernameController,
                      decoration: AppInputTheme.loginInputDecoration.copyWith(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10),
                        labelText: '아이디',
                        labelStyle:
                            AppTextTheme.semiRowGrey12.copyWith(height: 1.2),
                        prefixIcon: Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(right: 5.0),
                            child: Image.asset(
                                "assets/icons/ic_person_grey.png",
                                width: 9)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: loginState.passwordController,
                      decoration: AppInputTheme.loginInputDecoration.copyWith(
                          labelText: '비밀번호',
                          labelStyle:
                              AppTextTheme.semiRowGrey12.copyWith(height: 1.2),
                          prefixIcon: Container(
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(right: 5.0),
                              child: Image.asset(
                                "assets/icons/ic_password_grey.png",
                                width: 9,
                              ))),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 16,
                          width: 16,
                          child: Checkbox(
                            value: loginState.isCheckedSavedId,
                            onChanged: (value) {
                              setState(() {
                                loginState.isCheckedSavedId = value!;
                                loginState.resetState;
                              });
                            },
                            activeColor: AppColor.appColor,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text("아이디 저장",
                            style: AppTextTheme.black12b.copyWith(height: 1.2)),
                        const SizedBox(width: 16),
                        SizedBox(
                          height: 16,
                          width: 16,
                          child: Checkbox(
                            value: loginState.isCheckedAutoLogin,
                            onChanged: (value) {
                              setState(() {
                                loginState.isCheckedAutoLogin = value!;
                                loginState.resetState;
                              });
                            },
                            activeColor: AppColor.appColor,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text("자동 로그인",
                            style: AppTextTheme.black12b.copyWith(height: 1.2)),
                      ],
                    ),
                    // 로그인 실패
                    // if (userState.username == null)
                    //   Text(
                    //     // userState.error!,
                    //     '로그인 실패',
                    //     style: const TextStyle(color: Colors.red),
                    //   ),
                    const SizedBox(height: 30),

                    // 로그인 버튼
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: AppButtonTheme.basicElevatedButtonTheme,
                        onPressed: () async {
                          final token = await ref
                              .read(userNotifierProvider.notifier)
                              .login(
                                loginState.usernameController.text,
                                loginState.passwordController.text,
                              );

                          if (token != 'error') {
                            ref.read(authStateProvider.notifier).logIn();
                          }

                          final authState = ref.read(authStateProvider);
                          // print('변경 후 : $authState');

                          String routeName = widget.onLoginSuccess();

                          if (authState == true) {
                            // 로그인 페이지를 pop
                            // context.pop();
                            context.pushNamed(routeName);
                            // context.goNamed('home');
                          } else {
                            // 로그인 실패 처리
                          }
                        },
                        child: const Text('로그인', style: AppTextTheme.white16b),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () => context.pushNamed('findId'),
                          child:
                              const Text("아이디 찾기", style: AppTextTheme.black12),
                        ),
                        const Text(
                          ' | ',
                          style: AppTextTheme.middleGrey12b,
                        ),
                        TextButton(
                          // style: AppButtonTheme.basicTextButtonTheme,
                          onPressed: () => context.pushNamed('findId'),
                          child: const Text("비밀번호 찾기",
                              style: AppTextTheme.black12),
                        )
                      ],
                    ),
                    // 소셜 로그인
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 네이버 로그인
                        IconButton(
                          onPressed: () async {},
                          icon: Image.asset(
                            'assets/icons/naver.png',
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // 카카오 로그인
                        IconButton(
                          onPressed: () async {
                            if (await KakaoUser.isKakaoTalkInstalled()) {
                              try {
                                await KakaoUser.UserApi.instance
                                    .loginWithKakaoTalk();
                                print('카카오톡으로 로그인 성공');
                              } catch (error) {
                                print('카카오톡으로 로그인 실패 $error');

                                // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
                                // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
                                if (error is PlatformException &&
                                    error.code == 'CANCELED') {
                                  return;
                                }
                                // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
                                try {
                                  await KakaoUser.UserApi.instance
                                      .loginWithKakaoAccount();
                                  print('카카오계정으로 로그인 성공');
                                } catch (error) {
                                  print('카카오계정으로 로그인 실패 $error');
                                }
                              }
                            } else {
                              try {
                                await KakaoUser.UserApi.instance
                                    .loginWithKakaoAccount();
                                print('카카오계정으로 로그인 성공');
                              } catch (error) {
                                print('카카오계정으로 로그인 실패 $error');
                              }
                            }
                            try {
                              KakaoUser.User user =
                                  await KakaoUser.UserApi.instance.me();

                              // 존재하지 않는 회원일 경우 회원가입 페이지로 이동

                              final kakaoUser = UserModel(username: user.id);
                              final response = await ref
                                  .watch(userApiProvider)
                                  .getUserList(kakaoUser.toJson());
                            } catch (error) {}
                          },
                          icon: Image.asset(
                            'assets/icons/kakaotalk.png',
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ButtonBottomNavigationBarWidget(
        buttonColor: AppColor.lightGreyButtonColor,
        textStyle: AppTextTheme.blue14b,
        label: '회원가입',
        onPressed: () {
          context.pushNamed('termsAgreement');
        },
      ),
    );
  }
}
