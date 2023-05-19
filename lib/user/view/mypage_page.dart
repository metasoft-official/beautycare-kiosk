import 'package:flutter/material.dart';
import 'package:riverpod_project/common/layout/app_text.dart';

class MypagePage extends StatelessWidget {
  const MypagePage({Key? key}) : super(key: key);
  static String get routeName => 'mypage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('마이페이지')),
      body: SafeArea(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    width: 50,
                    height: 50,
                    child: const CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/sample_images_01.png"),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    '김뷰티',
                    style: AppTextTheme.black18b,
                  ),
                  const Text(
                    '김뷰티님, 좋은 하루 되세요!',
                    style: AppTextTheme.black16,
                  )
                ],
              ))),
    );
  }
}
