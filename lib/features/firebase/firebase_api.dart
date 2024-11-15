import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../utils/preferences/cache_manager.dart';
import '../notificaations/view/notifications.dart';

class FirebaseApi {
  triggerBNotifiction() {}

  final _fireBaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _fireBaseMessaging.requestPermission();

    final fcmToken = await _fireBaseMessaging.getToken();

    print("FCM_TOKEN $fcmToken");

    SharedPrefs.setString("FCM_TOKEN", fcmToken.toString());
    print("FCM_TOKEN ==> SP :");
    print(SharedPrefs.getString("FCM_TOKEN"));

    initPushNotification();
  }

  void handelMessage(RemoteMessage? message) {
    if (message == null) return;

    navigatorKey.currentState?.pushNamed(
      'lib/features/notificaations/view/notifications.dart',
      arguments: message,
    );
  }

  Future<void> initPushNotification() async {
    FirebaseMessaging.instance.getInitialMessage().then(handelMessage);
    // FirebaseMessaging.onMessageOpenedApp.listen(handelMessage);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("App opened from notification: ${message.data}");
    });

    /// this is to get the message when the App is Opened
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(
          'Message received in the foreground: ${message.notification?.title}');
      // Handle the message, like showing an in-app alert
      AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 10,
            channelKey: "basic_chanel",
            title: "${message.notification?.title}",
            body: "${message.notification?.body}"),
      );
    });
  }
}
