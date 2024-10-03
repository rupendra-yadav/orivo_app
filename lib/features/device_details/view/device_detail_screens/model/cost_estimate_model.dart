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
    json['demand'] != null ? new Demand.fromJson(json['demand']) : null;
    govCost = json['gov_cost'] != null
        ? new Demand.fromJson(json['gov_cost'])
        : null;
    normEnergy = json['norm_energy'] != null
        ? new Demand.fromJson(json['norm_energy'])
        : null;
    normEnergyRate = json['norm_energy_rate'] != null
        ? new Demand.fromJson(json['norm_energy_rate'])
        : null;
    offPeak = json['off_peak'] != null
        ? new Demand.fromJson(json['off_peak'])
        : null;
    offPeakRate = json['off_peak_rate'] != null
        ? new Demand.fromJson(json['off_peak_rate'])
        : null;
    onPeak =
    json['on_peak'] != null ? new Demand.fromJson(json['on_peak']) : null;
    onPeakRate = json['on_peak_rate'] != null
        ? new Demand.fromJson(json['on_peak_rate'])
        : null;
    other = json['other'] != null ? new Demand.fromJson(json['other']) : null;
    totalEnergyCost = json['total_energy_cost'] != null
        ? new Demand.fromJson(json['total_energy_cost'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.demand != null) {
      data['demand'] = this.demand!.toJson();
    }
    if (this.govCost != null) {
      data['gov_cost'] = this.govCost!.toJson();
    }
    if (this.normEnergy != null) {
      data['norm_energy'] = this.normEnergy!.toJson();
    }
    if (this.normEnergyRate != null) {
      data['norm_energy_rate'] = this.normEnergyRate!.toJson();
    }
    if (this.offPeak != null) {
      data['off_peak'] = this.offPeak!.toJson();
    }
    if (this.offPeakRate != null) {
      data['off_peak_rate'] = this.offPeakRate!.toJson();
    }
    if (this.onPeak != null) {
      data['on_peak'] = this.onPeak!.toJson();
    }
    if (this.onPeakRate != null) {
      data['on_peak_rate'] = this.onPeakRate!.toJson();
    }
    if (this.other != null) {
      data['other'] = this.other!.toJson();
    }
    if (this.totalEnergyCost != null) {
      data['total_energy_cost'] = this.totalEnergyCost!.toJson();
    }
    return data;
  }
}