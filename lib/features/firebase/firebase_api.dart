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

    /// this is to navigate to a particular page on click of the Notification

   /* if ("/costEstimateDetail" == "/costEstimateDetail") {
      navigatorKey.currentState?.pushNamed(
        '/costEstimateDetail',
        arguments: {
          'deviceId': '3071123300001',
          'deviceName': 'Device A',
          'startDate': '2024-12-04 00:00:00',
          'endDate': '2024-12-04 10:27:20',
        },
      );
    }*/

    /* if(message.data == "/demandDetail"){
        Navigator.pushNamed(context as BuildContext, '/demandDetail');
      }
      if(message.data == "/consumptionDetail"){
        Navigator.pushNamed(context as BuildContext, '/consumptionDetail');
      }
      if(message.data == "/powerDetail"){
        Navigator.pushNamed(context as BuildContext, '/powerDetail');
      }*/
  }

  Future<void> initPushNotification() async {
    FirebaseMessaging.instance.getInitialMessage().then(handelMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handelMessage);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("App opened from notification: ${message.data}");
    });

    /// this is to get the message when the App is Opened
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print(
            'Message received in the foreground: ${message.notification?.body}');

        /// this is to get the chanel key for validation.
        print('Message received in the foregroundd: ${message.data}');
      }

      createNotification(
          channelKey: "basic_chanel",
          title: "${message.notification?.title}",
          body: "${message.notification?.body}");

      //createNotification(channelKey: "device_chanel", title: "${message.notification?.title}", body: "Device Alert : ${message.notification?.body}");
    });
  }

  void createNotification(
      {required String? channelKey,
      required String? title,
      required String? body}) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: channelKey.toString(),
        title: title,
        body: body,
      ),
    );
  }
}
