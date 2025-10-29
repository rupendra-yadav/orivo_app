class DeviceListModel {
  String userDeviceId;
  String publicDeviceId;
  String internalDeviceId;
  String imagePath;
  String model;
  String name;
  String description;
  String installationDate;
  String status;
  String tariffPlanName;
  String contactLoad;
  String factoryId;
  String bpNumber;

  DeviceListModel({
    required this.userDeviceId,
    required this.publicDeviceId,
    required this.internalDeviceId,
    required this.imagePath,
    required this.model,
    required this.name,
    required this.description,
    required this.installationDate,
    required this.status,
    required this.tariffPlanName,
    required this.contactLoad,
    required this.factoryId,
    required this.bpNumber,
  });

  factory DeviceListModel.fromJson(Map<String, dynamic> json) {
    return DeviceListModel(
      userDeviceId: json['device_id']?.toString() ?? '',
      publicDeviceId: json['public_device_id'] ?? '',
      internalDeviceId: json['internal_device_id'] ?? '',
      imagePath: json['image_path'] ?? '',
      model: json['model'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      installationDate: json['installation_date'] ?? '',
      status: json['status'] ?? '',
      tariffPlanName: json['tariff_plan_name'] ?? '',
      contactLoad: json['contact_load']?.toString() ?? '',
      factoryId: json['factory_id'].toString() ?? '',
      bpNumber: json['bp_number'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['device_id'] = userDeviceId;
    data['public_device_id'] = publicDeviceId;
    data['internal_device_id'] = internalDeviceId;
    data['image_path'] = imagePath;
    data['model'] = model;
    data['name'] = name;
    data['description'] = description;
    data['installation_date'] = installationDate;
    data['status'] = status;
    data['tariff_plan_name'] = tariffPlanName;
    data['contact_load'] = contactLoad;
    data['factory_id'] = factoryId;
    data['bp_number'] = bpNumber;
    return data;
  }
}

class DeviceDetailModel {
  final String? status;
  final String? statusNo;
  final String? message;
  final DeviceDetailData? data;

  DeviceDetailModel({
    this.status,
    this.statusNo,
    this.message,
    this.data,
  });

  factory DeviceDetailModel.fromJson(Map<String, dynamic> json) {
    return DeviceDetailModel(
      status: json['status'],
      statusNo: json['status_no'],
      message: json['message'],
      data: DeviceDetailData.fromJson(json['data']),
    );
  }
}

class DeviceDetailData {
  final ValueUnit? latestDataTs;
  final ValueUnit? tariffConsumptionUnit;
  final TariffConsumptionData? tariffConsumptionData;
  final ValueUnit? totalUnit;
  final ValueUnit? totalEnergyCost;
  final ValueUnit? totalGovCost;
  final ValueUnit? demandCost;
  final ValueUnit? demand;
  final ValueUnit? voltage;
  final ValueUnit? current;
  final ValueUnit? frequency;
  final ValueUnit? pf;

  DeviceDetailData({
    this.latestDataTs,
    this.tariffConsumptionUnit,
    this.tariffConsumptionData,
    this.totalUnit,
    this.totalEnergyCost,
    this.totalGovCost,
    this.demandCost,
    this.demand,
    this.voltage,
    this.current,
    this.frequency,
    this.pf,
  });

  factory DeviceDetailData.fromJson(Map<String, dynamic> json) {
    return DeviceDetailData(
      latestDataTs: json['latest_data_ts'] != null
          ? ValueUnit.fromJson(json['latest_data_ts'])
          : null,
      tariffConsumptionUnit: json['tariff_consumption_unit'] != null
          ? ValueUnit.fromJson(json['tariff_consumption_unit'])
          : null,
      tariffConsumptionData:
          TariffConsumptionData.fromJson(json['tariff_consumption_data']),
      totalUnit: json['total_unit'] != null
          ? ValueUnit.fromJson(json['total_unit'])
          : null,
      totalEnergyCost: json['total_energy_cost'] != null
          ? ValueUnit.fromJson(json['total_energy_cost'])
          : null,
      totalGovCost: json['total_gov_cost'] != null
          ? ValueUnit.fromJson(json['total_gov_cost'])
          : null,
      demandCost: json['demand_cost'] != null
          ? ValueUnit.fromJson(json['demand_cost'])
          : null,
      demand:
          json['demand'] != null ? ValueUnit.fromJson(json['demand']) : null,
      voltage:
          json['voltage'] != null ? ValueUnit.fromJson(json['voltage']) : null,
      current:
          json['current'] != null ? ValueUnit.fromJson(json['current']) : null,
      frequency: json['frequency'] != null
          ? ValueUnit.fromJson(json['frequency'])
          : null,
      pf: json['pf'] != null ? ValueUnit.fromJson(json['pf']) : null,
    );
  }
}

class ValueUnit {
  final String? value;
  final String? unit;

  ValueUnit({
    this.value,
    this.unit,
  });

  factory ValueUnit.fromJson(Map<String, dynamic> json) {
    return ValueUnit(
      value: (json['value'] is String)
          ? (json['value'] as String)
          : json['value']?.toString(),
      unit: json['unit'],
    );
  }
}

class TariffConsumptionData {
  final String total;
  final List<TariffBreakdown> breakdown;
  final String tariffPlan;

  TariffConsumptionData({
    required this.total,
    required this.breakdown,
    required this.tariffPlan,
  });

  factory TariffConsumptionData.fromJson(Map<String, dynamic> json) {
    return TariffConsumptionData(
      total: (json['total'] as num).toString(),
      breakdown: (json['breakdown'] as List)
          .map((item) => TariffBreakdown.fromJson(item))
          .toList(),
      tariffPlan: json['tariff_plan'],
    );
  }
}

class TariffBreakdown {
  final String period;
  final String consumption;
  final String unit;
  final String displayName;
  final String percentage;

  TariffBreakdown({
    required this.period,
    required this.consumption,
    required this.unit,
    required this.displayName,
    required this.percentage,
  });

  factory TariffBreakdown.fromJson(Map<String, dynamic> json) {
    return TariffBreakdown(
      period: json['period'],
      consumption: (json['consumption'] as num).toString(),
      unit: json['unit'],
      displayName: json['display_name'],
      percentage: (json['percentage'] as num).toString(),
    );
  }
}
