import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar (
        title: const Text('HomePage'),
      ),
      body : Center(
        child : Column(
          mainAxisAlignment : MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/sign-in'),
              child: const Text('sign in'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.pushNamed('/sign-up'),
              child: const Text('sign up'),
            ),
          ],
        ),
      ),
    );
  }
}