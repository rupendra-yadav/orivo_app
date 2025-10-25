import 'dart:developer';

import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/energy_consumption_detail.dart';
import 'package:auro/features/device_details/view/device_detail_screens/model/base_matric_model.dart';
import 'package:auro/features/device_details/view/device_detail_screens/model/cost_estimate_details_model.dart';
import 'package:auro/features/device_details/view/device_detail_screens/model/demand_analysis_respponse.dart';
import 'package:auro/features/device_details/view/device_detail_screens/model/demand_detail_model.dart';
import 'package:auro/features/device_details/view/device_detail_screens/model/demand_model.dart';
import 'package:auro/features/device_details/view/device_detail_screens/model/energy_consumption_detail.dart';
import 'package:auro/features/device_details/view/device_detail_screens/model/graph_data_model_api.dart';
import 'package:auro/utils/popups/loaders.dart';
import 'package:auro/utils/preferences/cache_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../../data/repository/device_repository.dart';
import '../../../../navigation/view/bottom_nav_screen/model/device_list_model.dart';
import '../model/base_metric_response_model.dart';
import '../model/consumption_detail_model.dart';
import '../model/cost_estimate_detail_model.dart';
import '../model/cost_estimate_model.dart';
import '../model/curent_detail_modle.dart';
import '../model/dart_items.dart';
import '../model/energy_consumption_model.dart';
import '../model/frequency_detail_model.dart';
import '../model/historical_data_response_model.dart';
import '../model/history_field_modle.dart';
import '../model/history_model.dart';
import '../model/pf_detail_modle.dart';
import '../model/pf_model.dart';
import '../model/power_factor_model.dart';
import '../model/voltage_detail_model.dart';

class DeviceDetailController extends GetxController {
  static DeviceDetailController get instance => Get.find();

  final _deviceReposotory = Get.put(DeviceRepository());

  final deviceName = TextEditingController();

  RxList<DeviceListModel> deviceList = <DeviceListModel>[].obs;
  RxList<DataItems> dataIts = <DataItems>[].obs;

  RxList<GraphData> graphDataList = <GraphData>[].obs;
  Rx<EnergyConsumptionModel> energyConsumptionData =
      EnergyConsumptionModel().obs;

  Rx<ConsumptionDetail> consumptionDetails = ConsumptionDetail().obs;
  Rx<DemandModel> demandModel = DemandModel().obs;

  Rx<DemandDetailModel> demandDetailModel = DemandDetailModel().obs;
  Rx<PfModel> powerFactorModel = PfModel().obs;

  Rx<CostEstimateModel> costEstimateModel = CostEstimateModel().obs;
  Rx<CostEstimateDetailModel> costEstimateDetailsModel =
      CostEstimateDetailModel().obs;

  Rx<FrequencyDetailsModel> frequencyDetailsModel = FrequencyDetailsModel().obs;
  Rx<VoltageDetailModel> voltageDetailsModel = VoltageDetailModel().obs;

  Rx<CurrentDetailModel> currentDetailsModel = CurrentDetailModel().obs;
  Rx<BaseMatricModel> baseMetricModel = BaseMatricModel().obs;
  Rx<PfDetailModel> pfDetailModel = PfDetailModel().obs;

  Rx<HistoryFieldModel> historyFieldModel = HistoryFieldModel().obs;

  Rx<HistoryModel> historyModel = HistoryModel().obs;
  Rx<HistoryModel> historyModel1 = HistoryModel().obs;
  Rx<HistoryModel> historyModel2 = HistoryModel().obs;
  Rx<HistoryModel> historyModel3 = HistoryModel().obs;

  ///changes
  Rx<DeviceDetailData> homeScreen = DeviceDetailData().obs;

  String name1 = "";
  String name2 = "";
  String name3 = "";

  late DeviceListModel deviceListModel;
  late GraphData graphDataModel;

  final isDeviceDetailLoading = false.obs;
  final isDeviceDataItemsLoading = false.obs;

  final isDeviceGraphDataLoading = false.obs;
  final isEnergyConsumptionLoading = false.obs;

  final isEnergyConsumptionDetailLoading = false.obs;
  final isDemandLoading = false.obs;

  final isDemandDetailLoading = false.obs;
  final isPowerFactorLoading = false.obs;

  final isCostEstimateLoading = false.obs;
  final isCostEstimateDetailLoading = false.obs;

  final isFrequencyDetailLoading = false.obs;
  final isVoltageDetailLoading = false.obs;

  final isCurrentDetailLoading = false.obs;
  final isBaseMetricLoading = false.obs;

