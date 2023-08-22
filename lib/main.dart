import 'package:beauty_care/common/component/dialog/toast_message.dart';
import 'package:beauty_care/common/component/mixins/hide_navigation_bar_mixin.dart';
import 'package:beauty_care/common/component/mixins/string_util.dart';
import 'package:beauty_care/common/provider/auth_provider.dart';
import 'package:beauty_care/mbti/provider/diagnosis_provider.dart';
import 'package:beauty_care/user/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:logger/logger.dart';

import 'package:beauty_care/common/const/router.dart';
import 'package:beauty_care/common/const/globals.dart';
import 'package:beauty_care/common/layout/app_theme.dart';

var logger = Logger();
var stringUtil = StringUtil();
var toastMessage = ToastMessage();

void main() async {
  KakaoSdk.init(
      nativeAppKey: '0411529dd3d4b984f8f6e1753471f0a1',
      javaScriptAppKey: 'ea72724bc4dbaef409ee2d2c9020e6e5');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  String? firebase_token = await FirebaseMessaging.instance.getToken();

  print("firebase_token : ${firebase_token ?? 'token NULL!'}");

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userApi = ref.read(userApiProvider);
    final authStateNotifier = ref.watch(authStateProvider.notifier);

    // 앱 시작 시 자동 로그인 시도
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      authStateNotifier.tryAutoLogin();
    });

    return MaterialApp.router(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
