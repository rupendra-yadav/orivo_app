import 'package:auro/data/repository/notification_repository.dart';
import 'package:auro/utils/preferences/cache_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../utils/constant/text_strings.dart';
import '../../../utils/local_storage/storage_utility.dart';
import '../../../utils/popups/loaders.dart';
import '../../authentication/model/user_detail.dart';
import '../Model/device_alert_notification_model.dart';
import '../Model/notification_model.dart';

class NotificationController extends GetxController {
  static NotificationController get instance => Get.find();

  final _deviceReposotory = Get.put(NotificationRepository());

  final TLocalStorage _localStorage = TLocalStorage();
  static const String _userDataKey = 'user_data';

  RxList<NotificationModel> notificationList = <NotificationModel>[].obs;
  RxList<DeviceAlertNotificationModel> deviceAlertNotificationList =
      <DeviceAlertNotificationModel>[].obs;

  final isNotificationLoading = false.obs;
  final isDeviceAlertNotificationLoading = false.obs;

  ///--------Notification List
  Future<void> getNotificationList() async {
    /// this is to Access data
    Map<String, dynamic> userDataMap =
        _localStorage.readData(_userDataKey) ?? {};
    UserDetail user = UserDetail.fromJson(userDataMap);
    try {
      try {
        isNotificationLoading.value = true;

        final deviceLis =
            await _deviceReposotory.getNotificationList(user.mCustId);

        notificationList.assignAll(deviceLis);
      } catch (e) {
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      isNotificationLoading.value = false;
    }
  }

  ///--------Device AlertNotification List
  Future<void> getDeviceAlertNotificationList(String mid) async {
    /// this is to Access data
    Map<String, dynamic> userDataMap =
        _localStorage.readData(_userDataKey) ?? {};
    UserDetail user = UserDetail.fromJson(userDataMap);
    try {
      try {
        isDeviceAlertNotificationLoading.value = true;

        final deviceLis =
            await _deviceReposotory.getDeviceAlertNotificationList(mid);

        deviceAlertNotificationList.assignAll(deviceLis);
        print(deviceLis);
      } catch (e) {
        print(e.toString());
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      isDeviceAlertNotificationLoading.value = false;
    }
  }

  ///TODO///////////////////// Gen 2 ////////////////////////////////////////////

  ///--------Notification List
  Future<void> getNotificationList2() async {
    /// this is to Access data
    Map<String, dynamic> userDataMap =
        _localStorage.readData(_userDataKey) ?? {};
    UserDetail user = UserDetail.fromJson(userDataMap);
    try {
      try {
        isNotificationLoading.value = true;

        final deviceLis = await _deviceReposotory.getNotificationList2(
            SharedPrefs.getString(TTexts.prefMobileNumber) ?? "",
            SharedPrefs.getString((TTexts.prefAccessToken)) ?? "");

        notificationList.assignAll(deviceLis);
      } catch (e) {
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      isNotificationLoading.value = false;
    }
  }

  ///--------Device AlertNotification List
  Future<void> getDeviceAlertNotificationList2(String mid) async {
    /// this is to Access data
    Map<String, dynamic> userDataMap =
        _localStorage.readData(_userDataKey) ?? {};
    UserDetail user = UserDetail.fromJson(userDataMap);
    try {
      try {
        isDeviceAlertNotificationLoading.value = true;

        final deviceLis =
            await _deviceReposotory.getDeviceAlertNotificationList2(
                mid, SharedPrefs.getString((TTexts.prefAccessToken)) ?? "");

        deviceAlertNotificationList.assignAll(deviceLis);
      } catch (e) {
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      isDeviceAlertNotificationLoading.value = false;
    }
  }
}