  final isPfDetailsLoading = false.obs;

  final isHistoryFieldLoading = false.obs;
  final isHistoryLoading = false.obs;

  final isUpdateDeviceNameLoading = false.obs;

  ///Device Detail Data
  Future<void> getDeviceDetail(String deviceId, String startDate,
      String startDatePrep, String totalLoad) async {
    try {
      isDeviceDetailLoading.value = true;

      // final deviceLis = await _deviceReposotory.getDeviceDetail(deviceId);

      // log("My message "+ deviceLis.toString());

      // final DeviceDetailData data =
      // await _deviceReposotory.getDeviceDetail(deviceId);
      // log("My Message" + data.toString());
      // homeScreen.value = data;

      // deviceList.assignAll(deviceLis);

      // SharedPrefs.setString("deviceId",deviceList[0].userDeviceId);

      deviceListModel = deviceList[0];

      // getEnergyConsumption(startDatePrep, deviceListModel.userDeviceId,startDate);

      // getCostEstimate(startDatePrep, deviceListModel.userDeviceId, startDate,totalLoad);

      // getDemand(startDatePrep, deviceListModel.userDeviceId, startDate);

      // getTotalPowerFactors(startDatePrep, deviceListModel.userDeviceId, startDate);

      // getBaseMetric(startDatePrep, deviceListModel.userDeviceId, startDate);
    } catch (e) {
      if (kDebugMode) {
        print("Error in deviceController/getDeviceDetail" + e.toString());
      }
    } finally {
      isDeviceDetailLoading.value = false;
    }
  }

  ///--------Device Data Items
  /* Future<void> getDeviceDataItems() async {
    try {
      isDeviceDataItemsLoading.value = true;

      final dataItems = await _deviceReposotory.getDataItems();

      dataIts.assignAll(dataItems);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      isDeviceDataItemsLoading.value = false;
    }
  }*/

  ///--------Device Graph Data
  Future<void> getDeviceGraphData(
      String fieldName, deviceId, rangeValue) async {
    try {
      isDeviceGraphDataLoading.value = true;

      //final graph = await _deviceReposotory.getGraphData(fieldName, deviceId, rangeValue);

      //graphDataList.assignAll(graph);
      graphDataModel = graphDataList[0];
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      isDeviceGraphDataLoading.value = false;
    }
  }

  ///--------Device Energy Consumption
  // Future<void> getEnergyConsumption(
  //     String date, deviceId, String endDate) async {
  //   try {
  //     isEnergyConsumptionLoading.value = true;

  //     // final Map<String, dynamic> data =
  //     //     // await _deviceReposotory.getEnergyConsumption(date, deviceId, endDate);
  //     //     await _deviceReposotory.getEnergyConsumption();
  //     // Assign the object to the Rx variable
  //     // energyConsumptionData.value = EnergyConsumptionModel.fromJson(responsee);
  //   } catch (e) {
  //     print("dataSetModel");
  //     print(e.toString());
  //   } finally {
  //     isEnergyConsumptionLoading.value = false;
  //   }
  // }

  ///--------Device Energy Details Consumption
  Future<void> getEnergyDetailsConsumption(
      String date, deviceId, String stop) async {
    try {
      isEnergyConsumptionDetailLoading.value = true;

      final Map<String, dynamic> responsee = await _deviceReposotory
          .getEnergyDetailConsumption(date, deviceId, stop);
      // Assign the object to the Rx variable
      consumptionDetails.value = ConsumptionDetail.fromJson(responsee);
    } catch (e) {
      print("dataSetModel");
      print(e.toString());
    } finally {
      isEnergyConsumptionDetailLoading.value = false;
    }
  }

  ///--------Device Demand
  Future<void> getDemand(String date, deviceId, String stop) async {
    try {
      isDemandLoading.value = true;

      final Map<String, dynamic> responsee =
          await _deviceReposotory.getDemand(date, deviceId, stop);
      // Assign the object to the Rx variable
      demandModel.value = DemandModel.fromJson(responsee);
    } catch (e) {
      print("dataSetModel");
      print(e.toString());
    } finally {
      isDemandLoading.value = false;
    }
  }

  ///--------Device Demand Detail
  Future<void> getDemandDetail(String date, deviceId, String stop) async {
    try {
      isDemandDetailLoading.value = true;

      final Map<String, dynamic> responsee =
          await _deviceReposotory.getDemandDetails(date, deviceId, stop);
      // Assign the object to the Rx variable
      demandDetailModel.value = DemandDetailModel.fromJson(responsee);
    } catch (e) {
      print("DemanddataSetModel");
      print(e.toString());
    } finally {
      isDemandDetailLoading.value = false;
    }
  }

