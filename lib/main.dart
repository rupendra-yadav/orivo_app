import 'package:auro/myapp.dart';
import 'package:auro/utils/helpers/network_manager.dart';
import 'package:auro/utils/preferences/cache_manager.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'data/repository/authentication_repository.dart';

Future<void> main() async {
  await GetStorage.init();
  Get.put(AuthenticationRepository());
  Get.put(NetworkManager());
  await SharedPrefs.init();

  // Ensure that plugin services are initialized so that `availableCameras()`
// can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

// Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

// Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(const Myapp());
}
