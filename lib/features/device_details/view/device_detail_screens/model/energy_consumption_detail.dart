import 'dart:convert';

class EnergyConsumptionDetailModel {
  final String? status;
  final String? statusNo;
  final String? message;
  final EnergyConsumptionData? data;

  EnergyConsumptionDetailModel({
    this.status,
    this.statusNo,
    this.message,
    this.data,
  });

  factory EnergyConsumptionDetailModel.fromJson(Map<String, dynamic> json) {
    return EnergyConsumptionDetailModel(
      status: json['status'],
      statusNo: json['status_no']?.toString(),
      message: json['message'],
      data: EnergyConsumptionData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'status_no': statusNo,
      'message': message,
      'data': data!.toJson(),
    };
  }
}

class EnergyConsumptionData {
  final Consumption totalConsumption;
  final String tariffPlan;
  final List<Period> periods;
  final List<GraphPeriod> graphData;
  final Metadata metadata;

  EnergyConsumptionData({
    required this.totalConsumption,
    required this.tariffPlan,
    required this.periods,
    required this.graphData,
    required this.metadata,
  });

  factory EnergyConsumptionData.fromJson(Map<String, dynamic> json) {
    return EnergyConsumptionData(
      totalConsumption: Consumption.fromJson(json['total_consumption']),
      tariffPlan: json['tariff_plan'],
      periods:
          (json['periods'] as List).map((e) => Period.fromJson(e)).toList(),
      graphData: (json['graph_data'] as List)
          .map((e) => GraphPeriod.fromJson(e))
          .toList(),
      metadata: Metadata.fromJson(json['metadata']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_consumption': totalConsumption.toJson(),
      'tariff_plan': tariffPlan,
      'periods': periods.map((e) => e.toJson()).toList(),
      'graph_data': graphData.map((e) => e.toJson()).toList(),
      'metadata': metadata.toJson(),
    };
  }
}

class Consumption {
  final double value;
  final String unit;

  Consumption({
    required this.value,
    required this.unit,
  });

  factory Consumption.fromJson(Map<String, dynamic> json) {
    return Consumption(
      value: (json['value'] as num).toDouble(),
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'unit': unit,
    };
  }
}

class Period {
  final String periodName;
  final Consumption consumption;
  final double rate;
  final List<String> timeRange;

  Period({
    required this.periodName,
    required this.consumption,
    required this.rate,
    required this.timeRange,
  });

  factory Period.fromJson(Map<String, dynamic> json) {
    return Period(
      periodName: json['period_name'],
      consumption: Consumption.fromJson(json['consumption']),
      rate: (json['rate'] as num).toDouble(),
      timeRange: List<String>.from(json['time_range']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'period_name': periodName,
      'consumption': consumption.toJson(),
      'rate': rate,
      'time_range': timeRange,
    };
  }
}

class GraphPeriod {
  final String periodName;
  final List<GraphDataPoint> dataPoints;

  GraphPeriod({
    required this.periodName,
    required this.dataPoints,
  });

  factory GraphPeriod.fromJson(Map<String, dynamic> json) {
    return GraphPeriod(
      periodName: json['period_name'],
      dataPoints: (json['data_points'] as List)
          .map((e) => GraphDataPoint.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'period_name': periodName,
      'data_points': dataPoints.map((e) => e.toJson()).toList(),
    };
  }
}

class GraphDataPoint {
  final String date;
  final double value;

  GraphDataPoint({
    required this.date,
    required this.value,
  });

  factory GraphDataPoint.fromJson(Map<String, dynamic> json) {
    return GraphDataPoint(
      date: json['date'],
      value: (json['value'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'value': value,
    };
  }
}

class Metadata {
  final String tariffPlan;
  final String totalPeriods;
  final String deviceId;
  final String requestPeriod;
  final bool isTodayRequest;
  final bool isExtendedView;
  final String daysShown;
  final String graphDataType;
  final RequestInfo requestInfo;

  Metadata({
    required this.tariffPlan,
    required this.totalPeriods,
    required this.deviceId,
    required this.requestPeriod,
    required this.isTodayRequest,
    required this.isExtendedView,
    required this.daysShown,
    required this.graphDataType,
    required this.requestInfo,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      tariffPlan: json['tariff_plan'],
      totalPeriods: json['total_periods'].toString(),
      deviceId: json['device_id'],
      requestPeriod: json['request_period'],
      isTodayRequest: json['is_today_request'],
      isExtendedView: json['is_extended_view'],
      daysShown: json['days_shown'].toString(),
      graphDataType: json['graph_data_type'],
      requestInfo: RequestInfo.fromJson(json['request_info']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tariff_plan': tariffPlan,
      'total_periods': totalPeriods,
      'device_id': deviceId,
      'request_period': requestPeriod,
      'is_today_request': isTodayRequest,
      'is_extended_view': isExtendedView,
      'days_shown': daysShown,
      'graph_data_type': graphDataType,
      'request_info': requestInfo.toJson(),
    };
  }
}

class RequestInfo {
  final String originalStart;
  final String originalStop;
  final bool isTodayOnlyRequest;
  final String breakdownPeriod;

  RequestInfo({
    required this.originalStart,
    required this.originalStop,
    required this.isTodayOnlyRequest,
    required this.breakdownPeriod,
  });

  factory RequestInfo.fromJson(Map<String, dynamic> json) {
    return RequestInfo(
      originalStart: json['original_start'],
      originalStop: json['original_stop'],
      isTodayOnlyRequest: json['is_today_only_request'],
      breakdownPeriod: json['breakdown_period'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'original_start': originalStart,
      'original_stop': originalStop,
      'is_today_only_request': isTodayOnlyRequest,
      'breakdown_period': breakdownPeriod,
    };
  }
}

// ✅ Helper to parse from raw JSON string
EnergyConsumptionDetailModel energyConsumptionResponseFromJson(String str) =>
    EnergyConsumptionDetailModel.fromJson(json.decode(str));

String energyConsumptionResponseToJson(EnergyConsumptionDetailModel data) =>
    json.encode(data.toJson());