  ///--------Total Power Factors
  Future<void> getTotalPowerFactors(
      String date, deviceId, String endDate) async {
    try {
      isPowerFactorLoading.value = true;

      final Map<String, dynamic> responsee =
          await _deviceReposotory.getTotalPowerFactors(date, deviceId, endDate);
      // Assign the object to the Rx variable
      powerFactorModel.value = PfModel.fromJson(responsee);
    } catch (e) {
      print("Power_dataSetModel");
      print(e.toString());
    } finally {
      isPowerFactorLoading.value = false;
    }
  }

  ///--------Cost Estimate
  Future<void> getCostEstimate(
      String date, deviceId, String endDate, String totalLoad) async {
    try {
      isCostEstimateLoading.value = true;

      final Map<String, dynamic> responsee = await _deviceReposotory
          .getCostEstimate(date, deviceId, endDate, totalLoad);
      // Assign the object to the Rx variable
      costEstimateModel.value = CostEstimateModel.fromJson(responsee);
    } catch (e) {
      print("costEstimate SetModel");
      print(e.toString());
    } finally {
      isCostEstimateLoading.value = false;
    }
  }

  ///--------Cost Estimate Details
  Future<void> getCostEstimateDetails(
      String date, deviceId, String endDate, String totalLoad) async {
    try {
      isCostEstimateDetailLoading.value = true;

      final Map<String, dynamic> responsee = await _deviceReposotory
          .getCostEstimateDetails(date, deviceId, endDate, totalLoad);
      // Assign the object to the Rx variable
      costEstimateDetailsModel.value =
          CostEstimateDetailModel.fromJson(responsee);
    } catch (e) {
      print("cost Estimate SetModel");
      print(e.toString());
    } finally {
      isCostEstimateDetailLoading.value = false;
    }
  }

  ///-------- frequency Details
  Future<void> getFrequencyDetails(
      String date, deviceId, String endDate) async {
    try {
      isFrequencyDetailLoading.value = true;

      final Map<String, dynamic> responsee =
          await _deviceReposotory.frequencyDetails(date, deviceId, endDate);
      frequencyDetailsModel.value = FrequencyDetailsModel.fromJson(responsee);
    } catch (e) {
      print("frequencyDetails catch");
      print(e.toString());
    } finally {
      isFrequencyDetailLoading.value = false;
    }
  }

  ///-------- Voltage Details
  Future<void> getVoltageDetails(String date, deviceId, String endDate) async {
    try {
      isVoltageDetailLoading.value = true;

      final Map<String, dynamic> responsee =
          await _deviceReposotory.voltageDetails(date, deviceId, endDate);
      voltageDetailsModel.value = VoltageDetailModel.fromJson(responsee);
    } catch (e) {
      print("Voltage Details catch");
      print(e.toString());
    } finally {
      isVoltageDetailLoading.value = false;
    }
  }

  ///-------- Current Details
  Future<void> getCurrentDetails(String date, deviceId, String endDate) async {
    try {
      isCurrentDetailLoading.value = true;

      final Map<String, dynamic> responsee =
          await _deviceReposotory.currentDetails(date, deviceId, endDate);
      currentDetailsModel.value = CurrentDetailModel.fromJson(responsee);
    } catch (e) {
      print("CurrentDetails catch");
      print(e.toString());
    } finally {
      isCurrentDetailLoading.value = false;
    }
  }

  ///-------- Base Metric
  Future<void> getBaseMetric(String date, deviceId, String endDate) async {
    try {
      isBaseMetricLoading.value = true;

      final Map<String, dynamic> responsee =
          await _deviceReposotory.baseMetric(date, deviceId, endDate);
      baseMetricModel.value = BaseMatricModel.fromJson(responsee);
    } catch (e) {
      print("baseMetric catch");
      print(e.toString());
    } finally {
      isBaseMetricLoading.value = false;
    }
  }

  ///-------- pf Details
  Future<void> getPfDetails(String date, deviceId, String endDate) async {
    try {
      isPfDetailsLoading.value = true;

      final Map<String, dynamic> responsee =
          await _deviceReposotory.pfDetail(date, deviceId, endDate);
      pfDetailModel.value = PfDetailModel.fromJson(responsee);
    } catch (e) {
      print("pfDetails catch");
      print(e.toString());
    } finally {
      isPfDetailsLoading.value = false;
    }
  }

