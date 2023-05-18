import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import '../provider/login_provider.dart';
import '../layout/app_button_theme.dart';

const myInputDecoration = InputDecoration(
  border: OutlineInputBorder(),
  filled: true,
  fillColor: Colors.white,
);

final myTextStyle = TextStyle(color: Colors.blue, fontSize: 20);

class LoginPage extends ConsumerStatefulWidget {
  static String get routeName => 'login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool? _isChecked = false;

  static final storage =
      FlutterSecureStorage(); // FlutterSecureStorage를 storage로 저장
  dynamic userInfo = ''; // storage에 있는 유저 정보를 저장

  //flutter_secure_storage 사용을 위한 초기화 작업
  @override
  void initState() {
    super.initState();

    // 비동기로 flutter secure storage 정보를 불러오는 작업
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    // read 함수로 key값에 맞는 정보를 불러오고 데이터타입은 String 타입
    // 데이터가 없을때는 null을 반환
    userInfo = await storage.read(key: 'login');

    // user의 정보가 있다면 로그인 후 들어가는 첫 페이지로 넘어가게 합니다.
    if (userInfo != null) {
      Navigator.pushNamed(context, '/main');
    } else {
      print('로그인이 필요합니다');
    }
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
                  Text("아이디 저장"),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      // Respond to button press
                      //
                    },
                    child: Text("아이디 찾기"),
                  ),
                  Text('|'),
                  TextButton(
                    // style: AppButtonTheme.basicTextButtonTheme,
                    onPressed: () {
                      // Respond to button press
                      //
                    },
                    child: Text("비밀번호 찾기"),
                  )
                ],
              ),
            ),
            // 로그인 실패
            if (userState.error != null)
              Text(
                userState.error!,
                style: TextStyle(color: Colors.red),
              ),

            Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        // style: ElevatedButton.styleFrom(
                        //   primary: Colors.black,
                        //   minimumSize: const Size.fromHeight(50), // NEW
                        // ),
                        style: AppButtonTheme.darkElevatedButtonTheme,
                        onPressed: () {
                          ref.read(userNotifierProvider.notifier).login(
                                _usernameController.text,
                                _passwordController.text,
                              );
                        },
                        child: Text('로그인'),
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
