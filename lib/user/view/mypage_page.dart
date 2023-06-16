import 'package:beauty_care/common/layout/app_button_theme.dart';
import 'package:beauty_care/common/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/layout/app_color.dart';
import '../../common/provider/login_provider.dart';

class MypagePage extends ConsumerStatefulWidget {
  const MypagePage({Key? key}) : super(key: key);

  static String get routeName => 'mypage';

  @override
  MypageState createState() => MypageState();
}

class MypageState extends ConsumerState<MypagePage> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('마이페이지')),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 30),
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
                const SizedBox(height: 8),
                Text(
                  '${user.name}',
                  style: AppTextTheme.black20b,
                ),
                const Text(
                  '여드름&모공 하나 보이지 않는 DRPT형',
                  style: AppTextTheme.deepGrey14,
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 15,
            color: AppColor.lightGrey,
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(24, 30, 24, 30),
            child: Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        style: AppButtonTheme.outlinedBasicButtonTheme,
                        onPressed: () => context.pushNamed('history'),
                        child: const Text('예측이력'))),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('피부변화')),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
