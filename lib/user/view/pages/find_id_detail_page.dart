import 'package:beauty_care/common/layout/app_text.dart';
import 'package:flutter/material.dart';

class FindIdDetailPage extends StatelessWidget {
  const FindIdDetailPage({super.key, required this.username});

  static String get routeName => 'findIdDetail';

  final String? username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('아이디·비밀번호 찾기')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/ic_person_blue.png',
            width: 36,
          ),
          const Text(
            '회원님의 정보와 일치하는 아이디는',
            style: AppTextTheme.black20m,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(text: username, style: AppTextTheme.blue20b),
            const TextSpan(text: '입니다.', style: AppTextTheme.black20m),
          ]))
        ],
      ),
    );
  }
}
