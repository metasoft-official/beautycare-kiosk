import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:beauty_care/common/const/router.dart';
import 'package:beauty_care/common/layout/app_theme.dart';
import 'package:beauty_care/common/component/dialog/error_message.dart';
import 'package:beauty_care/common/provider/auth_provider.dart';
import 'package:beauty_care/common/provider/component_provider.dart';

import 'package:logger/logger.dart';

var logger = Logger();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');
}

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  var initialzationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  var initialzationSettingsIOS = IOSInitializationSettings(
    requestSoundPermission: true,
    requestBadgePermission: true,
    requestAlertPermission: true,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  var initializationSettings = InitializationSettings(
      android: initialzationSettingsAndroid, iOS: initialzationSettingsIOS);

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  String? token = await FirebaseMessaging.instance.getToken();

  print("token : ${token ?? 'token NULL!'}");

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final materialAppKey = GlobalKey();
  late FirebaseMessaging messaging;

  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      var androidNotiDetails = AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: channel.description,
      );
      var iOSNotiDetails = const IOSNotificationDetails();
      var details =
          NotificationDetails(android: androidNotiDetails, iOS: iOSNotiDetails);
      if (notification != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          details,
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print(message);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // secure storage
    // final storage = FlutterSecureStorage(); // FlutterSecureStorage를 storage로 저장
    // dynamic userInfo = ''; // storage에 있는 유저 정보를 저장
    //
    // _asyncMethod() async {
    //   // read 함수로 key값에 맞는 정보를 불러오고 데이터타입은 String 타입
    //   // 데이터가 없을때는 null을 반환
    //   userInfo = await storage.read(key: 'login');
    //
    //   // user의 정보가 있다면 로그인 후 들어가는 첫 페이지로 넘어가게 합니다.
    //   if (userInfo != null) {
    //     Navigator.pushNamed(context, '/main');
    //   } else {
    //     print('로그인이 필요합니다');
    //   }
    // }

    // //flutter_secure_storage 사용을 위한 초기화 작업
    // @override
    // void initState() {
    //   super.initState();
    //
    //   // 비동기로 flutter secure storage 정보를 불러오는 작업
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     _asyncMethod();
    //   });
    // }

    return MaterialApp.router(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
