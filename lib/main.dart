import 'package:auro/myapp.dart';
import 'package:auro/utils/helpers/network_manager.dart';
import 'package:auro/utils/preferences/cache_manager.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'data/repository/authentication_repository.dart';
import 'features/firebase/firebase_api.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();

  await Firebase.initializeApp();

  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          channelKey: "basic_chanel",
          channelName: "Basic Notifications",
          channelDescription: "Notification Chanel For Basic Tests",
          importance: NotificationImportance.High)
    ],
    debug: true,
  );

  await GetStorage.init();
  Get.put(AuthenticationRepository());
  Get.put(NetworkManager());
  await SharedPrefs.init();

  runApp(const Myapp());
}
