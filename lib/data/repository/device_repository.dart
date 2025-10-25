import 'dart:developer';

import 'package:auro/data/http/http_client.dart';
import 'package:auro/data/http/http_client2.dart';
import 'package:auro/features/device_details/view/device_detail_screens/model/cost_estimate_details_model.dart';
import 'package:auro/features/device_details/view/device_detail_screens/model/energy_consumption_detail.dart';
import 'package:auro/features/device_details/view/device_detail_screens/model/history_field_modle.dart';
import 'package:auro/features/navigation/view/bottom_nav_screen/model/device_list_model.dart';
import 'package:auro/utils/constant/api_constants.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/preferences/cache_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../features/device_details/view/device_detail_screens/model/base_metric_response_model.dart';
import '../../features/device_details/view/device_detail_screens/model/demand_analysis_respponse.dart';
import '../../features/device_details/view/device_detail_screens/model/graph_data_model_api.dart';
import '../../features/device_details/view/device_detail_screens/model/historical_data_response_model.dart';
import '../http/http_client3.dart';

class DeviceRepository extends GetxController {
  static DeviceRepository get instance => Get.find();

  ///Device List
  Future<List<DeviceListModel>> getDeviceList(String userId) async {
    try {
      Map<String, dynamic> request = {"user_id": userId};

      Map<String, dynamic> response =
          await THttpHelper.post(APIKeys.machineEND, request);

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

  ///Device List Gen2
  Future<List<DeviceListModel>> getDeviceList2(
      String mobile, String accessToken) async {
    try {
      Map<String, dynamic> request = {"mobile_no": "+91$mobile"};

      Map<String, dynamic> response = await THttpHelper3.postRaw(
          APIKeys.userDevices, null, request,
          accessToken: accessToken);

      if (response['response'] == 200) {
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
  // Future<List<DeviceListModel>> getDeviceDetail(String deviceId) async {
  //   try {
  //     Map<String, dynamic> request = {"device_id": "O/EMS/2025/07/0001",
  //   "tariff_plan": "HV4",
  //   "start": "2025-08-12 00:00:00",
  //   "stop": "2025-08-13 00:00:00"};

  //     Map<String, dynamic> response =
  //         await THttpHelper3.postRaw(APIKeys.homeScreen, null, request, accessToken: SharedPrefs.getString(TTexts.prefAccessToken)??"");

  //       log('machine_details  Response: $response');
  //     if (kDebugMode) {
  //       print('machine_details  Response: $response');
  //     }

  //     if (response['status'] == 'success') {
  //       // List<dynamic> deviceListData = response['data'];

  //       List<DeviceListModel> deviceList = deviceData
  //           .map((data) => DeviceListModel.fromJson(data))
  //           .toList();

  //       // return deviceList;
  //     } else {
  //       throw Exception(response['message']);
  //     }
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  /*///Device List
  Future<List<DataItems>> getDataItems() async {
    try {
      Map<String, dynamic> request = {};

      Map<String, dynamic> response =
          await THttpHelper.post(APIKeys.machineDetailsDataItemsEND, request);

      if (kDebugMode) {
        print('readflux.php  Response: $response');
      }

      if (response['response'] == 'success') {
        List<dynamic> deviceListData = response['data'];

        List<DataItems> deviceList =
            deviceListData.map((data) => DataItems.fromJson(data)).toList();

        return deviceList;
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }*/

  ///Device Graph data
  Future<List<GraphData>> getGraphData(String field, deviceId, range) async {
    try {
      Map<String, dynamic> request = {
        "field": field,
        "deviceid": deviceId,
        "range": range
      };

      Map<String, dynamic> response =
          await THttpHelper.post(APIKeys.machineDetailsGraphDataEND, request);

      if (kDebugMode) {
        print('readfieldwisedata.php  Response: $response');
      }

      if (response['response'] == 'success') {
        List<dynamic> deviceGraphDa = response['data'];

        List<GraphData> deviceGraphData =
            deviceGraphDa.map((data) => GraphData.fromJson(data)).toList();

        return deviceGraphData;
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  ////////////////////////////////////NEW APIS//////////////////////////////////////
  ///
  Future<DeviceDetailData> getDeviceDetail(
      String deviceId, String tariff, String start, String stop) async {
    try {
      Map<String, dynamic> request = {
        "device_id": deviceId,
        "tariff_plan": tariff,
        "start": start,
        "stop": stop
      };

      Map<String, dynamic> response = await THttpHelper3.postRaw(
        APIKeys.homeScreen,
        null,
        request,
        accessToken: SharedPrefs.getString(TTexts.prefAccessToken) ?? "",
      );
      log('machine_details Response: $response');

      if (response['status'] == 'success') {
        Map<String, dynamic> deviceData = response['data'];
        // log('device data Response: $deviceData');
        return DeviceDetailData.fromJson(deviceData);
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      throw Exception('Failed to fetch device detail: $e');
    }
  }

  ///Energy Consumption
  Future<EnergyConsumptionData> getEnergyConsumption(
      String deviceId, String tariff, String start, String end) async {
    try {
      Map<String, dynamic> request = {
        "device_id": "X2024103",
        "tariff_plan": tariff,
        "start": start,
        "stop": end
      };

      if (kDebugMode) {
        print("CheckRequest");
        print(request);
      }

      final response = await THttpHelper3.postRaw(
          APIKeys.energyConsumptionDetails, null, request);

      if (kDebugMode) {
        print(response);
      }
      if (kDebugMode) {
        print('energy-consumption  Response: $response');
      }

      if (response['status'] == 'success') {
        //List<dynamic> deviceGraphDa = response['data'];

        // Map<String, dynamic> deviceGraphData = response['data'];

        // return response["data"];
        return EnergyConsumptionData.fromJson(response['data']);
      } else {
        print("error On status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("error Try  Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  ///Cost Estimate
  Future<CostEstimateData> fetchCostEstimate(
      String deviceId, String tariff, String start, String end) async {
    try {
      Map<String, dynamic> request = {
        "device_id": "X2024103",
        "tariff_plan": tariff,
        "start": start,
        "stop": end
      };

      if (kDebugMode) {
        print("CheckRequest");
        print(request);
      }

      final response =
          await THttpHelper3.postRaw(APIKeys.costEstimate, null, request);

      if (kDebugMode) {
        print(response);
      }
      if (kDebugMode) {
        print('energy-consumption  Response: $response');
      }

      if (response['status'] == 'success') {
        //List<dynamic> deviceGraphDa = response['data'];

        // Map<String, dynamic> deviceGraphData = response['data'];

        // return response["data"];
        return CostEstimateData.fromJson(response['data']);
      } else {
        print("error On status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("error Try  Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  ///DEMAND ANALYSIS
  Future<DemandData> fetchDemandAnalysis(
      String deviceId, String tariff, String start, String end) async {
    try {
      Map<String, dynamic> request = {
        "device_id": "X2024103",
        "tariff_plan": tariff,
        "start": start,
        "stop": end
      };

      if (kDebugMode) {
        print("CheckRequest");
        print(request);
      }

      final response =
          await THttpHelper3.postRaw(APIKeys.demandAnalysis, null, request);

      if (kDebugMode) {
        print(response);
      }
      if (kDebugMode) {
        print('Demand_analysis  Response: $response');
      }

      if (response['status'] == 'success') {
        //List<dynamic> deviceGraphDa = response['data'];

        // Map<String, dynamic> deviceGraphData = response['data'];

        // return response["data"];
        return DemandData.fromJson(response['data']);
      } else {
        print("error On status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("error Try  Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  /// BASE METRIC
  Future<MetricData> fetchBaseMetric(
      String deviceId, String tariff, String start, String end) async {
    try {
      Map<String, dynamic> request = {
        "device_id": "X2024103",
        "tariff_plan": tariff,
        "start": start,
        "stop": end
      };

      if (kDebugMode) {
        print("CheckRequest");
        print(request);
      }

      final response =
          await THttpHelper3.postRaw(APIKeys.baseMetric, null, request);

      if (kDebugMode) {
        print(response);
      }
      if (kDebugMode) {
        print('Base_metric  Response: $response');
      }

      if (response['status'] == 'success') {
        //List<dynamic> deviceGraphDa = response['data'];

        // Map<String, dynamic> deviceGraphData = response['data'];

        // return response["data"];
        return MetricData.fromJson(response['data']);
      } else {
        print("error On status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("error Try  Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  /// HIsTORY FIELDS
  Future<HistoryFieldModel> fetchHistoryFields(
      // String date, String deviceId, String stop
      ) async {
    try {
      if (kDebugMode) {
        print("CheckRequest");
        // print(request);
      }

      final response = await THttpHelper3.get(
        APIKeys.historyFields,
      );

      if (kDebugMode) {
        print(response);
      }
      if (kDebugMode) {
        print('History_fields  Response: $response');
      }

      if (response['status'] == 'success') {
        //List<dynamic> deviceGraphDa = response['data'];

        // Map<String, dynamic> deviceGraphData = response['data'];

        // return response["data"];
        return HistoryFieldModel.fromJson(response['data']);
      } else {
        print("error On status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("error Try  Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  /// HISTORY GRAPH
  Future<HistoricalData> fetchHistory(String deviceId, String start,
      String stop, String fieldName, String duration) async {
    try {
      Map<String, dynamic> request = {
        "device_id": deviceId,
        "field_name": fieldName,
        "start": start,
        "stop": stop,
        "duration": duration
      };

      if (kDebugMode) {
        print("CheckRequest");
        print(request);
      }

      final response =
          await THttpHelper3.postRaw(APIKeys.history, null, request);

      if (kDebugMode) {
        print(response);
      }
      if (kDebugMode) {
        print('Base_metric  Response: $response');
      }

      if (response['status'] == 'success') {
        //List<dynamic> deviceGraphDa = response['data'];

        // Map<String, dynamic> deviceGraphData = response['data'];

        // return response["data"];
        return HistoricalData.fromJson(response['data']);
      } else {
        print("error On status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("error Try  Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  /// Edit Device Details
  Future<String> editDeviceDetails(DeviceListModel device) async {
    try {
      Map<String, dynamic> request = {
        "user_device_id": device.userDeviceId,
        "device_name": device.name,
        "device_description": device.description,
      };

      if (kDebugMode) {
        print("CheckRequest");
        print(request);
      }

      final response = await THttpHelper3.postRaw(
          APIKeys.editDeviceDetails, null, request,
          accessToken: SharedPrefs.getString(TTexts.prefAccessToken) ?? "");

      if (kDebugMode) {
        print(response);
      }
      if (kDebugMode) {
        print('Edit Device Detail  Response: $response');
      }

      if (response['response'] == 200) {
        //List<dynamic> deviceGraphDa = response['data'];

        // Map<String, dynamic> deviceGraphData = response['data'];

        return response["message"];
        // return DeviceListModel.fromJson(response['']);
      } else {
        print("error On status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("error Try  Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  ////////////////////////////////////NEW APIS END//////////////////////////////////////

  ///Energy Detail Consumption
  Future<Map<String, dynamic>> getEnergyDetailConsumption(
      String date, String deviceId, String stop) async {
    try {
      Map<String, dynamic> request = {
        "device_id": deviceId,
        "start": date,
        "stop": stop,
      };

      print("CheckRequest");
      print(request);
      final response = await THttpHelper2.redirectPost(
        APIKeys.energyConsumptionDetails,
        request,
      );

      print(response);
      if (kDebugMode) {
        print('energy-consumption_details  Response: $response');
      }

      if (response['status'] == 'success') {
        return response["data"];
      } else {
        print("error On status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("error Try  Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  /// Demand
  Future<Map<String, dynamic>> getDemand(
      String date, String deviceId, String stop) async {
    try {
      Map<String, dynamic> request = {
        "device_id": deviceId,
        "start": date,
        "stop": stop,
      };

      print("CheckRequest");
      print(request);
      final response = await THttpHelper2.redirectPost(
        APIKeys2.demand,
        request,
      );

      print(response);
      if (kDebugMode) {
        print('demand  Response: $response');
      }

      if (response['status'] == 'success') {
        return response["data"];
      } else {
        print("error On status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("error Try  Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  /// Demand Details
  Future<Map<String, dynamic>> getDemandDetails(
      String date, String deviceId, String stop) async {
    try {
      Map<String, dynamic> request = {
        "device_id": deviceId,
        "start": date,
        "stop": stop,
      };

      print("CheckRequest");
      print(request);
      final response = await THttpHelper2.redirectPost(
        APIKeys2.demandDetail,
        request,
      );

      print(response);
      if (kDebugMode) {
        print('demandDetails  Response: $response');
      }

      if (response['status'] == 'success') {
        return response["data"];
      } else {
        print("error On status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("error Try  Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  /// Total Power Factors
  Future<Map<String, dynamic>> getTotalPowerFactors(
      String date, String deviceId, String stop) async {
    try {
      Map<String, dynamic> request = {
        "device_id": deviceId,
        "start": date,
        "stop": stop,
      };

      print("CheckRequest");
      print(request);
      final response = await THttpHelper2.redirectPost(
        APIKeys2.pf,
        request,
      );

      print(response);
      if (kDebugMode) {
        print('powerFactors  Response: $response');
      }

      if (response['status'] == 'success') {
        return response["data"];
      } else {
        print("error On status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("error Try  Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  /// Cost Estimate
  Future<Map<String, dynamic>> getCostEstimate(
      String date, String deviceId, String stop, String totalLoad) async {
    try {
      Map<String, dynamic> request = {
        "device_id": deviceId,
        "start": date,
        "stop": stop,
        "contact_demand": totalLoad,
      };

      if (kDebugMode) {
        print("CheckRequest");
        print(request);
      }

      final response = await THttpHelper2.redirectPost(
        APIKeys.costEstimate,
        request,
      );

      if (kDebugMode) {
        print(response);
      }
      if (kDebugMode) {
        print('coat Estimate  Response: $response');
      }

      if (response['status'] == 'success') {
        return response["data"];
      } else {
        if (kDebugMode) {
          print("error On status");
        }
        throw Exception(response['message']);
      }
    } catch (e) {
      if (kDebugMode) {
        print("error Try  Catch");
        print(e.toString());
      }

      throw Exception(e.toString());
    }
  }

  /// History Fields
  Future<Map<String, dynamic>> getHistoryFields() async {
    try {
      // Build query parameters
      Map<String, dynamic> queryParams = {};

      if (kDebugMode) {
        print("CheckRequest Query Params:");
        print(queryParams);
      }

      // Send the GET request with the query parameters
      final response = await THttpHelper2.get(
        APIKeys2.historyFields,
        queryParams: queryParams,
      );

      if (kDebugMode) {
        print('History Fields Response: $response');
      }

      if (response['status'] == 'success') {
        return response["data"];
      } else {
        print("Error in status response");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("Error in Try-Catch block");
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  /// History Graph
  Future<Map<String, dynamic>> getHistory(String date, String deviceId,
      String stop, String fieldName, String duration) async {
    try {
      Map<String, dynamic> request = {
        "device_id": deviceId,
        "field_name": fieldName,
        "start": date,
        "stop": stop,
        "duration": duration,
      };

      if (kDebugMode) {
        print("CheckRequest");
        print(request);
      }

      final response =
          await THttpHelper2.redirectPost(APIKeys2.history, request);

      if (kDebugMode) {
        print(response);
        print('history  Response: $response');
      }

      if (response['status'] == 'success') {
        return response["data"];
      } else {
        if (kDebugMode) {
          print("Error on status");
        }
        throw Exception(response['message']);
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error in Try-Catch");
        print(e.toString());
      }

      throw Exception(e.toString());
    }
  }

  /// Cost Estimate Details
  Future<Map<String, dynamic>> getCostEstimateDetails(
      String date, String deviceId, String stop, String totalLoad) async {
    try {
      Map<String, dynamic> request = {
        "device_id": deviceId,
        "start": date,
        "stop": stop,
        "contact_demand": totalLoad,
      };

      print("CheckRequest");
      print(request);
      final response = await THttpHelper2.redirectPost(
        APIKeys2.costEstimateDetail,
        request,
      );

      print(response);
      if (kDebugMode) {
        print('coat Estimate Details Response: $response');
      }

      if (response['status'] == 'success') {
        return response["data"];
      } else {
        print("error On status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("error Try  Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  /// Frequency Details
  Future<Map<String, dynamic>> frequencyDetails(
      String date, String deviceId, String stop) async {
    try {
      Map<String, dynamic> request = {
        "device_id": deviceId,
        "start": date,
        "stop": stop,
      };

      print("CheckRequest");
      print(request);
      final response = await THttpHelper2.redirectPost(
        APIKeys2.frequencyDetails,
        request,
      );

      print(response);
      if (kDebugMode) {
        print('frequencyDetails Response: $response');
      }

      if (response['status'] == 'success') {
        return response["data"];
      } else {
        print("error On status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("error Try  Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  /// Voltage Details
  Future<Map<String, dynamic>> voltageDetails(
      String date, String deviceId, String stop) async {
    try {
      Map<String, dynamic> request = {
        "device_id": deviceId,
        "start": date,
        "stop": stop,
      };

      print("CheckRequest");
      print(request);
      final response = await THttpHelper2.redirectPost(
        APIKeys2.voltageDetails,
        request,
      );

      print(response);
      if (kDebugMode) {
        print('voltageDetails Response: $response');
      }

      if (response['status'] == 'success') {
        return response["data"];
      } else {
        print("error On status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("error Try  Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  /// Current Details
  Future<Map<String, dynamic>> currentDetails(
      String date, String deviceId, String stop) async {
    try {
      Map<String, dynamic> request = {
        "device_id": deviceId,
        "start": date,
        "stop": stop,
      };

      print("CheckRequest");
      print(request);
      final response = await THttpHelper2.redirectPost(
        APIKeys2.currentDetails,
        request,
      );

      print(response);
      if (kDebugMode) {
        print('currentDetails Response: $response');
      }

      if (response['status'] == 'success') {
        return response["data"];
      } else {
        print("error On status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("error Try  Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  /// Base Metric
  Future<Map<String, dynamic>> baseMetric(
      String date, String deviceId, String stop) async {
    try {
      Map<String, dynamic> request = {
        "device_id": deviceId,
        "start": date,
        "stop": stop,
      };

      print("CheckRequest");
      print(request);
      final response = await THttpHelper2.redirectPost(
        APIKeys2.baseMetric,
        request,
      );

      print(response);
      if (kDebugMode) {
        print('baseMetric Response: $response');
      }

      if (response['status'] == 'success') {
        return response["data"];
      } else {
        print("error On status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("error Try  Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  /// power factor Detail
  Future<Map<String, dynamic>> pfDetail(
      String date, String deviceId, String stop) async {
    try {
      Map<String, dynamic> request = {
        "device_id": deviceId,
        "start": date,
        "stop": stop,
      };

      print("CheckRequest");
      print(request);
      final response = await THttpHelper2.redirectPost(
        APIKeys2.pfDetails,
        request,
      );

      print(response);
      if (kDebugMode) {
        print('pfDetail Response: $response');
      }

      if (response['status'] == 'success') {
        return response["data"];
      } else {
        print("error On status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("error Try  Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  /// Update Device Name
  Future<Map<String, dynamic>> updateDeviceName(
      String deviceId, String name) async {
    try {
      Map<String, dynamic> request = {
        "machine_id": deviceId,
        "machine_name": name,
      };

      print("CheckRequest");
      print(request);
      final response = await THttpHelper.post(
        APIKeys.updateMachineName,
        request,
      );

      print(response);
      if (kDebugMode) {
        print('updateDeviceName  Response: $response');
      }

      if (response['status'] == 'success') {
        return response["data"];
      } else {
        print("error On status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("error Try  Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  /// Update FCM
  Future<Map<String, dynamic>> updateFCM(
      String deviceId, String fcmToken) async {
    try {
      Map<String, dynamic> request = {
        "user_id": deviceId,
        "user_fcm": fcmToken,
      };

      print("CheckRequest");
      print(request);
      final response = await THttpHelper.post(
        APIKeys.updateFcm,
        request,
      );

      print(response);
      if (kDebugMode) {
        print('updateDeviceName  Response: $response');
      }

      if (response['response'] == 'success') {
        return response["data"];
      } else {
        print("error On status");
        throw Exception(response['message']);
      }
    } catch (e) {
      print("error Try  Catch");
      print(e.toString());
      throw Exception(e.toString());
    }
  }
}
