/* *
 * local notification manager
 * */

import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'notification_manager.dart';

class LocalNotificationManager extends NotificationManager {
  static LocalNotificationManager instance = LocalNotificationManager._();

  LocalNotificationManager._();

  final AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'hirelytics', // id
    'Hirelytics Notification', // title
    description: 'This channel is used for hirelytics notifications.',
    importance: Importance.high,
    playSound: true,
  );

  InitializationSettings initializationSettings = const InitializationSettings(
    android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    iOS: DarwinInitializationSettings(),
  );

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (details) {
      final payload = details.payload;
      if (payload != null && payload.isNotEmpty) {
        final data = jsonDecode(payload);
        if (data is Map<String, dynamic>) {
          redirection(data);
        }
      }
    });
  }

  void showNotification(int id, String title, String body,
      {String? payload}) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description,
            importance: Importance.high,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher',
            //largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
            category: AndroidNotificationCategory.event);
    DarwinNotificationDetails iOSNotificationDetails =
    const DarwinNotificationDetails(
      presentSound: true,
      presentBadge: true,
      presentBanner: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iOSNotificationDetails,
    );
    await flutterLocalNotificationsPlugin
        .show(id, title, body, notificationDetails, payload: payload);
  }

  Future<void> cancelNotification(int id) async {
    try {
      await flutterLocalNotificationsPlugin.cancel(id);
    } catch (_) {}
  }
}
