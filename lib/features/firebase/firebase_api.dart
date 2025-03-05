import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import '../../myapp.dart';
import '../../utils/preferences/cache_manager.dart';
import '../notificaations/view/notifications.dart';

// class FirebaseApi {
//   late BuildContext context;
//
//   triggerBNotifiction() {}
//
//   final _fireBaseMessaging = FirebaseMessaging.instance;
//
//   Future<void> initNotifications() async {
//     await _fireBaseMessaging.requestPermission();
//
//     final fcmToken = await _fireBaseMessaging.getToken();
//
//     if (kDebugMode) {
//       print("FCM_TOKEN $fcmToken");
//     }
//
//     SharedPrefs.setString("FCM_TOKEN", fcmToken.toString());
//     if (kDebugMode) {
//       print("FCM_TOKEN ==> SP :");
//     }
//     if (kDebugMode) {
//       print(SharedPrefs.getString("FCM_TOKEN"));
//     }
//
//     initPushNotification();
//   }
//
//   void handelMessage(RemoteMessage? message) {
//     if (message == null) return;
//
//     Map<String, dynamic> data = message.data;
//
//     String route = data['route'] ?? "";
//     String deviceId = data['device_id'] ?? "";
//     String startDate = data['start_date'] ?? "";
//     String endDate = data['end_date'] ?? "";
//
//     navigatorKey.currentState?.pushNamed(
//      route/*"/powerDetail"*/,
//       arguments: {
//         'deviceId': deviceId/*"3071123300001"*/,
//         'startDate': startDate/*"2024-12-01 00:00:00"*/,
//         'endDate': endDate/*"2024-12-13 23:00:00"*/,
//       },
//     );
//   }
//
//   Future<void> initPushNotification() async {
//     FirebaseMessaging.instance.getInitialMessage().then(handelMessage);
//
//     FirebaseMessaging.onMessageOpenedApp.listen(handelMessage);
//
//
//     /*FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       if (kDebugMode) {
//         print("App opened from notification: ${message.data}");
//       }
//     });*/
//
//     /// this is to get the message when the App is Opened
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       if (kDebugMode) {
//         print(
//             'Message received in the foreground: ${message.notification?.body}');
//
//         /// this is to get the chanel key for validation.
//         print('Message received in the foregroundd: ${message.data}');
//       }
//       String channel = "";
//       Map<String, dynamic> data = message.data;
//
//       String channelKey = data['channelKey'] ?? "0";
//       channel = channelKey == "1" ? "device_chanel" : "basic_chanel";
//
//
//       createNotification(
//           channelKey: channel,
//           title: "${message.notification?.title}",
//           body: "${message.notification?.body}",
//           time: generateUniqueId());
//
//       //createNotification(channelKey: "device_chanel", title: "${message.notification?.title}", body: "Device Alert : ${message.notification?.body}");
//     });
//   }
//
//   int generateUniqueId() {
//     final timestamp = DateTime.now().millisecondsSinceEpoch;
//     final randomComponent =
//         Random().nextInt(1000); // A random number between 0 and 999
//
//     if (kDebugMode) {
//       print("timestamp + randomComponent");
//       print(timestamp + randomComponent);
//       print(randomComponent);
//       print(timestamp);
//     }
//     return /*timestamp +*/ randomComponent;
//   }
//
//   void createNotification(
//       {required String? channelKey,
//       required String? title,
//       required String? body,
//       required int? time}) {
//     AwesomeNotifications().createNotification(
//       content: NotificationContent(
//         id: time ?? 0,
//         channelKey: channelKey.toString(),
//         title: title,
//         body: body,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  /// Initialize notifications for both Android and iOS.
  Future<void> initNotifications() async {
    // Request permissions
    await requestPermission();

    // Configure APNs for iOS/macOS
    await configureAPNs();

    // Get the FCM Token
    final fcmToken = await _firebaseMessaging.getToken();
    if (kDebugMode) {
      print("FCM_TOKEN: $fcmToken");
    }

    // Save the FCM token in shared preferences
    SharedPrefs.setString("FCM_TOKEN", fcmToken.toString());
    if (kDebugMode) {
      print("Saved FCM Token: ${SharedPrefs.getString("FCM_TOKEN")}");
    }

    // Initialize push notifications
    initPushNotification();
  }

  /// Request permissions for push notifications.
  Future<void> requestPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print("User granted permission for push notifications.");
      }
    } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
      if (kDebugMode) {
        print("User denied push notification permissions.");
      }
    } else {
      if (kDebugMode) {
        print("User granted provisional permissions.");
      }
    }
  }

  /// Configure APNs for iOS/macOS.
  Future<void> configureAPNs() async {
    if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS) {
      // Set up APNs token handling
      FirebaseMessaging.instance.setAutoInitEnabled(true);

      FirebaseMessaging.instance.getAPNSToken().then((apnsToken) {
        if (kDebugMode) {
          print("APNs Token: $apnsToken");
        }
        SharedPrefs.setString("APN_TOKEN", apnsToken.toString());
        if (kDebugMode) {
          print("Saved APN_TOKEN : ${SharedPrefs.getString("APN_TOKEN")}");
        }
      });

      // Listen for foreground notifications
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        if (kDebugMode) {
          print('iOS Foreground Notification: ${message.notification?.body}');
        }
        String channelKey = message.data['channelKey'] ?? "basic_channel";
        createNotification(
          channelKey: channelKey,
          title: message.notification?.title ?? "",
          body: message.notification?.body ?? "",
          time: generateUniqueId(),
        );
      });
    }
  }

  /// Handle notification clicks and navigation.
  void handleNotificationClick(RemoteMessage? message) {
    if (message == null) return;

    Map<String, dynamic> data = message.data;

    String route = data['route'] ?? "";
    String deviceId = data['device_id'] ?? "";
    String startDate = data['start_date'] ?? "";
    String endDate = data['end_date'] ?? "";

    navigatorKey.currentState?.pushNamed(
   "/splash",
      arguments: {
        'route': route,
        'deviceId': deviceId,
        'startDate': startDate,
        'endDate': endDate,
      },
    );
  }

  /// Initialize push notifications and handle message events.
  Future<void> initPushNotification() async {
    // Handle notifications when the app is launched from a terminated state
    FirebaseMessaging.instance.getInitialMessage().then(
          (message) => handleNotificationClick(message),
    );

    // Handle notifications when the app is opened from the background
    FirebaseMessaging.onMessageOpenedApp.listen(
          (message) => handleNotificationClick(message),
    );

    // Handle notifications when the app is in the foreground
    FirebaseMessaging.onMessage.listen(
          (message) {
        if (kDebugMode) {
          print(
              'Foreground Notification Received: ${message.notification?.body}');
          print('Notification Data: ${message.data}');
        }

        String channelKey = message.data['channelKey'] ?? "basic_chanel";
        createNotification(
          channelKey: channelKey,
          title: message.notification?.title ?? "",
          body: message.notification?.body ?? "",
          time: generateUniqueId(),
        );
      },
    );
  }

  /// Create a local notification using Awesome Notifications.
  void createNotification({
    required String channelKey,
    required String title,
    required String body,
    required int time,
  }) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: time,
        channelKey: channelKey,
        title: title,
        body: body,
      ),
    );
  }

  /// Generate a unique ID for notifications.
  int generateUniqueId() {
    final random = Random().nextInt(1000); // Random number for unique ID
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return random /*+ timestamp*/;
  }
}


