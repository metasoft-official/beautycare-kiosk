import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar (
        title: const Text('회원 가입'),
      ),
      body : Center(
        child : Column(
          mainAxisAlignment : MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/sign-up/sign-up-detail'),
              child: const Text('Sign Up Detail'),
            ),
          ],
        ),
      ),
    );
  }
}

