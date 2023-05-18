import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('뷰티 케어'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => context.pushNamed('login'),
                icon: const Icon(Icons.login),
              ),
              IconButton(
                onPressed: () => context.pushNamed('register'),
                icon: const Icon(Icons.person),
              ),
              // const SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () => context.pushNamed('survey'),
              //   child: const Text('설문조사'),
              // ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () => context.pushNamed('survey'),
              //   child: const Text('설문조사'),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
