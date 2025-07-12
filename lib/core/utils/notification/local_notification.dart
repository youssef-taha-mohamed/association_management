// import 'dart:convert';
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:math';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'notification.dart';

class LocalNotificationUtils {
  static final LocalNotificationUtils _instance = LocalNotificationUtils._internal();
  factory LocalNotificationUtils() => _instance;

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  LocalNotificationUtils._internal() {
    _initializeNotifications();
  }

  void _initializeNotifications() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/launcher_icon'),
      iOS: DarwinInitializationSettings(),
    );
    
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) async {
        dev.log('Notification tapped in foreground', name: 'LocalNotificationUtils');
        final payload = details.payload;
        if (payload != null) {
          try {
            final data = jsonDecode(payload);
            dev.log('Decoded payload: $data', name: 'LocalNotificationUtils');
            await NotificationUtils.notificationHandler(data: data);
          } catch (e) {
            dev.log('Error handling notification payload: $e', name: 'LocalNotificationUtils');
          }
        }
      },
   
    );
  }

  Future<void> showNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
      enableVibration: true,
      playSound: true,
    );
    
    const platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );
    
    try {
      await flutterLocalNotificationsPlugin.show(
        Random.secure().nextInt(999),
        title,
        body,
        platformChannelSpecifics,
        payload: payload,
      );
    } catch (e) {
      dev.log('Error showing notification: $e', name: 'LocalNotificationUtils');
    }
  }
}
