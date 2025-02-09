import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../firebase_options.dart';
import 'local_notification_manager.dart';
import 'notification_manager.dart';

class FirebaseNotificationManager extends NotificationManager {
  FirebaseNotificationManager._();

  static final FirebaseNotificationManager instance =
      FirebaseNotificationManager._();

  factory FirebaseNotificationManager() => instance;

  static FirebaseMessaging? _messaging;

  Future<void> initialize() async {
    try {
      await LocalNotificationManager.instance.initialize();
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
      _messaging = FirebaseMessaging.instance;
      await notificationPermission();
      await initMessaging();
    } catch (_) {}
  }

  Future<String?> getToken() async {
    try {
      return await _messaging?.getToken();
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteToken() async {
    try {
      return await _messaging?.deleteToken();
    } catch (_) {}
  }

  // for ios only
  Future<String?> getApnsToken() async {
    try {
      return await _messaging?.getAPNSToken();
    } catch (e) {
      return null;
    }
  }

  // ask user for notification permission
  Future<void> notificationPermission() async {
    if (_messaging == null) return;

    await _messaging?.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );
  }

  Future<void> subscribeToTopic(String topic) async {
    await _messaging?.subscribeToTopic(topic);
  }
  Future<void> unSubscribeToTopic(String topic) async {
    await _messaging?.unsubscribeFromTopic(topic);
  }

  // initialize message
  Future<void> initMessaging() async {
    if (_messaging == null) return;

    // set foreground notification channel
    await _messaging?.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);

    // _messaging!.getInitialMessage().then(handleMessageClick);

    // open app by clicking notification
    //FirebaseMessaging.onMessageOpenedApp.listen(handleMessageClick);

    // receive a notification
    FirebaseMessaging.onMessage.listen(_handleOnMessage);

    // handle background message
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
  }

  Future<void> messageClick() async {
    _messaging?.getInitialMessage().then(handleMessageClick);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessageClick);
  }

  /// handle background message
  /// when app in background or terminated
  static Future<void> _handleBackgroundMessage(RemoteMessage message) async {}

  /// onMessage Received in foreground
  Future<void> _handleOnMessage(RemoteMessage? message) async {
    if (message == null) return;

    final payload = message.data.isEmpty ? null : jsonEncode(message.data);
    LocalNotificationManager.instance.showNotification(
        0, message.notification?.title ?? '', '${message.notification?.body}',
        payload: payload);
  }

  // message click events
  Future<void> handleMessageClick(RemoteMessage? message) async {
    if (message == null) return;

    final data = message.data;
    if (data.isEmpty) return;

    redirection(data);
  }
}
