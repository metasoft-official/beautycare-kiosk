import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_project/common/dio/user_api.dart';

import '../model/user_model.dart';
import '../repository/user_repository.dart';
import '../dio/user_api.dart';
import '../provider/login_provider.dart';

class SignInPage extends ConsumerWidget {
  static String get routeName => 'login';

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            if (userState.error != null)
              Text(
                userState.error!,
                style: TextStyle(color: Colors.red),
              ),
            ElevatedButton(
              onPressed: () {
                ref.read(userNotifierProvider.notifier).login(
                      _usernameController.text,
                      _passwordController.text,
                    );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
