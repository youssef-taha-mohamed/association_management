import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../../shared/enum/notification_types.dart';
import '../../../shared/model/push_notification_model.dart';
import '../navigation_service.dart';

class NotificationService {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // Channel IDs
  static const String _highImportanceChannelId = 'high_importance_channel';
  static const String _highImportanceChannelName =
      'High Importance Notifications';
  static const String _highImportanceChannelDescription =
      'This channel is used for important notifications.';

  // Singleton pattern
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() {
    return _instance;
  }

  NotificationService._internal();

  static Future<void> initialize() async {
    try {
      // Request permission for notifications
      final settings = await _firebaseMessaging.requestPermission(
        criticalAlert: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        debugPrint('User granted permission');
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
        debugPrint('User granted provisional permission');
      } else {
        debugPrint('User declined permission');
        return;
      }

      // Get FCM token
      final token = await _firebaseMessaging.getToken();
      debugPrint('FCM Token: $token');

      // Save token to your backend here
      await _saveTokenToBackend(token);

      // Token refresh handling
      FirebaseMessaging.instance.onTokenRefresh.listen(_saveTokenToBackend);

      // Configure notification handlers
      await _configureForegroundNotification();
      await _configureBackgroundNotification();
      await _configureTerminatedNotification();
      await _initializeLocalNotifications();

      // Set up notification channels
      await _setupNotificationChannels();
    } catch (e) {
      debugPrint('Error initializing notifications: $e');
    }
  }

  static Future<void> _saveTokenToBackend(String? token) async {
    if (token != null) {
      // TODO: Implement token saving to your backend
      debugPrint('Saving token to backend: $token');
    }
  }

  static Future<void> _configureForegroundNotification() async {
    FirebaseMessaging.onMessage.listen((message) {
      debugPrint('Received foreground message: ${message.messageId}');
      debugPrint('Received foreground message data: ${message.data}');
      final customData = message.data;
      final notificationModel = PushNotiModel.fromJson(customData);
      whenOnMessageReceive(notificationModel);
      _handleMessage(message);
    });
  }

  static void whenOnMessageReceive(PushNotiModel notificationModel) {
    if (notificationModel.notificationType == NotificationTypes.scan) {
      Future.delayed(Duration(seconds: 2), () {
       // routeTo(NavigationService.navigatorKey.currentContext!, Routes.scanDoneScreen);
        ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!).showSnackBar(
          SnackBar(
            content: Text(
              '✅ Scan Successfully',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            // Makes it float
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            // Adds spacing
            duration: Duration(seconds: 2), // Controls visibility time
          ),
        );
        // Fluttertoast.showToast(msg: 'Scan Successfully', gravity: ToastGravity.CENTER,);
      });
    } else if (notificationModel.notificationType ==
        NotificationTypes.verifyAccount) {
      //final user = NavigationService.navigatorKey.currentContext!
          // .read<AuthCubit>()
          // .getRemoteUser(fromVerify: true);
    }
  }

  static Future<void> checkNotificationStatus() async {
    final settings = await _firebaseMessaging.getNotificationSettings();
    debugPrint('Notification settings: ${settings.authorizationStatus}');
    final token = await _firebaseMessaging.getToken();
    debugPrint('Current FCM token: $token');
  }

  static Future<String?> getFcmToken() async {
    try {
      final token = await _firebaseMessaging.getToken();
      return token;
    } catch (e) {
      return ' ';
    }
  }

