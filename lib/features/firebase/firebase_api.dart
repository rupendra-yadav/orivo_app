import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import '../../myapp.dart';
import '../../utils/preferences/cache_manager.dart';
import '../notificaations/view/notifications.dart';

class FirebaseApi {
  late BuildContext context;

  triggerBNotifiction() {}

  final _fireBaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _fireBaseMessaging.requestPermission();

    final fcmToken = await _fireBaseMessaging.getToken();

    if (kDebugMode) {
      print("FCM_TOKEN $fcmToken");
    }

    SharedPrefs.setString("FCM_TOKEN", fcmToken.toString());
    if (kDebugMode) {
      print("FCM_TOKEN ==> SP :");
    }
    if (kDebugMode) {
      print(SharedPrefs.getString("FCM_TOKEN"));
    }

    initPushNotification();
  }

  void handelMessage(RemoteMessage? message) {
    if (message == null) return;

    Map<String, dynamic> data = message.data;

    String route = data['route'] ?? "";
    String deviceId = data['device_id'] ?? "";
    String startDate = data['start_date'] ?? "";
    String endDate = data['end_date'] ?? "";

    navigatorKey.currentState?.pushNamed(
      route/*"/costEstimateDetail"*/,
      arguments: {
        'deviceId': deviceId/*"3071123300001"*/,
        'startDate': startDate/*"2024-12-11 00:00:00"*/,
        'endDate': endDate/*"2024-12-11 23:00:00"*/,
      },
    );
  }

  Future<void> initPushNotification() async {
    FirebaseMessaging.instance.getInitialMessage().then(handelMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(handelMessage);


    /*FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (kDebugMode) {
        print("App opened from notification: ${message.data}");
      }
    });*/

    /// this is to get the message when the App is Opened
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print(
            'Message received in the foreground: ${message.notification?.body}');

        /// this is to get the chanel key for validation.
        print('Message received in the foregroundd: ${message.data}');
      }
      String channel = "";
      Map<String, dynamic> data = message.data;

      String channelKey = data['channelKey'] ?? "0";
      channel = channelKey == "1" ? "device_chanel" : "basic_chanel";


      createNotification(
          channelKey: channel,
          title: "${message.notification?.title}",
          body: "${message.notification?.body}",
          time: generateUniqueId());

      //createNotification(channelKey: "device_chanel", title: "${message.notification?.title}", body: "Device Alert : ${message.notification?.body}");
    });
  }

  int generateUniqueId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final randomComponent =
        Random().nextInt(1000); // A random number between 0 and 999

    if (kDebugMode) {
      print("timestamp + randomComponent");
      print(timestamp + randomComponent);
      print(randomComponent);
      print(timestamp);
    }
    return /*timestamp +*/ randomComponent;
  }

  void createNotification(
      {required String? channelKey,
      required String? title,
      required String? body,
      required int? time}) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: time ?? 0,
        channelKey: channelKey.toString(),
        title: title,
        body: body,
      ),
    );
  }
}