  ///-------- History Fields
  Future<void> getHistoryFields(String startDate) async {
    try {
      isHistoryFieldLoading.value = true;

      final Map<String, dynamic> responsee =
          await _deviceReposotory.getHistoryFields();
      // Assign the object to the Rx variable
      historyFieldModel.value = HistoryFieldModel.fromJson(responsee);

      // getHistory(historyFieldModel.value.filters![0].name!,"", "", deviceListModel.userDeviceId, historyFieldModel.value.filters![0].id!, "-1h", 1);
    } catch (e) {
      if (kDebugMode) {
        print("historyFields SetModel");
        print(e.toString());
      }
    } finally {
      isHistoryFieldLoading.value = false;
    }
  }

  ///-------- History
  Future<void> getHistory(String name, String startDate, String endDate,
      String deviceId, String fieldName, String duration, int indexPos) async {
    try {
      isHistoryLoading.value = true;

      final Map<String, dynamic> responsee = await _deviceReposotory.getHistory(
          startDate, deviceId, endDate, fieldName, duration);

      // Assign the object to the Rx variable
      //historyModel.value = HistoryModel.fromJson(responsee);

      if (kDebugMode) {
        print("indexPosTest");
        print(indexPos);
      }
      if (indexPos == 4) {
        indexPos = 1;
      }

      switch (indexPos) {
        case 1:
          historyModel.value = HistoryModel.fromJson(responsee);
          name1 = name;
          break;
        case 2:
          historyModel1.value = HistoryModel.fromJson(responsee);
          name2 = name;
          break;
        case 3:
          historyModel2.value = HistoryModel.fromJson(responsee);
          name3 = name;
          break;
        case 4:
          historyModel3.value = HistoryModel.fromJson(responsee);
          break;
        default:
        // Handle any other cases if needed
      }
    } catch (e) {
      if (kDebugMode) {
        print("historyGraph SetModel");
        print(e.toString());
      }
    } finally {
      isHistoryLoading.value = false;
    }
  }

  ///--------Update Device Name
  Future<void> updateDeviceName(String deviceId) async {
    try {
      isUpdateDeviceNameLoading.value = true;

      final Map<String, dynamic> responsee = await _deviceReposotory
          .updateDeviceName(deviceId, deviceName.text.toString().trim());
      // Assign the object to the Rx variable
      // demandDetailModel.value = DemandDetailModel.fromJson(responsee);

      TLoaders.successSnackBar(
          title: "Device Name Changed",
          message: "Device Name Changed Successfully...!");
    } catch (e) {
      print(e.toString());
    } finally {
      isUpdateDeviceNameLoading.value = false;
    }
  }
}

class DeviceDetailedController extends GetxController {
  final DeviceRepository repository = Get.put(DeviceRepository());

  DeviceDetailedController();

  // Observable for device detail data
  var deviceDetailData = Rxn<DeviceDetailData>();
  var energyConsumptionData = Rxn<EnergyConsumptionData>();
  var costEstimateData = Rxn<CostEstimateData>();
  var demandAnalysisData = Rxn<DemandData>();
  var baseMetricData = Rxn<MetricData>();
  var historyFieldsData = Rxn<HistoryFieldModel>();
  var historicalData = Rxn<HistoricalData>();

  ///graph data
  // Rx<HistoricalData> historyModel = HistoricalData().obs;
  Rx<HistoricalData> historyModel1 = HistoricalData().obs;
  Rx<HistoricalData> historyModel2 = HistoricalData().obs;
  Rx<HistoricalData> historyModel3 = HistoricalData().obs;

  String name1 = "";
  String name2 = "";
  String name3 = "";

  // Loading and error states
  var isLoading = false.obs;
  var errorMessage = "".obs;

  ///LOADING
  var isDeviceDetailLoading = false.obs;
  var isEnergyConsumptionDetailLoading = false.obs;
  var isDemandDetailLoading = false.obs;
  var isCostEstimateDetailLoading = false.obs;
  var isBaseMetricLoading = false.obs;
  var isHistoryFieldLoading = false.obs;
  var isHistoryLoading = false.obs;