  static Future<void> _configureBackgroundNotification() async {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      debugPrint(
          'Notification opened app from background: ${message.messageId}');
      _handleMessage(message, isBackground: true);
    });
  }

  static Future<void> _configureTerminatedNotification() async {
    final initialMessage = await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      PushNotiModel? notificationModel =
          PushNotiModel.fromJson(initialMessage.data);
      // handleNotificationNavigation(notificationModel);
      debugPrint(
          'Notification opened app from terminated state: ${initialMessage.messageId}');
      await _handleMessage(initialMessage, isBackground: true);
    }
  }

  static Future<void> _initializeLocalNotifications() async {
    const androidInitSettings =
        AndroidInitializationSettings('@mipmap/launcher_icon');
    //AndroidInitializationSettings('@drawable/notification_icon'); // Change this to your icon

    const iOSInitSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const initSettings = InitializationSettings(
      android: androidInitSettings,
      iOS: iOSInitSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
      onDidReceiveBackgroundNotificationResponse:
          _onBackgroundNotificationTapped,
    );
  }

  static void handleNotificationNavigation(PushNotiModel notificationModel) {

    if (NavigationService.navigatorKey.currentContext != null) {
      switch (notificationModel.notificationType) {
        case NotificationTypes.crowd:
          {
            // routeTo(Globals.navigatorKey.currentContext!,
            //     Routes.userCrowdDetailsScreen,
            //     arguments: UserCrowdDetailsParameters(
            //       crowd: CrowdModel(id: notificationModel.entityId),
            //       fromApp: true,
            //     ));
          }
          break;
        case NotificationTypes.verifyAccount:
          {
            //routeTo(Globals.navigatorKey.currentContext!, Routes.businessLayout, isPushNamedAndRemoveUntil: true);
          }
          break;
        case NotificationTypes.package:
         // routeTo(Globals.navigatorKey.currentContext!, Routes.package, isPushNamedAndRemoveUntil: true);
          break;
        case NotificationTypes.businessReview:
          //routeTo(Globals.navigatorKey.currentContext!, Routes.allProfileView, isPushNamedAndRemoveUntil: true);
          break;
        case NotificationTypes.crowdReview:
          //routeTo(Globals.navigatorKey.currentContext!, Routes.allFeedback, isPushNamedAndRemoveUntil: true);
          break;
        case NotificationTypes.target:
         // routeTo(Globals.navigatorKey.currentContext!, Routes.businessLayout, isPushNamedAndRemoveUntil: true);
          break;
        default:
          // routeTo(
          //     Globals.navigatorKey.currentContext!, Routes.noInternetScreen);
      }
    }
  }

  static void _onNotificationTapped(NotificationResponse response) {
    if (response.payload != null) {
      try {
        debugPrint('================== NOTIFICATION TAPPED ==================');
        final Map<String, dynamic> payloadData = json.decode(response.payload!);

        // Print notification content
        debugPrint('📝 Notification Content:');
        debugPrint('Title: ${payloadData['notification']['title']}');
        debugPrint('Body: ${payloadData['notification']['body']}');

        // Print custom data
        debugPrint('🔵 Custom Data:');
        final customData = payloadData['data'] as Map<String, dynamic>;

        final notificationModel = PushNotiModel.fromJson(customData);
        handleNotificationNavigation(notificationModel);
      } catch (e, s) {
        debugPrint('❌ Error parsing notification: $e $s');
      }
    }
  }

  static void _onBackgroundNotificationTapped(NotificationResponse response) {
    debugPrint('Background notification tapped: ${response.payload}');
    if (response.payload != null) {
      debugPrint('Background notification body: ${response.payload}');
    }
  }

  static Future<void> _setupNotificationChannels() async {
    const channel = AndroidNotificationChannel(
      _highImportanceChannelId,
      _highImportanceChannelName,
      description: _highImportanceChannelDescription,
      importance: Importance.max,
      enableLights: true,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  static Future<void> _handleMessage(RemoteMessage message,
      {bool isBackground = false}) async {
    final notification = message.notification;
    final android = message.notification?.android;

    if (notification != null && android != null) {
      // Create a payload containing both notification and data
      final payloadData = <String, dynamic>{
        'notification': {
          'title': notification.title,
          'body': notification.body,
        },
        'data': message.data,
        'isBackground': isBackground,
      };

      await _showNotification(
        id: notification.hashCode,
        title: notification.title ?? 'New Notification',
        body: notification.body ?? '',
        payload: json.encode(payloadData),
        // Encode the entire payload as JSON
        imageUrl: android.imageUrl,
      );

      // Print the complete message data for debugging
      debugPrint('Complete notification data:');
      debugPrint('Title: ${notification.title}');
      debugPrint('Body: ${notification.body}');
      debugPrint('Data: ${message.data}');
      debugPrint('ImageUrl: ${android.imageUrl}');
    }

    // Handle data message
    if (message.data.isNotEmpty) {
      await _handleDataMessage(message.data, isBackground);
    }
  }

  static Future<void> _handleDataMessage(
      Map<String, dynamic> data, bool isBackground) async {
    debugPrint('Handling data message: $data');
    // TODO: Implement data message handling
  }

  static Future<void> _showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
    String? imageUrl,
  }) async {
    final androidDetails = AndroidNotificationDetails(
      _highImportanceChannelId,
      _highImportanceChannelName,
      channelDescription: _highImportanceChannelDescription,
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      styleInformation: imageUrl != null
          ? BigPictureStyleInformation(
              FilePathAndroidBitmap(
                imageUrl,
              ),
              hideExpandedLargeIcon: true,
            )
          : const DefaultStyleInformation(true, true),
    );

    const iOSDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final details = NotificationDetails(
      android: androidDetails,
      iOS: iOSDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      details,
      payload: payload,
    );
  }

  // Public methods for manual notification handling
  static Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  static Future<void> cancelAllNotifications() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }

  static Future<void> sendTestNotification({
    required String title,
    required String body,
    required Map<String, dynamic> customData,
  }) async {
    final payloadData = <String, dynamic>{
      'notification': {
        'title': title,
        'body': body,
      },
      'data': customData,
      'isBackground': false,
    };

    await _showNotification(
      id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title: title,
      body: body,
      payload: json.encode(payloadData),
    );
  }
}
