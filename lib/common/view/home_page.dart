import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';

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

    // final client = HttpClientWithInterceptor.build(
    //     interceptors: [AuthorizationInterceptor()],
    //     retryPolicy: ExpiredTokenRetryPolicy());

    // FirebaseMessaging.instance.getToken().then((token) {
    //   // FCM 토큰을 서버에 저장 👈👈👈👈👈👈👈👈👈👈👈
    //   client.post(Uri.parse(Constants.API + 'booster/v1/fcm-token'),
    //       body: jsonEncode({'fcmToken': "$token"}));
    // });
    //
    // FirebaseMessaging.instance.onTokenRefresh.listen((token) {
    //   // FCM 토큰을 서버에 저장 👈👈👈👈👈👈👈👈👈👈👈
    //   client.post(Uri.parse(Constants.API + 'booster/v1/fcm-token'),
    //       body: jsonEncode({'fcmToken': "$token"}));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('뷰티 케어'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => context.pushNamed('login'),
                icon: const Icon(Icons.login),
              ),
              IconButton(
                onPressed: () => context.pushNamed('mypage'),
                icon: const Icon(Icons.person),
              ),
              // const SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () => context.pushNamed('survey'),
              //   child: const Text('설문조사'),
              // ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(height: 20),
                // ElevatedButton(
                //   onPressed: () => context.pushNamed('survey'),
                //   child: const Text('설문조사'),
                // ),

                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => context.pushNamed('camera'),
                          child: const Text('카메라 테스트'),
                        ),
                      ]),
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => context.pushNamed('predictSkinMbti'),
                          child: const Text('AI로 피부 MBTI 예측하기'),
                        ),
                      ]),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () =>
                              context.pushNamed('predictSkinDisease'),
                          child: const Text('AI로 나의 피부 질환 예측하기'),
                        ),
                      ]),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => context.pushNamed('survey'),
                          child: const Text('피부타입 문진'),
                        ),
                      ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
