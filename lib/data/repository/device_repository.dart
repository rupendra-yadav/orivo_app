import 'package:auro/data/http/http_client.dart';
import 'package:auro/features/navigation/view/bottom_nav_screen/model/device_list_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DeviceRepository extends GetxController {
  static DeviceRepository get instance => Get.find();

  ///Device List

  Future<List<DeviceListModel>> getDeviceList() async {
    try {

      Map<String, dynamic> request = {
      };

      Map<String, dynamic> response = await THttpHelper.post('machine', request);

      if (kDebugMode) {
        print('machine  Response: $response');
      }

      if (response['response'] == 'success') {
        List<dynamic> deviceListData = response['data'];

        List<DeviceListModel> deviceList = deviceListData
            .map((data) => DeviceListModel.fromJson(data))
            .toList();

        return deviceList;
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<DeviceListModel>> getDeviceDetail(String deviceId) async {
    try {

      Map<String, dynamic> request = {
        'machine_id':deviceId
      };

      Map<String, dynamic> response = await THttpHelper.post('machine_details', request);

      if (kDebugMode) {
        print('machine_details  Response: $response');
      }

      if (response['response'] == 'success') {
        List<dynamic> deviceListData = response['data'];

        List<DeviceListModel> deviceList = deviceListData
            .map((data) => DeviceListModel.fromJson(data))
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
