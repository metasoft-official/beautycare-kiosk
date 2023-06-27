import 'dart:convert';
import 'dart:io';

import 'package:beauty_care/common/model/user_model.dart';
import 'package:beauty_care/common/provider/auth_provider.dart';
import 'package:beauty_care/common/provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart'
    as KakaoUser;

import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:beauty_care/common/layout/app_button_theme.dart';

const myInputDecoration = InputDecoration(
  border: OutlineInputBorder(),
  filled: true,
  fillColor: Colors.white,
);

final myTextStyle = TextStyle(color: Colors.blue, fontSize: 20);

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
      appBar: AppBar(
        title: const Text('로그인'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 100, 0, 10),
              child: TextField(
                controller: _usernameController,
                decoration: myInputDecoration.copyWith(
                  labelText: '아이디',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: TextField(
                controller: _passwordController,
                decoration: myInputDecoration.copyWith(
                  labelText: '비밀번호',
                ),
                obscureText: true,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                  const Text("아이디 저장"),
                  const Spacer(),
                  TextButton(
                    onPressed: () => context.pushNamed('findId'),
                    child: const Text("아이디 찾기"),
                  ),
                  const Text('|'),
                  TextButton(
                    // style: AppButtonTheme.basicTextButtonTheme,
                    onPressed: () => context.pushNamed('findId'),
                    child: const Text("비밀번호 찾기"),
                  )
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
                      child: ElevatedButton(
                        style: AppButtonTheme.darkElevatedButtonTheme,
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
                        child: const Text('로그인'),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: ElevatedButton(
                        style: AppButtonTheme.basicElevatedButtonTheme,
                        onPressed: () => context.pushNamed('register'),
                        child: Text('회원가입'),
                      ),
                    )
                  ],
                )),
            // 소셜 로그인
            Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
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
                                print('사용자 정보 요청 성공'
                                    '\n회원번호: ${user.id}'
                                    '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
                                    '\n이메일: ${user.kakaoAccount?.email}');

                                // 존재하지 않는 회원일 경우 회원가입 페이지로 이동

                                final kakaoUser = UserModel(username: user.id);
                                final response = await ref
                                    .watch(userApiProvider)
                                    .getUserList(kakaoUser.toJson());
                                print('회원 가입 유무');
                                print(response.toString());
                              } catch (error) {
                                print('사용자 정보 요청 실패 $error');
                              }
                            },
                            icon: Image.asset(
                              'assets/icons/kakao_login_medium_narrow.png',
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
