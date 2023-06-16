import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// firebase cloud message

late FirebaseMessaging messaging;

AndroidNotificationChannel channel = const AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.high,
);

late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');
}

var initialzationSettingsAndroid =
    const AndroidInitializationSettings('@mipmap/ic_launcher');

var initialzationSettingsIOS = const IOSInitializationSettings(
  requestSoundPermission: true,
  requestBadgePermission: true,
  requestAlertPermission: true,
);

var initializationSettings = InitializationSettings(
    android: initialzationSettingsAndroid, iOS: initialzationSettingsIOS);
