import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_badge/flutter_app_badge.dart';
import '../../../shared/enum/target_type.dart';
import '../navigation_service.dart';
import 'local_notification.dart';

abstract class NotificationUtils {
  const NotificationUtils();
  static bool isinitialized = false;

  /// Gets the current FCM token
  static Future<String?> fcmToken() async {
    try {
      return await FirebaseMessaging.instance.getToken();
    } catch (e) {
      log('Error getting FCM token: $e', name: 'NotificationUtils');
      return null;
    }
  }

  /// Deletes the current FCM token
  static Future<void> deleteFcmToken() async {
    try {
      await FirebaseMessaging.instance.deleteToken();
    } catch (e) {
      log('Error deleting FCM token: $e', name: 'NotificationUtils');
    }
  }

  /// Stream that emits FCM token updates
  static Stream<String> onTokenRefresh() {
    return FirebaseMessaging.instance.onTokenRefresh;
  }

  static Future<void> startListin() async {
    if (isinitialized) {
      return;
    }

    NotificationUtils.isinitialized = true;
    log('Starting notification listeners', name: 'NotificationUtils');

    // Set up foreground notification options
    // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    //   alert: true,
    //   badge: true,
    //   sound: true,
    // );

    // Handle permissions
    await _requestNotificationPermissions();

    // Listen for foreground messages
    FirebaseMessaging.onMessage.listen((message) async {
      log('Received foreground message: ${message.data}',
          name: 'NotificationUtils');
      if (Platform.isAndroid) {
        await _handleNotificationMessage(message);
      }
    });

    // Handle when app is opened from notification in background/terminated state
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      log('App opened from background notification: ${message.data}',
          name: 'NotificationUtils');
      await notificationHandler(data: message.data);
    });

    // Set up background message handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.instance.getToken().then(
      (value) {
        print('token: $value');
      },
    );
  }

  static Future<void> _requestNotificationPermissions() async {
    if (Platform.isIOS) {
      final settings = await FirebaseMessaging.instance.requestPermission(
        criticalAlert: true,
        announcement: true,
      );
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
      log('iOS notification permission status: ${settings.authorizationStatus}',
          name: 'NotificationUtils');
    } else if (Platform.isAndroid) {
      final settings = await FirebaseMessaging.instance.requestPermission();
      log('Android notification permission status: ${settings.authorizationStatus}',
          name: 'NotificationUtils');
    }
  }

  static Future<void> _handleNotificationMessage(RemoteMessage message) async {
    // Update badge count
    if (Platform.isIOS) {
      final count = int.tryParse(message.notification?.apple?.badge ?? '');
      await FlutterAppBadge.count(count ?? 0);
     // NotificationsProvider.updateCount(count ?? 0);
    } else if (Platform.isAndroid) {
      final count = message.notification?.android?.count;
      //NotificationsProvider.updateCount(count ?? 0);
    }

    // Show local notification
    final obj = LocalNotificationUtils();
    await obj.showNotification(
      title: message.notification?.title ?? '',
      body: message.notification?.body ?? '',
      payload: jsonEncode(message.data),
    );
  }

  static Future<void> notificationHandler({
    required Map<String, dynamic> data,
  }) async {
    log('Handling notification with data: $data', name: 'NotificationUtils');

    final targetTypeId = int.tryParse('${data['target_type']}');
    final id = int.tryParse('${data['target_id']}');
    final context = NavigationService.navigatorKey.currentContext;

    if (id == null || targetTypeId == null || context == null) {
      log('Invalid notification data or context', name: 'NotificationUtils');
      return;
    }

    final targetType = TargetType.fromId(targetTypeId);
    log('Processing target type: $targetType with id: $id',
        name: 'NotificationUtils');

    try {
      await _handleNavigation(context, targetType, id);
    } catch (e) {
      log('Navigation error: $e', name: 'NotificationUtils');
    }
  }

  static Future<void> _handleNavigation(
      BuildContext context, TargetType targetType, int id) async {
    switch (targetType) {
      case TargetType.pushMessage:
        return;

      case TargetType.blog:
        // await Navigator.of(context).pushNamed(
        //   BlogDetails.routeName,
        //   arguments: BlogDetailsViewArguments(blogId: id),
        // );
        break;

      case TargetType.dream:
        // if (AuthenticationProvider.isAuth &&
        //     AuthenticationProvider.instance.currentUser?.details.role ==
        //         UserRole.expert) {
        //   final dream =
        //       await FetchDream(repository: DependencyInjector.dreamRepository)
        //           .call(id: id);
        //
        //   await Navigator.of(context, rootNavigator: true).pushNamed(
        //     MofaserChatRoomView.routeName,
        //     arguments: dream,
        //   );
        // } else {
        //   await Navigator.of(context).pushNamed(
        //     DreamDetails.routeName,
        //     arguments: DreamDetailsArguments(dreamId: id),
        //   );
        // }
      case TargetType.package:
        // await Navigator.of(context).pushNamed(
        //   PackagesView.routeName,
        // );
      case TargetType.expert:
        // await Navigator.of(context).pushNamed(
        //   ExpertProfileView.routeName,
        //   arguments: DreamInterpreterProfileArguments(
        //     interpreterId: id,
        //   ),
        // );
      case TargetType.contactUs:
      //   await Navigator.of(context).pushNamed(
      //     ContactUsView.routeName,
      //   );
      // case TargetType.comment:
      //   await Navigator.of(context).pushNamed(
      //     RepliesScreen.routeName,
      //     arguments: RepliesBlogViewArguments(
      //       comment: await FetchBlogComment(
      //         repository: DependencyInjector.blogCommentBaseRepository,
      //       ).call(
      //         id: id,
      //       ),
      //     ),
      //   );
      case TargetType.dreamComment:
        // if (AuthenticationProvider.isAuth &&
        //     AuthenticationProvider.instance.currentUser?.details.role ==
        //         UserRole.expert) {
        //   final dream =
        //       await FetchDream(repository: DependencyInjector.dreamRepository)
        //           .call(
        //     id: id,
        //   );
        //   await Navigator.of(context, rootNavigator: true).pushNamed(
        //     MofaserChatRoomView.routeName,
        //     arguments: dream,
        //   );
        // } else {
        //   await Navigator.of(context).pushNamed(
        //     DreamDetails.routeName,
        //     arguments: DreamDetailsArguments(
        //       dreamId: id,
        //     ),
        //   );
        // }
        return;
      case TargetType.payment:
        // await Navigator.of(context).pushNamed(
        //   MyPackagesView.routeName,
        // );
        return;
      case TargetType.dreamReport:
        return;
      case TargetType.liveChat:
        // await Navigator.of(context).pushNamed(
        //   LiveChatScreen.routeName,
        // );
      case TargetType.liveChatMessage:
        // await Navigator.of(context).pushNamed(
        //   LiveChatScreen.routeName,
        // );
        break;
        default:
        return;

    }
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');
  if (Platform.isIOS) {
    final i = int.tryParse(message.notification?.apple?.badge ?? '');

    FlutterAppBadge.count(i ?? 0);
    //NotificationsProvider.updateCount(i ?? 0);
  } else if (Platform.isAndroid) {
    final i = message.notification?.android?.count;
   // NotificationsProvider.updateCount(i ?? 0);
    // FlutterAppBadge.count(i ?? 0);
  }
}
