import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/layout/app_color.dart';

import 'package:beauty_care/common/provider/login_provider.dart';

class ProfileEditPage extends ConsumerStatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  static String get routeName => 'profileEdit';

  @override
  ProfileEditState createState() => ProfileEditState();
}

class ProfileEditState extends ConsumerState<ProfileEditPage> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('프로필 편집')),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(24, 40, 24, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 프로필 ========================================================
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(color: AppColor.lightGrey, width: 1)),
                  width: 100,
                  height: 100,
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage:
                        AssetImage("assets/images/emoji_sample_profile.png"),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
