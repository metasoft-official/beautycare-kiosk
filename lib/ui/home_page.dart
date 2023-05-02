import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


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
              onPressed: () => context.go('/classA'),
              child: const Text('classA'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push('/classB'),
              child: const Text('classB'),
            ),
          ],
        ),
      ),
    );
  }
}