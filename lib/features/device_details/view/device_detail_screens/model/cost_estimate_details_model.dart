class CostEstimateDetailsModel {
  final String? status;
  final String? statusNo;
  final String? message;
  final CostEstimateData? data;

  CostEstimateDetailsModel({
    this.status,
    this.statusNo,
    this.message,
    this.data,
  });

  factory CostEstimateDetailsModel.fromJson(Map<String, dynamic> json) {
    return CostEstimateDetailsModel(
      status: json['status'] as String?,
      statusNo: json['status_no']?.toString(),
      message: json['message'] as String?,
      data:
          json['data'] != null ? CostEstimateData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "status_no": statusNo,
        "message": message,
        "data": data?.toJson(),
      };
}

class CostEstimateData {
  final CostUnit? totalCost;
  final CostUnit? totalEnergyCost;
  final String? tariffPlan;
  final List<TariffBreakdown>? tariffBreakdown;
  final GovernmentCosts? governmentCosts;
  final DemandCosts? demandCosts;
  final CostUnit? otherCosts;
  final CostDistribution? costDistribution;
  final Metadata? metadata;

  CostEstimateData({
    this.totalCost,
    this.totalEnergyCost,
    this.tariffPlan,
    this.tariffBreakdown,
    this.governmentCosts,
    this.demandCosts,
    this.otherCosts,
    this.costDistribution,
    this.metadata,
  });

  factory CostEstimateData.fromJson(Map<String, dynamic> json) {
    return CostEstimateData(
      totalCost: json['total_cost'] != null
          ? CostUnit.fromJson(json['total_cost'])
          : null,
      totalEnergyCost: json['total_energy_cost'] != null
          ? CostUnit.fromJson(json['total_energy_cost'])
          : null,
      tariffPlan: json['tariff_plan'] as String?,
      tariffBreakdown: (json['tariff_breakdown'] as List?)
          ?.map((e) => TariffBreakdown.fromJson(e))
          .toList(),
      governmentCosts: json['government_costs'] != null
          ? GovernmentCosts.fromJson(json['government_costs'])
          : null,
      demandCosts: json['demand_costs'] != null
          ? DemandCosts.fromJson(json['demand_costs'])
          : null,
      otherCosts: json['other_costs'] != null
          ? CostUnit.fromJson(json['other_costs'])
          : null,
      costDistribution: json['cost_distribution'] != null
          ? CostDistribution.fromJson(json['cost_distribution'])
          : null,
      metadata:
          json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "total_cost": totalCost?.toJson(),
        "total_energy_cost": totalEnergyCost?.toJson(),
        "tariff_plan": tariffPlan,
        "tariff_breakdown": tariffBreakdown?.map((e) => e.toJson()).toList(),
        "government_costs": governmentCosts?.toJson(),
        "demand_costs": demandCosts?.toJson(),
        "other_costs": otherCosts?.toJson(),
        "cost_distribution": costDistribution?.toJson(),
        "metadata": metadata?.toJson(),
      };
}

class CostUnit {
  final String? value;
  final String? unit;

  CostUnit({this.value, this.unit});

  factory CostUnit.fromJson(Map<String, dynamic> json) {
    return CostUnit(
      value: json['value']?.toString(),
      unit: json['unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        "value": value,
        "unit": unit,
      };
}

class TariffBreakdown {
  final String? periodName;
  final CostUnit? consumption;
  final CostUnit? rate;
  final CostUnit? cost;
  final List<String>? timeRange;

  TariffBreakdown({
    this.periodName,
    this.consumption,
    this.rate,
    this.cost,
    this.timeRange,
  });

  factory TariffBreakdown.fromJson(Map<String, dynamic> json) {
    return TariffBreakdown(
      periodName: json['period_name'] as String?,
      consumption: json['consumption'] != null
          ? CostUnit.fromJson(json['consumption'])
          : null,
      rate: json['rate'] != null ? CostUnit.fromJson(json['rate']) : null,
      cost: json['cost'] != null ? CostUnit.fromJson(json['cost']) : null,
      timeRange:
          (json['time_range'] as List?)?.map((e) => e.toString()).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "period_name": periodName,
        "consumption": consumption?.toJson(),
        "rate": rate?.toJson(),
        "cost": cost?.toJson(),
        "time_range": timeRange,
      };
}

class GovernmentCosts {
  final CostUnit? total;
  final Fppas? fppas;
  final ElectricityDuty? electricityDuty;
  final Cess? cess;

  GovernmentCosts({
    this.total,
    this.fppas,
    this.electricityDuty,
    this.cess,
  });

  factory GovernmentCosts.fromJson(Map<String, dynamic> json) {
    return GovernmentCosts(
      total: json['total'] != null ? CostUnit.fromJson(json['total']) : null,
      fppas: json['fppas'] != null ? Fppas.fromJson(json['fppas']) : null,
      electricityDuty: json['electricity_duty'] != null
          ? ElectricityDuty.fromJson(json['electricity_duty'])
          : null,
      cess: json['cess'] != null ? Cess.fromJson(json['cess']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "total": total?.toJson(),
        "fppas": fppas?.toJson(),
        "electricity_duty": electricityDuty?.toJson(),
        "cess": cess?.toJson(),
      };
}

class Fppas {
  final CostUnit? baseAmount;
  final CostUnit? rate;
  final String? description;

  Fppas({this.baseAmount, this.rate, this.description});

  factory Fppas.fromJson(Map<String, dynamic> json) {
    return Fppas(
      baseAmount: json['base_amount'] != null
          ? CostUnit.fromJson(json['base_amount'])
          : null,
      rate: json['rate'] != null ? CostUnit.fromJson(json['rate']) : null,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        "base_amount": baseAmount?.toJson(),
        "rate": rate?.toJson(),
        "description": description,
      };
}

class ElectricityDuty {
  final CostUnit? amount;
  final CostUnit? rate;
  final String? description;

  ElectricityDuty({this.amount, this.rate, this.description});

  factory ElectricityDuty.fromJson(Map<String, dynamic> json) {
    return ElectricityDuty(
      amount: json['amount'] != null ? CostUnit.fromJson(json['amount']) : null,
      rate: json['rate'] != null ? CostUnit.fromJson(json['rate']) : null,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        "amount": amount?.toJson(),
        "rate": rate?.toJson(),
        "description": description,
      };
}

class Cess {
  final CostUnit? baseAmount;
  final CostUnit? rate;
  final String? description;

  Cess({this.baseAmount, this.rate, this.description});

  factory Cess.fromJson(Map<String, dynamic> json) {
    return Cess(
      baseAmount: json['base_amount'] != null
          ? CostUnit.fromJson(json['base_amount'])
          : null,
      rate: json['rate'] != null ? CostUnit.fromJson(json['rate']) : null,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        "base_amount": baseAmount?.toJson(),
        "rate": rate?.toJson(),
        "description": description,
      };
}

class DemandCosts {
  final CostUnit? total;
  final List<dynamic>? distribution;
  final String? description;

  DemandCosts({this.total, this.distribution, this.description});

  factory DemandCosts.fromJson(Map<String, dynamic> json) {
    return DemandCosts(
      total: json['total'] != null ? CostUnit.fromJson(json['total']) : null,
      distribution: json['distribution'] as List?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        "total": total?.toJson(),
        "distribution": distribution,
        "description": description,
      };
}

class CostDistribution {
  final String? energyPercentage;
  final String? governmentPercentage;
  final String? demandPercentage;
  final String? otherPercentage;

  CostDistribution({
    this.energyPercentage,
    this.governmentPercentage,
    this.demandPercentage,
    this.otherPercentage,
  });

  factory CostDistribution.fromJson(Map<String, dynamic> json) {
    return CostDistribution(
      energyPercentage: json['energy_percentage']?.toString(),
      governmentPercentage: json['government_percentage']?.toString(),
      demandPercentage: json['demand_percentage']?.toString(),
      otherPercentage: json['other_percentage']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        "energy_percentage": energyPercentage,
        "government_percentage": governmentPercentage,
        "demand_percentage": demandPercentage,
        "other_percentage": otherPercentage,
      };
}

class Metadata {
  final String? tariffPlan;
  final String? deviceId;
  final String? period;
  final String? calculationTime;
  final Map<String, String>? tariffRates;
  final Map<String, String>? consumptionSummary;

  Metadata({
    this.tariffPlan,
    this.deviceId,
    this.period,
    this.calculationTime,
    this.tariffRates,
    this.consumptionSummary,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      tariffPlan: json['tariff_plan'] as String?,
      deviceId: json['device_id'] as String?,
      period: json['period'] as String?,
      calculationTime: json['calculation_time'] as String?,
      tariffRates: (json['tariff_rates'] as Map?)?.map(
        (k, v) => MapEntry(k.toString(), v.toString()),
      ),
      consumptionSummary: (json['consumption_summary'] as Map?)?.map(
        (k, v) => MapEntry(k.toString(), v.toString()),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        "tariff_plan": tariffPlan,
        "device_id": deviceId,
        "period": period,
        "calculation_time": calculationTime,
        "tariff_rates": tariffRates,
        "consumption_summary": consumptionSummary,
      };
}
