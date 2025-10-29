import 'dart:convert';

import 'package:auro/data/repository/device_repository.dart';
import 'package:auro/features/navigation/view/bottom_nav_screen/model/device_list_model.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/preferences/cache_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../../utils/local_storage/storage_utility.dart';
import '../../../../../utils/popups/loaders.dart';
import '../../../../authentication/model/user_detail.dart';

class DeviceListController extends GetxController {
  static DeviceListController get instance => Get.find();

  final TLocalStorage _localStorage = TLocalStorage();
  static const String _userDataKey = 'user_data';

  final _deviceReposotory = Get.put(DeviceRepository());

  RxList<DeviceListModel> deviceList = <DeviceListModel>[].obs;

  final isDeviceLoading = false.obs;
  final isFCMLoading = false.obs;

  // 🔹 Load from local storage, else fetch from API
  Future<void> loadDeviceListFromPrefs() async {
    isDeviceLoading.value = true;
    try {
      final String? jsonString = await _localStorage.readData("device_list");

      if (jsonString != null && jsonString.isNotEmpty) {
        final List<dynamic> jsonList = jsonDecode(jsonString);
        deviceList.value =
            jsonList.map((e) => DeviceListModel.fromJson(e)).toList();
        isDeviceLoading.value = false;
      } else {
        await getDeviceList2(); // fallback if nothing cached
        if (kDebugMode) {
          print("No Cached data fetching from api");
        }
      }
    } catch (e) {
      print("Error loading cached device list: $e");
      await getDeviceList2();
    }
  }

  ///--------Device List
  Future<void> getDeviceList() async {
    /// this is to Access data
    Map<String, dynamic> userDataMap =
        _localStorage.readData(_userDataKey) ?? {};
    UserDetail user = UserDetail.fromJson(userDataMap);
    try {
      try {
        isDeviceLoading.value = true;

        final deviceLis = await _deviceReposotory.getDeviceList(user.mCustId);

        deviceList.assignAll(deviceLis);

        if (kDebugMode) {
          print(user.mCustName);
        }
      } catch (e) {
        // TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
        TLoaders.errorSnackBar(
            title: 'Oh Snap!', message: "No Device Available...!");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      isDeviceLoading.value = false;
    }
  }

  ///--------Update FCM

  Future<void> updateFcm() async {
    /// this is to Access data
    Map<String, dynamic> userDataMap =
        _localStorage.readData(_userDataKey) ?? {};
    UserDetail user = UserDetail.fromJson(userDataMap);

    try {
      isDeviceLoading.value = true;

      try {
        isFCMLoading.value = true;

        final Map<String, dynamic> responsee =
            await _deviceReposotory.updateFCM(
                user.mCustId, SharedPrefs.getString("FCM_TOKEN").toString());
      } catch (e) {
        print(e.toString());
      }

      if (kDebugMode) {
        print(user.mCustName);
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isFCMLoading.value = false;
    }
  }

  ////////////////////////////////Gen 2 API/////////////////////////////////////

  Future<void> getDeviceList2() async {
    /// this is to Access data

    try {
      isDeviceLoading.value = true;

      final deviceLis = await _deviceReposotory.getDeviceList2(
          SharedPrefs.getString("mobileNumber") ?? "",
          SharedPrefs.getString(TTexts.prefAccessToken) ?? "");

      deviceList.assignAll(deviceLis);

      await saveDeviceListToPrefs(deviceLis);
    } catch (e) {
      isDeviceLoading.value = false;
      // TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      TLoaders.errorSnackBar(
          title: 'Oh Snap!', message: "No Device Available...!");
    } finally {
      isDeviceLoading.value = false;
    }
  }

  // Helper function to save the list of DeviceListModel to SharedPreferences
  Future<void> saveDeviceListToPrefs(List<DeviceListModel> deviceList) async {
    // Convert the list of DeviceListModel to a list of JSON strings
    final List<String> deviceListJson =
        deviceList.map((device) => jsonEncode(device.toJson())).toList();

    // Store the list of JSON strings in SharedPreferences
    await SharedPrefs.setStringList('deviceList', deviceListJson);
  }

  // Helper function to retrieve the list of DeviceListModel from SharedPreferences
  Future<List<DeviceListModel>> getDeviceListFromPrefs() async {
    final List<String>? deviceListJson =
        SharedPrefs.getStringList('deviceList');

    if (deviceListJson == null) {
      return []; // Return an empty list if no data is stored
    }

    // Convert the list of JSON strings back to a list of DeviceListModel
    final List<DeviceListModel> deviceList = deviceListJson
        .map((jsonString) => DeviceListModel.fromJson(jsonDecode(jsonString)))
        .toList();

    return deviceList;
  }

  // Future<void> loadDeviceListFromPrefs() async {
  //   try {

  //     final storedDeviceList = await getDeviceListFromPrefs();
  //     deviceList.assignAll(storedDeviceList);
  //     if(deviceList.isEmpty){
  //       getDeviceList2();
  //     }
  //   }
  //   catch (e){
  //     if (kDebugMode) {
  //       print("DEVICE LIST ERROR: ${e.toString()}");
  //     }
  //   }
  // }
}
