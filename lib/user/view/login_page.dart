import 'package:beauty_care/common/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:beauty_care/common/const/router.dart';

import '../../common/provider/login_provider.dart';
import '../../common/layout/app_button_theme.dart';

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
            if (userState.name != null)
              const Text(
                // userState.error!,
                '로그인 성공 ',
                style: TextStyle(color: Colors.red),
              ),

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
                          ref.read(authStateProvider.notifier).logIn();

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
                ))
          ],
        ),
      ),
    );
  }
}
