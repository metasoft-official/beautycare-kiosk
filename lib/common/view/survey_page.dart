import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({super.key});

  static String get routeName => 'survey';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설문'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
