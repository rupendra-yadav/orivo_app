import 'package:auro/features/device_details/view/device_detail_screens/model/base_matric_model.dart';
import 'package:auro/features/device_details/view/device_detail_screens/model/demand_detail_model.dart';
import 'package:auro/features/device_details/view/device_detail_screens/model/demand_model.dart';
import 'package:auro/features/device_details/view/device_detail_screens/model/graph_data_model_api.dart';
import 'package:auro/utils/popups/loaders.dart';
import 'package:auro/utils/preferences/cache_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../../data/repository/device_repository.dart';
import '../../../../navigation/view/bottom_nav_screen/model/device_list_model.dart';
import '../model/consumption_detail_model.dart';
import '../model/cost_estimate_detail_model.dart';
import '../model/cost_estimate_model.dart';
import '../model/curent_detail_modle.dart';
import '../model/dart_items.dart';
import '../model/energy_consumption_model.dart';
import '../model/frequency_detail_model.dart';
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
  Rx<EnergyConsumptionModel> energyConsumptionData = EnergyConsumptionModel().obs;

  Rx<ConsumptionDetail> consumptionDetails = ConsumptionDetail().obs;
  Rx<DemandModel> demandModel = DemandModel().obs;

  Rx<DemandDetailModel> demandDetailModel = DemandDetailModel().obs;
  Rx<PfModel> powerFactorModel = PfModel().obs;

  Rx<CostEstimateModel> costEstimateModel = CostEstimateModel().obs;
  Rx<CostEstimateDetailModel> costEstimateDetailsModel = CostEstimateDetailModel().obs;

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

  String name1="";
  String name2="";
  String name3="";

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
  Future<void> getDeviceDetail(String deviceId, String startDate,String startDatePrep,String totalLoad) async {
    try {
      isDeviceDetailLoading.value = true;

      final deviceLis = await _deviceReposotory.getDeviceDetail(deviceId);

      deviceList.assignAll(deviceLis);

      SharedPrefs.setString("deviceId",deviceList[0].mMachineUniqueId);

      deviceListModel = deviceList[0];

      getEnergyConsumption(startDatePrep, deviceListModel.mMachineUniqueId,startDate);

      getCostEstimate(startDatePrep, deviceListModel.mMachineUniqueId, startDate,totalLoad);

      getDemand(startDatePrep, deviceListModel.mMachineUniqueId, startDate);

      getTotalPowerFactors(startDatePrep, deviceListModel.mMachineUniqueId, startDate);

      getBaseMetric(startDatePrep, deviceListModel.mMachineUniqueId, startDate);

    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
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
  Future<void> getDeviceGraphData(String fieldName, deviceId, rangeValue) async {
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
  Future<void> getEnergyConsumption(String date, deviceId,String endDate) async {
    try {
      isEnergyConsumptionLoading.value = true;

      final Map<String, dynamic> responsee =
          await _deviceReposotory.getEnergyConsumption(date, deviceId,endDate);
      // Assign the object to the Rx variable
      energyConsumptionData.value = EnergyConsumptionModel.fromJson(responsee);
    } catch (e) {
      print("dataSetModel");
      print(e.toString());
    } finally {
      isEnergyConsumptionLoading.value = false;
    }
  }

  ///--------Device Energy Details Consumption
  Future<void> getEnergyDetailsConsumption(String date, deviceId, String stop) async {
    try {
      isEnergyConsumptionDetailLoading.value = true;

      final Map<String, dynamic> responsee = await _deviceReposotory.getEnergyDetailConsumption(date, deviceId, stop);
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
  Future<void> getTotalPowerFactors(String date, deviceId, String endDate) async {
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
  Future<void> getCostEstimate(String date, deviceId, String endDate,String totalLoad) async {
    try {
      isCostEstimateLoading.value = true;

      final Map<String, dynamic> responsee =
          await _deviceReposotory.getCostEstimate(date, deviceId, endDate,totalLoad);
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
  Future<void> getCostEstimateDetails(String date, deviceId, String endDate,String totalLoad) async {
    try {
      isCostEstimateDetailLoading.value = true;

      final Map<String, dynamic> responsee =
      await _deviceReposotory.getCostEstimateDetails(date, deviceId, endDate,totalLoad);
      // Assign the object to the Rx variable
      costEstimateDetailsModel.value = CostEstimateDetailModel.fromJson(responsee);
    } catch (e) {
      print("cost Estimate SetModel");
      print(e.toString());
    } finally {
      isCostEstimateDetailLoading.value = false;
    }
  }

  ///-------- frequency Details
  Future<void> getFrequencyDetails(String date, deviceId, String endDate) async {
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

      getHistory(historyFieldModel.value.filters![0].name!,"", "", deviceListModel.mMachineUniqueId, historyFieldModel.value.filters![0].id!, "-1h", 1);
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
  Future<void> getHistory(String name,String startDate, String endDate, String deviceId, String fieldName, String duration, int indexPos) async {
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
      if (indexPos == 4){
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

      final Map<String, dynamic> responsee = await _deviceReposotory.updateDeviceName(deviceId, deviceName.text.toString().trim());
      // Assign the object to the Rx variable
     // demandDetailModel.value = DemandDetailModel.fromJson(responsee);

      TLoaders.successSnackBar(title: "Device Name Changed",message: "Device Name Changed Successfully...!");
    } catch (e) {
      print(e.toString());
    } finally {
      isUpdateDeviceNameLoading.value = false;
    }
  }

}