  // Fetch device detail method
  Future<void> fetchDeviceDetail(
      String deviceId, String start, String stop) async {
    try {
      isDeviceDetailLoading.value = true;
      errorMessage.value = "";

      final data =
          await repository.getDeviceDetail(deviceId, "HV4", start, stop);
      log("repo level" + data.toString());
      deviceDetailData.value = data;
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print('Error fetching device detail: $e');
        print(stacktrace);
      }
      errorMessage.value = e.toString();
      deviceDetailData.value = null;
    } finally {
      isDeviceDetailLoading.value = false;
    }
  }

  // Method: Fetch energy consumption detail
  Future<void> fetchEnergyConsumptionDetail(
      String deviceId, String start, String end) async {
    try {
      isEnergyConsumptionDetailLoading.value = true;
      errorMessage.value = "";

      final data =
          await repository.getEnergyConsumption(deviceId, "HV4", start, end);
      log("Energy consumption repo level: ${data.toJson()}");
      energyConsumptionData.value = data;
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print('Error fetching energy consumption detail: $e');
        print(stacktrace);
      }
      errorMessage.value = e.toString();
      energyConsumptionData.value = null;
    } finally {
      isEnergyConsumptionDetailLoading.value = false;
    }
  }

// Method: Fetch Cost estimate detail
  Future<void> fetchCostEstimateDetail(
      String deviceId, String start, String end) async {
    try {
      isCostEstimateDetailLoading.value = true;
      errorMessage.value = "";

      final data =
          await repository.fetchCostEstimate(deviceId, "HV4", start, end);
      log("Energy consumption repo level: ${data.toJson()}");
      costEstimateData.value = data;
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print('Error fetching energy consumption detail: $e');
        print(stacktrace);
      }
      errorMessage.value = e.toString();
      costEstimateData.value = null;
    } finally {
      isCostEstimateDetailLoading.value = false;
    }
  }

  // Method: Fetch Demand Analysis  detail
  Future<void> fetchDemandAnalysis(String start, String end) async {
    try {
      isDemandDetailLoading.value = true;
      errorMessage.value = "";

      final data = await repository.fetchDemandAnalysis(
          "O/EMS/2025/07/0001", "HV4", start, end);
      log("Demand Analysis repo level: ${data.toJson()}");
      demandAnalysisData.value = data;
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print('Error fetching Demand Analysis detail: $e');
        print(stacktrace);
      }
      errorMessage.value = e.toString();
      demandAnalysisData.value = null;
    } finally {
      isDemandDetailLoading.value = false;
    }
  }

  // Method: Fetch BASE_METRIC  detail
  Future<void> fetchBaseMeric(String start, String end) async {
    try {
      isBaseMetricLoading.value = true;
      errorMessage.value = "";

      final data = await repository.fetchBaseMetric(
          "O/EMS/2025/07/0001", "HV4", start, end);
      log("Base Metric repo level: ${data.toJson()}");
      baseMetricData.value = data;
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print('Error fetching Demand Analysis detail: $e');
        print(stacktrace);
      }
      errorMessage.value = e.toString();
      baseMetricData.value = null;
    } finally {
      isBaseMetricLoading.value = false;
    }
  }

  // Method: Fetch History_fields  detail
  Future<void> fetchHistoryFields() async {
    try {
      isHistoryFieldLoading.value = true;
      errorMessage.value = "";

      final data = await repository.fetchHistoryFields();
      log("Base Metric repo level: ${data.toJson()}");
      historyFieldsData.value = data;
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print('Error fetching Demand Analysis detail: $e');
        print(stacktrace);
      }
      errorMessage.value = e.toString();
      historyFieldsData.value = null;
    } finally {
      isHistoryFieldLoading.value = false;
    }
  }

  // Method: Fetch History  detail
  Future<void> fetchHistory(String name, String startDate, String endDate,
      String deviceId, String fieldName, String duration, int indexPos) async {
    try {
      isHistoryLoading.value = true;
      errorMessage.value = "";

      final data = await repository.fetchHistory(
          deviceId, startDate, endDate, fieldName, duration);
      log("Historical Data repo level: ${data.toString()}");
      historicalData.value = data;

      if (kDebugMode) {
        print("indexPosTest");
        print(indexPos);
      }
      if (indexPos == 4) {
        indexPos = 1;
      }

      switch (indexPos) {
        case 1:
          historicalData.value = data;
          name1 = name;
          break;
        case 2:
          historyModel1.value = data;
          name2 = name;
          break;
        case 3:
          historyModel2.value = data;
          name3 = name;
          break;
        case 4:
          historyModel3.value = data;
          break;
        default:
        // Handle any other cases if needed
      }
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print('Error fetching Demand Analysis detail: $e');
        print(stacktrace);
      }
      errorMessage.value = e.toString();
      historicalData.value = null;
    } finally {
      isHistoryLoading.value = false;
    }
  }
}
