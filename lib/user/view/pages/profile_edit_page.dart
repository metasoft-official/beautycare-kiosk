import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:beauty_care/user/provider/edit_state_provider.dart';

import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/common/layout/app_color.dart';

import '../widgets/custom_text_form_field.dart';

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
    final editState = ref.watch(editStateProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('프로필 편집')),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(28, 40, 28, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 프로필 사진 ========================================================
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border:
                            Border.all(color: AppColor.lightGrey, width: 1)),
                    width: 100,
                    height: 100,
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage:
                          AssetImage("assets/images/character_coiz_3.png"),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: FittedBox(
                        child: FloatingActionButton.small(
                          backgroundColor: AppColor.appColor,
                          onPressed: () {},
                          child: const Icon(
                            Icons.edit,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              // 내 정보 ========================================================
              const SizedBox(
                width: double.infinity,
                child: Text('내 정보', style: AppTextTheme.blue18b),
              ),
              const SizedBox(
                height: 28,
              ),
              // 이름
              CustomTextFormField(title: '이름', hintText: '이름'),
            ],
          ),
        ),
      ),
    );
  }
}
