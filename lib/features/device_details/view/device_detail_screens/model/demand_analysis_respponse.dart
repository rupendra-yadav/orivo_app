class DemandAnalysisResponse {
  final String status;
  final int statusNo;
  final String message;
  final DemandData data;

  DemandAnalysisResponse({
    required this.status,
    required this.statusNo,
    required this.message,
    required this.data,
  });

  factory DemandAnalysisResponse.fromJson(Map<String, dynamic> json) {
    return DemandAnalysisResponse(
      status: json['status'],
      statusNo: json['status_no'],
      message: json['message'],
      data: DemandData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "status_no": statusNo,
      "message": message,
      "data": data.toJson(),
    };
  }
}

class DemandData {
  final DemandMetric currentDemand;
  final DemandMetric averageDemand;
  final DemandMetric highestDemand;
  final DemandMetric loadFactor;
  final DemandRate demandRate;
  final DemandMetric totalDemandCost;
  final List<MonthlyBreakdown> monthlyBreakdown;
  final DemandMetric factoryCapacity;
  final DemandMetric capacityUtilization;
  final DemandTimeline demandTimeline;
  final PeriodInfo periodInfo;
  final Metadata metadata;

  DemandData({
    required this.currentDemand,
    required this.averageDemand,
    required this.highestDemand,
    required this.loadFactor,
    required this.demandRate,
    required this.totalDemandCost,
    required this.monthlyBreakdown,
    required this.factoryCapacity,
    required this.capacityUtilization,
    required this.demandTimeline,
    required this.periodInfo,
    required this.metadata,
  });

  factory DemandData.fromJson(Map<String, dynamic> json) {
    return DemandData(
      currentDemand: DemandMetric.fromJson(json['current_demand']),
      averageDemand: DemandMetric.fromJson(json['average_demand']),
      highestDemand: DemandMetric.fromJson(json['highest_demand']),
      loadFactor: DemandMetric.fromJson(json['load_factor']),
      demandRate: DemandRate.fromJson(json['demand_rate']),
      totalDemandCost: DemandMetric.fromJson(json['total_demand_cost']),
      monthlyBreakdown: (json['monthly_breakdown'] as List)
          .map((e) => MonthlyBreakdown.fromJson(e))
          .toList(),
      factoryCapacity: DemandMetric.fromJson(json['factory_capacity']),
      capacityUtilization: DemandMetric.fromJson(json['capacity_utilization']),
      demandTimeline: DemandTimeline.fromJson(json['demand_timeline']),
      periodInfo: PeriodInfo.fromJson(json['period_info']),
      metadata: Metadata.fromJson(json['metadata']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "current_demand": currentDemand.toJson(),
      "average_demand": averageDemand.toJson(),
      "highest_demand": highestDemand.toJson(),
      "load_factor": loadFactor.toJson(),
      "demand_rate": demandRate.toJson(),
      "total_demand_cost": totalDemandCost.toJson(),
      "monthly_breakdown": monthlyBreakdown.map((e) => e.toJson()).toList(),
      "factory_capacity": factoryCapacity.toJson(),
      "capacity_utilization": capacityUtilization.toJson(),
      "demand_timeline": demandTimeline.toJson(),
      "period_info": periodInfo.toJson(),
      "metadata": metadata.toJson(),
    };
  }
}

class DemandMetric {
  final double value;
  final String unit;
  final String description;

  DemandMetric({
    required this.value,
    required this.unit,
    required this.description,
  });

  factory DemandMetric.fromJson(Map<String, dynamic> json) {
    return DemandMetric(
      value: (json['value'] as num).toDouble(),
      unit: json['unit'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "value": value,
      "unit": unit,
      "description": description,
    };
  }
}

class DemandRate extends DemandMetric {
  final String category;

  DemandRate({
    required double value,
    required String unit,
    required this.category,
    required String description,
  }) : super(value: value, unit: unit, description: description);

  factory DemandRate.fromJson(Map<String, dynamic> json) {
    return DemandRate(
      value: (json['value'] as num).toDouble(),
      unit: json['unit'],
      category: json['category'],
      description: json['description'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "value": value,
      "unit": unit,
      "category": category,
      "description": description,
    };
  }
}

class MonthlyBreakdown {
  final String start;
  final String end;
  final double rate;
  final String rateCategory;
  final double actualDemand;
  final double billingDemand;
  final double cost;
  final int days;

  MonthlyBreakdown({
    required this.start,
    required this.end,
    required this.rate,
    required this.rateCategory,
    required this.actualDemand,
    required this.billingDemand,
    required this.cost,
    required this.days,
  });

  factory MonthlyBreakdown.fromJson(Map<String, dynamic> json) {
    return MonthlyBreakdown(
      start: json['start'],
      end: json['end'],
      rate: (json['rate'] as num).toDouble(),
      rateCategory: json['rate_category'],
      actualDemand: (json['actual_demand'] as num).toDouble(),
      billingDemand: (json['billing_demand'] as num).toDouble(),
      cost: (json['cost'] as num).toDouble(),
      days: json['days'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "start": start,
      "end": end,
      "rate": rate,
      "rate_category": rateCategory,
      "actual_demand": actualDemand,
      "billing_demand": billingDemand,
      "cost": cost,
      "days": days,
    };
  }
}

class DemandTimeline {
  final List<TimelineData> data;
  final String description;

  DemandTimeline({
    required this.data,
    required this.description,
  });

  factory DemandTimeline.fromJson(Map<String, dynamic> json) {
    return DemandTimeline(
      data:
          (json['data'] as List).map((e) => TimelineData.fromJson(e)).toList(),
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "data": data.map((e) => e.toJson()).toList(),
      "description": description,
    };
  }
}

class TimelineData {
  final String x;
  final double y;

  TimelineData({required this.x, required this.y});

  factory TimelineData.fromJson(Map<String, dynamic> json) {
    return TimelineData(
      x: json['x'],
      y: (json['y'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "x": x,
      "y": y,
    };
  }
}

class PeriodInfo {
  final String start;
  final String end;
  final int days;
  final int dataPoints;

  PeriodInfo({
    required this.start,
    required this.end,
    required this.days,
    required this.dataPoints,
  });

  factory PeriodInfo.fromJson(Map<String, dynamic> json) {
    return PeriodInfo(
      start: json['start'],
      end: json['end'],
      days: json['days'],
      dataPoints: json['data_points'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "start": start,
      "end": end,
      "days": days,
      "data_points": dataPoints,
    };
  }
}

class Metadata {
  final String deviceId;
  final String calculationTime;
  final double totalEnergyKwh;
  final String analysisPeriod;

  Metadata({
    required this.deviceId,
    required this.calculationTime,
    required this.totalEnergyKwh,
    required this.analysisPeriod,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      deviceId: json['device_id'],
      calculationTime: json['calculation_time'],
      totalEnergyKwh: (json['total_energy_kwh'] as num).toDouble(),
      analysisPeriod: json['analysis_period'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "device_id": deviceId,
      "calculation_time": calculationTime,
      "total_energy_kwh": totalEnergyKwh,
      "analysis_period": analysisPeriod,
    };
  }
}
