import 'cost_estimate_demand_demand.dart';

class CostEstimateModel {
  Demand? demand;
  Demand? govCost;
  Demand? normEnergy;
  Demand? normEnergyRate;
  Demand? offPeak;
  Demand? offPeakRate;
  Demand? onPeak;
  Demand? onPeakRate;
  Demand? other;
  Demand? totalEnergyCost;

  CostEstimateModel(
      {this.demand,
        this.govCost,
        this.normEnergy,
        this.normEnergyRate,
        this.offPeak,
        this.offPeakRate,
        this.onPeak,
        this.onPeakRate,
        this.other,
        this.totalEnergyCost});

  CostEstimateModel.fromJson(Map<String, dynamic> json) {
    demand =
    json['demand'] != null ? Demand.fromJson(json['demand']) : null;
    govCost = json['gov_cost'] != null
        ? Demand.fromJson(json['gov_cost'])
        : null;
    normEnergy = json['norm_energy'] != null
        ? Demand.fromJson(json['norm_energy'])
        : null;
    normEnergyRate = json['norm_energy_rate'] != null
        ? Demand.fromJson(json['norm_energy_rate'])
        : null;
    offPeak = json['off_peak'] != null
        ? Demand.fromJson(json['off_peak'])
        : null;
    offPeakRate = json['off_peak_rate'] != null
        ? Demand.fromJson(json['off_peak_rate'])
        : null;
    onPeak =
    json['on_peak'] != null ? Demand.fromJson(json['on_peak']) : null;
    onPeakRate = json['on_peak_rate'] != null
        ? Demand.fromJson(json['on_peak_rate'])
        : null;
    other = json['other'] != null ? Demand.fromJson(json['other']) : null;
    totalEnergyCost = json['total_energy_cost'] != null
        ? Demand.fromJson(json['total_energy_cost'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (demand != null) {
      data['demand'] = demand!.toJson();
    }
    if (govCost != null) {
      data['gov_cost'] = govCost!.toJson();
    }
    if (normEnergy != null) {
      data['norm_energy'] = normEnergy!.toJson();
    }
    if (normEnergyRate != null) {
      data['norm_energy_rate'] = normEnergyRate!.toJson();
    }
    if (offPeak != null) {
      data['off_peak'] = offPeak!.toJson();
    }
    if (offPeakRate != null) {
      data['off_peak_rate'] = offPeakRate!.toJson();
    }
    if (onPeak != null) {
      data['on_peak'] = onPeak!.toJson();
    }
    if (onPeakRate != null) {
      data['on_peak_rate'] = onPeakRate!.toJson();
    }
    if (other != null) {
      data['other'] = other!.toJson();
    }
    if (totalEnergyCost != null) {
      data['total_energy_cost'] = totalEnergyCost!.toJson();
    }
    return data;
  }
}