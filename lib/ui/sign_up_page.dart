import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar (
        title: const Text('ClassA'),
      ),
      body : Center(
        child : Column(
          mainAxisAlignment : MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/sign-up/studentA'),
              child: const Text('studentA'),
            ),
          ],
        ),
      ),
    );
  }
}


class ClassA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar (
        title: const Text('ClassA'),
      ),
      body : Center(
        child : Column(
          mainAxisAlignment : MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/classA/studentA'),
              child: const Text('studentA'),
            ),
          ],
        ),
      ),
    );
  }
}