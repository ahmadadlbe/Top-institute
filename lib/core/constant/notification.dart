import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'colors_app.dart';

class LocalNotificationService {
  // Instance of Flutternotification plugin
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    // Initialization  setting for android
    const InitializationSettings initializationSettingsAndroid =
        InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );
    _notificationsPlugin.initialize(
      initializationSettingsAndroid,
      // to handle event when we receive notification
      onDidReceiveNotificationResponse: (details) {
        if (details.input != null) {}
      },
    );
  }

  static Future<void> display(RemoteMessage message) async {
    // To display the notification in device
    try {
      print(message.notification!.android!.sound);
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          message.notification!.android!.channelId ?? "Channel Id",
          message.notification!.android!.channelId ?? "Main Channel",
          groupKey: "gfg",
          color: kColorMain,
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: const DarwinNotificationDetails(
          interruptionLevel: InterruptionLevel.active,
          presentAlert: true,
          presentBadge: true,
          presentBanner: true,
          presentSound: true,
          presentList: true,
        ),
      );
      await _notificationsPlugin.show(
        id,
        message.notification?.title,
        message.notification?.body,
        notificationDetails,
        payload: message.data['route'],
      );
    } catch (e) {
      log("Error Notification ==> ${e.toString()}");
    }
  }

  static Future<void> displaay(String message) async {
    // To display the notification in device
    print("object");
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      NotificationDetails notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails(
          "Channel Id",
          "Main Channel",
          groupKey: "gfg",
          color: kColorMain,
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(
          interruptionLevel: InterruptionLevel.active,
          presentAlert: true,
          presentBadge: true,
          presentBanner: true,
          presentSound: true,
          presentList: true,
        ),
      );
      await _notificationsPlugin.show(
        id,
        message,
        message,
        notificationDetails,
      );
    } catch (e) {
      log("Error Notification ==> ${e.toString()}");
    }
  }
}
