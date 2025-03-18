import 'package:auro/features/notificaations/Model/notification_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../features/notificaations/Model/device_alert_notification_model.dart';
import '../../utils/constant/api_constants.dart';
import '../http/http_client.dart';
import '../http/http_client3.dart';

class NotificationRepository extends GetxController {
  static NotificationRepository get instance => Get.find();

  ///Notification List
  Future<List<NotificationModel>> getNotificationList(String userId) async {
    try {
      Map<String, dynamic> request = {"user_id": userId};

      Map<String, dynamic> response =
      await THttpHelper.post(APIKeys.notifications, request);

      if (kDebugMode) {
        print('machine  Response: $response');
      }

      if (response['response'] == 'success') {
        List<dynamic> deviceListData = response['data'];

        List<NotificationModel> deviceList = deviceListData
            .map((data) => NotificationModel.fromJson(data))
            .toList();

        return deviceList;
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  ///Device Alert Notification List
  Future<List<DeviceAlertNotificationModel>> getDeviceAlertNotificationList(String machineId) async {
    try {
      Map<String, dynamic> request = {"machine_id": machineId};

      Map<String, dynamic> response =
      await THttpHelper.post(APIKeys.deviceNotification, request);

      if (kDebugMode) {
        print('machine  Response: $response');
      }

      if (response['response'] == 'success') {
        List<dynamic> deviceListData = response['data'];

        List<DeviceAlertNotificationModel> deviceList = deviceListData
            .map((data) => DeviceAlertNotificationModel.fromJson(data))
            .toList();

        return deviceList;
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  //TODO////////////////////Gen 2///////////////////////////////////////////////

  ///Notification List
  Future<List<NotificationModel>> getNotificationList2(String mobile,String accessToken) async {
    try {
      Map<String, dynamic> request = {"user_id": mobile};

      Map<String, dynamic> params = {"limit": 10, "offset": 0};

      Map<String, dynamic> response =
      await THttpHelper3.postRaw(APIKeys.notifications,params, request,accessToken: accessToken);

      if (kDebugMode) {
        print('machine  Response: $response');
      }

      if (response['response'] == 'success') {
        List<dynamic> deviceListData = response['data'];

        List<NotificationModel> deviceList = deviceListData
            .map((data) => NotificationModel.fromJson(data))
            .toList();

        return deviceList;
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}