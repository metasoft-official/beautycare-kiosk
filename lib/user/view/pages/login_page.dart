import 'dart:convert';
import 'dart:io';
import 'package:beauty_care/common/component/widgets/button_bottom_navigation_bar.dart';
import 'package:beauty_care/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart'
    as KakaoUser;

import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/common/model/user_model.dart';
import 'package:beauty_care/common/provider/auth_provider.dart';
import 'package:beauty_care/common/provider/provider.dart';

import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:beauty_care/common/layout/app_button_theme.dart';
import 'package:beauty_care/common/layout/app_input_theme.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key, required this.onLoginSuccess});
  final String Function() onLoginSuccess; // 새로운 콜백
  static String get routeName => 'login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool? _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userNotifierProvider);

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('로그인'),
      // ),
      backgroundColor: AppColor.whiteBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(35, 130, 35, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: const [
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Image(
                          width: 197,
                          // height: 40,
                          fit: BoxFit.fitWidth,
                          image: AssetImage('assets/images/oxygen_logo.png'))),
                ],
              ),
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
                    child: Text('로그인 후\n이용이 가능합니다.',
                        style: AppTextTheme.color88888824b),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 50, 0, 10),
                child: TextField(
                  controller: _usernameController,
                  decoration: AppInputTheme.loginInputDecoration.copyWith(
                    labelText: '아이디',
                    prefixIcon: Container(
                        margin: const EdgeInsets.only(right: 5.0),
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/icons/ic_person.png",
                          height: 20,
                          width: 20,
                        )),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: TextField(
                  controller: _passwordController,
                  decoration: AppInputTheme.loginInputDecoration.copyWith(
                      labelText: '비밀번호',
                      prefixIcon: Container(
                          margin: const EdgeInsets.only(right: 5.0),
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/icons/ic_password.png",
                            height: 20,
                            width: 20,
                          ))),
                  obscureText: true,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    const Text("아이디 저장", style: AppTextTheme.black12b),
                    Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    const Text("자동 로그인", style: AppTextTheme.black12b),
                  ],
                ),
              ),
              // 로그인 실패
              // if (userState.username == null)
              //   Text(
              //     // userState.error!,
              //     '로그인 실패',
              //     style: const TextStyle(color: Colors.red),
              //   ),
              Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        // height: 48,
                        child: ElevatedButton(
                          style: AppButtonTheme.basicElevatedButtonTheme,
                          onPressed: () async {
                            final token = await ref
                                .read(userNotifierProvider.notifier)
                                .login(
                                  _usernameController.text,
                                  _passwordController.text,
                                );
                            // final authState = ref.read(authStateProvider);
                            //
                            // print('변경 전 : $authState');

                            if (token != 'error') {
                              ref.read(authStateProvider.notifier).logIn();
                            }

                            final authState = ref.read(authStateProvider);
                            // print('변경 후 : $authState');

                            String routeName = widget.onLoginSuccess();

                            if (authState == true) {
                              // 로그인 페이지를 pop
                              // context.pop();
                              context.pop();
                              context.pushNamed(routeName);
                              // context.goNamed(routeName);
                            } else {
                              // 로그인 실패 처리
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                            child:
                                const Text('로그인', style: AppTextTheme.white16b),
                          ),
                        ),
                      ),
                      Container(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () => context.pushNamed('findId'),
                              child: const Text("아이디 찾기",
                                  style: AppTextTheme.black12),
                            ),
                            const Text(
                              '|',
                              style: AppTextTheme.colorDDDDDD12,
                            ),
                            TextButton(
                              // style: AppButtonTheme.basicTextButtonTheme,
                              onPressed: () => context.pushNamed('findId'),
                              child: const Text("비밀번호 찾기",
                                  style: AppTextTheme.black12),
                            )
                          ],
                        ),
                      ),
                      Row(),
                    ],
                  )),
              // 소셜 로그인
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 네이버 로그인
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: IconButton(
                      onPressed: () async {},
                      icon: Image.asset(
                        'assets/icons/naver.png',
                        width: 48,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // 카카오 로그인
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: IconButton(
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
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              // ElevatedButton(
              //   style: AppButtonTheme.basicElevatedButtonTheme,
              //   onPressed: () => context.pushNamed('register'),
              //   child: Text('회원가입'),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ButtonBottomNavigationBarWidget(
        buttonColor: AppColor.lightGreyButtonColor,
        textStyle: AppTextTheme.blue14b,
        label: '회원가입',
        hiding: hiding,
        onPressed: () {
          context.pushNamed('register');
        },
      ),
    );
  }
}
