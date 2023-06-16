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

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String get routeName => 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    print('rebuild');
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final authStateNotifier = ref.watch(authStateProvider.notifier);
      final authState = ref.watch(authStateProvider);
      final user = ref.watch(userNotifierProvider);

      print('home의 authState : $authState');

      return Scaffold(
          appBar: AppBar(
            title: const Text('뷰티 케어'),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => context.pushNamed('login'),
                    icon: const Icon(Icons.search),
                  ),
                  IconButton(
                    onPressed: () => context.pushNamed('mypage'),
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
          body: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 40),
              child: Column(children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 30),
                    padding: const EdgeInsets.fromLTRB(24, 40, 22, 22),
                    decoration: AppBoxTheme.basicShadowWhiteBoxTheme,
                    child: authState == true
                        ? Column(
                            children: [
                              Text(
                                '${user.name}님의 피부타입은',
                                style: AppTextTheme.black18b,
                              ),
                              const Text(
                                'DRPT',
                                style: AppTextTheme.black18b,
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    authStateNotifier.navigateToPage(
                                        context, ref, 'predictSkinMbti'),
                                child: const Text('새로운 예측하기'),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              const Text(
                                '나의 피부 MBTI가 궁금하지 않으세요? AI로 진단받아보시고 체계적으로 관리해보세요',
                                style: AppTextTheme.black18b,
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    authStateNotifier.navigateToPage(
                                        context, ref, 'predictSkinMbti'),
                                child: const Text('새로운 예측하기'),
                              ),
                            ],
                          )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 30),
                  // padding: const EdgeInsets.fromLTRB(24, 40, 22, 22),
                  // decoration: AppBoxTheme.basicShadowWhiteBoxTheme,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => authStateNotifier.navigateToPage(
                                context, ref, 'predictSkinDisease'),
                            child: const Text('AI로 나의 피부 질환 예측하기'),
                          ),
                        ),
                      ]),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 30),
                  // padding: const EdgeInsets.fromLTRB(24, 40, 22, 22),
                  // decoration: AppBoxTheme.basicShadowWhiteBoxTheme,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => authStateNotifier.navigateToPage(
                                context, ref, 'survey'),
                            child: const Text('문진'),
                          ),
                        ),
                      ]),
                )
              ])));
    });
  }
}
