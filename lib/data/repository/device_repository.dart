import 'package:auro/data/http/http_client.dart';
import 'package:auro/features/navigation/view/bottom_nav_screen/model/device_list_model.dart';
import 'package:auro/utils/constant/api_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../features/device_details/view/device_detail_screens/model/dart_items.dart';
import '../../features/device_details/view/device_detail_screens/model/graph_data_model_api.dart';

class DeviceRepository extends GetxController {
  static DeviceRepository get instance => Get.find();

  ///Device List
  Future<List<DeviceListModel>> getDeviceList(String userId) async {
    try {

      Map<String, dynamic> request = {
        "user_id":userId
      };

      Map<String, dynamic> response = await THttpHelper.post(APIKeys.machineEND, request);

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

  ///Device Details
  Future<List<DeviceListModel>> getDeviceDetail(String deviceId) async {
    try {

      Map<String, dynamic> request = {
        'machine_id':deviceId
      };

      Map<String, dynamic> response = await THttpHelper.post(APIKeys.machineDetailsEND, request);

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

  ///Device List
  Future<List<DataItems>> getDataItems() async {
    try {

      Map<String, dynamic> request = {};

      Map<String, dynamic> response = await THttpHelper.post(APIKeys.machineDetailsDataItemsEND, request);

      if (kDebugMode) {
        print('readflux.php  Response: $response');
      }

      if (response['response'] == 'success') {
        List<dynamic> deviceListData = response['data'];

        List<DataItems> deviceList = deviceListData
            .map((data) => DataItems.fromJson(data))
            .toList();

        return deviceList;
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  ///Device Graph data
  Future<List<GraphData>> getGraphData() async {
    try {

      Map<String, dynamic> request = {};

      Map<String, dynamic> response = await THttpHelper.post(APIKeys.machineDetailsGraphDataEND, request);

      if (kDebugMode) {
        print('readfieldwisedata.php  Response: $response');
      }

      if (response['response'] == 'success') {
        List<dynamic> deviceGraphDa = response['data'];

        List<GraphData> deviceGraphData = deviceGraphDa
            .map((data) => GraphData.fromJson(data))
            .toList();

        return deviceGraphData;
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

}
