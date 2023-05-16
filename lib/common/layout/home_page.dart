import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.pushNamed('login'),
              child: const Text('로그인'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.pushNamed('register'),
              child: const Text('회원가입'),
            ),
            // const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () => context.pushNamed('survey'),
            //   child: const Text('설문조사'),
            // ),
          ],
        ),
      ),
    );
  }
}
