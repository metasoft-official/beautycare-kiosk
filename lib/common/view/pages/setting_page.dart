import 'package:beauty_care/common/layout/app_color.dart';
import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingPage extends ConsumerStatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  static String get routeName => 'setting';

  @override
  SettingState createState() => SettingState();
}

class SettingState extends ConsumerState<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('설정'),
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          width: double.infinity,
          color: AppColor.lightGrey,
          child: const Text(
            '계정 관리',
            style: AppTextTheme.middleGrey12,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('계정 정보', style: AppTextTheme.black16m),
                Text('${user.phoneNumber}' ?? '-',
                    style: AppTextTheme.middleGrey12),
                Text('${user.email}' ?? '-', style: AppTextTheme.middleGrey12),
              ],
            ),
          ),
        ),
        const Divider(height: 16),
        const SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
            child: Text('비밀번호 변경', style: AppTextTheme.black16m),
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          width: double.infinity,
          color: AppColor.lightGrey,
          child: const Text(
            '알림 설정',
            style: AppTextTheme.middleGrey12,
          ),
        ),
      ]),
    );
  }
}
