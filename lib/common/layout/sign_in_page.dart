import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginProvider = StateNotifierProvider<LoginController, LoginState>((ref) => LoginController());

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            // ElevatedButton(
              // onPressed: () {
              //   context.read(loginProvider.notifier).login(
              //     emailController.text,
              //     passwordController.text,
              //   );
              // },
              // child: Text('Login'),
            // ),
          ],
        ),
      ),
    );
  }
}


class LoginController extends StateNotifier<LoginState> {
  LoginController() : super(LoginState());

  void login(String email, String password) async {
    try {
      // 로그인 로직
      state = LoginState(isLoading: false, isSuccess: true, error: '');
    } catch (e) {
      state = LoginState(isLoading: false, isSuccess: false, error: '로그인 실패: $e');
    }
  }
}

class LoginState {
  final bool isLoading;
  final bool isSuccess;
  final String error;

  LoginState({this.isLoading = false, this.isSuccess = false, this.error = ''});
}
