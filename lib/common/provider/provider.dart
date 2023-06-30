import 'package:beauty_care/common/const/globals.dart';
import 'package:beauty_care/common/const/values.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';

import '../dio/user_api.dart';

// firebase_message
class FirebaseMessagingState extends StateNotifier<RemoteMessage?> {
  FirebaseMessagingState() : super(null) {
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
  }
}

final firebaseMessagingStateProvider =
    StateNotifierProvider<FirebaseMessagingState, RemoteMessage?>((ref) {
  return FirebaseMessagingState();
});
