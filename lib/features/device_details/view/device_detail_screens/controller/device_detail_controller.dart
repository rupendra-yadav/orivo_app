import 'package:auro/features/device_details/view/device_detail_screens/model/demand_detail_model.dart';
import 'package:auro/features/device_details/view/device_detail_screens/model/demand_model.dart';
import 'package:auro/features/device_details/view/device_detail_screens/model/graph_data_model_api.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../../data/repository/device_repository.dart';
import '../../../../navigation/view/bottom_nav_screen/model/device_list_model.dart';
import '../model/consumption_detail_model.dart';
import '../model/cost_estimate_detail_model.dart';
import '../model/cost_estimate_model.dart';
import '../model/dart_items.dart';
import '../model/energy_consumption_model.dart';
import '../model/history_field_modle.dart';
import '../model/history_model.dart';
import '../model/pf_model.dart';
import '../model/power_factor_model.dart';

class DeviceDetailController extends GetxController {
  static DeviceDetailController get instance => Get.find();

  final _deviceReposotory = Get.put(DeviceRepository());

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

  Rx<HistoryFieldModel> historyFieldModel = HistoryFieldModel().obs;
  Rx<HistoryModel> historyModel = HistoryModel().obs;
  Rx<HistoryModel> historyModel1 = HistoryModel().obs;
  Rx<HistoryModel> historyModel2 = HistoryModel().obs;
  Rx<HistoryModel> historyModel3 = HistoryModel().obs;

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

  final isHistoryFieldLoading = false.obs;
  final isHistoryLoading = false.obs;

  ///Device Detail Data
  Future<void> getDeviceDetail(String deviceId, String startDate,String startDatePrep) async {
    try {
      isDeviceDetailLoading.value = true;

      final deviceLis = await _deviceReposotory.getDeviceDetail(deviceId);

      deviceList.assignAll(deviceLis);
      deviceListModel = deviceList[0];

      getEnergyConsumption(startDatePrep, deviceListModel.mMachineUniqueId);

      getCostEstimate(startDatePrep, deviceListModel.mMachineUniqueId, startDate);

      getDemand(startDatePrep, deviceListModel.mMachineUniqueId, startDate);

       getTotalPowerFactors(startDatePrep, deviceListModel.mMachineUniqueId, startDate);


    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      isDeviceDetailLoading.value = false;
    }
  }

  ///--------Device Data Items
  Future<void> getDeviceDataItems() async {
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
  }

  ///--------Device Graph Data
  Future<void> getDeviceGraphData(
      String fieldName, deviceId, rangeValue) async {
    try {
      isDeviceGraphDataLoading.value = true;

      final graph =
          await _deviceReposotory.getGraphData(fieldName, deviceId, rangeValue);

      graphDataList.assignAll(graph);
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
  Future<void> getEnergyConsumption(String date, deviceId) async {
    try {
      isEnergyConsumptionLoading.value = true;

      final Map<String, dynamic> responsee =
          await _deviceReposotory.getEnergyConsumption(date, deviceId);
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
  Future<void> getCostEstimate(String date, deviceId, String endDate) async {
    try {
      isCostEstimateLoading.value = true;

      final Map<String, dynamic> responsee =
          await _deviceReposotory.getCostEstimate(date, deviceId, endDate);
      // Assign the object to the Rx variable
      costEstimateModel.value = CostEstimateModel.fromJson(responsee);
    } catch (e) {
      print("cost Estimate SetModel");
      print(e.toString());
    } finally {
      isCostEstimateLoading.value = false;
    }
  }


  ///--------Cost Estimate Details
  Future<void> getCostEstimateDetails(String date, deviceId, String endDate) async {
    try {
      isCostEstimateDetailLoading.value = true;

      final Map<String, dynamic> responsee =
      await _deviceReposotory.getCostEstimateDetails(date, deviceId, endDate);
      // Assign the object to the Rx variable
      costEstimateDetailsModel.value = CostEstimateDetailModel.fromJson(responsee);
    } catch (e) {
      print("cost Estimate SetModel");
      print(e.toString());
    } finally {
      isCostEstimateDetailLoading.value = false;
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

      getHistory(startDate, "", deviceListModel.mMachineUniqueId,
          historyFieldModel.value.filters![0].id!, "-1m", 0);
    } catch (e) {
      print("historyFields SetModel");
      print(e.toString());
    } finally {
      isHistoryFieldLoading.value = false;
    }
  }

  Future<void> getHistory(String startDate, String endDate, String deviceId, String fieldName, String duration, int indexPos) async {
    try {
      isHistoryLoading.value = true;

      final Map<String, dynamic> responsee = await _deviceReposotory.getHistory(
          startDate, deviceId, endDate, fieldName, duration);

      // Assign the object to the Rx variable
      historyModel.value = HistoryModel.fromJson(responsee);


      // Use modulo to reset indexPos for values greater than 3
      int normalizedIndex = indexPos % 4;

      // TLoaders.customToast(message: normalizedIndex.toString());

      switch (normalizedIndex) {
        case 0:
          historyModel.value = HistoryModel.fromJson(responsee);
          break;
        case 1:
          historyModel1.value = HistoryModel.fromJson(responsee);
          break;
        case 2:
          historyModel2.value = HistoryModel.fromJson(responsee);
          break;
        case 3:
          historyModel3.value = HistoryModel.fromJson(responsee);
          break;
        default:
        // Handle any other cases if needed
      }
    } catch (e) {
      print("historyGraph SetModel");
      print(e.toString());
    } finally {
      isHistoryLoading.value = false;
    }
  }
}
