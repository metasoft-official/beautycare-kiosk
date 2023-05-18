import 'package:flutter/material.dart';

class MypagePage extends StatelessWidget {
  const MypagePage({Key? key}) : super(key: key);
  static String get routeName => 'mypage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('마이페이지')),
      body: const SafeArea(child: SingleChildScrollView()),
    );
  }
}
