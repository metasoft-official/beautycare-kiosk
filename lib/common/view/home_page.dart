import 'dart:io';

import 'package:beauty_care/common/layout/app_box_theme.dart';
import 'package:beauty_care/common/layout/app_button_theme.dart';
import 'package:beauty_care/common/layout/app_text.dart';

import 'package:beauty_care/common/provider/auth_provider.dart';
import 'package:beauty_care/common/provider/login_provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../layout/app_color.dart';
import 'main_cta_banner.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  static String get routeName => 'home';

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void _requestPermission() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final authStateNotifier = ref.watch(authStateProvider.notifier);
    final authState = ref.watch(authStateProvider);
    final user = ref.watch(userNotifierProvider);

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(children: const [
            Expanded(
              child: Image(
                image: AssetImage("assets/images/oxygen_logo.png"),
              ),
            )
          ]),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => context.pushNamed('login'),
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () =>
                      authStateNotifier.navigateToPage(context, ref, 'mypage'),
                  icon: const Icon(Icons.person),
                ),
                IconButton(
                  onPressed: () => context.pushNamed('noti'),
                  icon: const Icon(Icons.notifications),
                ),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            // 피부질환 예측하기
            MainCtaBanner(
              title: '나의 피부 질환을\n예측해보세요.',
              caption: '피부에 숨겨진 문제를 찾아,\n맞춤형 시술과 화장품을\n추천해 드립니다.',
              btnText: '피부질환 예측하기',
              onPressed: () => authStateNotifier.navigateToPage(
                  context, ref, 'predictSkinDisease'),
            ),

            // 피부MBTI 예측하기
            MainCtaBanner(
              color: AppColor.blue,
              title: '나의 피부 MBTI가\n궁금하지 않으세요?',
              caption: 'AI로 진단 받아 보시고,\n체계적으로 관리해보세요!',
              btnText: '피부MBTI 예측하기',
              onPressed: () => authStateNotifier.navigateToPage(
                  context, ref, 'predictSkinMbti'),
            ),

            // Container(
            //     width: MediaQuery.of(context).size.width,
            //     margin: const EdgeInsets.only(top: 30),
            //     padding: const EdgeInsets.fromLTRB(24, 40, 22, 22),
            //     decoration: AppBoxTheme.basicShadowWhiteBoxTheme,
            //     child: authState == true
            //         ? Column(
            //             children: [
            //               Text(
            //                 '${user.name}님의 피부타입은',
            //                 style: AppTextTheme.black18b,
            //               ),
            //               const Text(
            //                 'DRPT',
            //                 style: AppTextTheme.black18b,
            //               ),
            //               ElevatedButton(
            //                 onPressed: () => authStateNotifier.navigateToPage(
            //                     context, ref, 'predictSkinMbti'),
            //                 child: const Text('새로운 예측하기'),
            //               ),
            //             ],
            //           )
            //         : Column(
            //             children: [
            //               const Text(
            //                 '나의 피부 MBTI가 궁금하지 않으세요? AI로 진단받아보시고 체계적으로 관리해보세요',
            //                 style: AppTextTheme.black18b,
            //               ),
            //               ElevatedButton(
            //                 onPressed: () => authStateNotifier.navigateToPage(
            //                     context, ref, 'predictSkinMbti'),
            //                 child: const Text('새로운 예측하기'),
            //               ),
            //             ],
            //           )),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   margin: const EdgeInsets.only(top: 30),
            //   // padding: const EdgeInsets.fromLTRB(24, 40, 22, 22),
            //   // decoration: AppBoxTheme.basicShadowWhiteBoxTheme,
            //   child:
            //       Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            //     Expanded(
            //       child: ElevatedButton(
            //         onPressed: () => authStateNotifier.navigateToPage(
            //             context, ref, 'predictSkinDisease'),
            //         child: const Text('AI로 나의 피부 질환 예측하기'),
            //       ),
            //     ),
            //   ]),
            // ),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   margin: const EdgeInsets.only(top: 30),
            //   // padding: const EdgeInsets.fromLTRB(24, 40, 22, 22),
            //   // decoration: AppBoxTheme.basicShadowWhiteBoxTheme,
            //   child:
            //       Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            //     Expanded(
            //       child: ElevatedButton(
            //         onPressed: () => authStateNotifier.navigateToPage(
            //             context, ref, 'survey'),
            //         child: const Text('문진'),
            //       ),
            //     ),
            //   ]),
            // )
          ]),
        ));
  }
}
