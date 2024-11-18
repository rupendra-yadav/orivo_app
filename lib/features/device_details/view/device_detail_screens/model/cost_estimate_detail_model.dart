import 'cost_estimate_demand_demand.dart';
import 'cost_estimate_details_demand_distribution_model.dart';

class CostEstimateDetailModel {
  List<DemandDistribution>? demandDistribution;
  Demand? cess;
  Demand? cessRate;
  Demand? demand;
  Demand? demandRate;
  Demand? electricityDuty;
  Demand? fppsRate;
  Demand? govCost;
  Demand? normEnergy;
  Demand? normEnergyRate;
  Demand? normalFpps;
  Demand? offPeak;
  Demand? offPeakRate;
  Demand? onPeak;
  Demand? onPeakRate;
  Demand? others;
  Demand? totalEnergyCost;
  Demand? totolDemandCost;

  CostEstimateDetailModel(
      {this.cess,
        this.demandDistribution,
        this.cessRate,
        this.demand,
        this.demandRate,
        this.electricityDuty,
        this.fppsRate,
        this.govCost,
        this.normEnergy,
        this.normEnergyRate,
        this.normalFpps,
        this.offPeak,
        this.offPeakRate,
        this.onPeak,
        this.onPeakRate,
        this.others,
        this.totalEnergyCost,
        this.totolDemandCost});

  CostEstimateDetailModel.fromJson(Map<String, dynamic> json) {

    if (json['demand_distribution'] != null) {
      demandDistribution = <DemandDistribution>[];
      json['demand_distribution'].forEach((v) {
        demandDistribution!.add(new DemandDistribution.fromJson(v));
      });
    }

    cess = json['cess'] != null ? new Demand.fromJson(json['cess']) : null;
    cessRate =
    json['cess_rate'] != null ? new Demand.fromJson(json['cess_rate']) : null;
    demand =
    json['demand'] != null ? new Demand.fromJson(json['demand']) : null;
    demandRate = json['demand_rate'] != null
        ? new Demand.fromJson(json['demand_rate'])
        : null;
    electricityDuty = json['electricity_duty'] != null
        ? new Demand.fromJson(json['electricity_duty'])
        : null;
    fppsRate =
    json['fpps_rate'] != null ? new Demand.fromJson(json['fpps_rate']) : null;
    govCost =
    json['gov_cost'] != null ? new Demand.fromJson(json['gov_cost']) : null;
    normEnergy = json['norm_energy'] != null
        ? new Demand.fromJson(json['norm_energy'])
        : null;
    normEnergyRate = json['norm_energy_rate'] != null
        ? new Demand.fromJson(json['norm_energy_rate'])
        : null;
    normalFpps = json['normal_fpps'] != null
        ? new Demand.fromJson(json['normal_fpps'])
        : null;
    offPeak =
    json['off_peak'] != null ? new Demand.fromJson(json['off_peak']) : null;
    offPeakRate = json['off_peak_rate'] != null
        ? new Demand.fromJson(json['off_peak_rate'])
        : null;
    onPeak =
    json['on_peak'] != null ? new Demand.fromJson(json['on_peak']) : null;
    onPeakRate = json['on_peak_rate'] != null
        ? new Demand.fromJson(json['on_peak_rate'])
        : null;
    others = json['others'] != null ? new Demand.fromJson(json['others']) : null;
    totalEnergyCost = json['total_energy_cost'] != null
        ? new Demand.fromJson(json['total_energy_cost'])
        : null;
    totolDemandCost = json['total_demand_cost'] != null
        ? new Demand.fromJson(json['total_demand_cost'])
        : null;
  }

  get value => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.demandDistribution != null) {
      data['demand_distribution'] =
          this.demandDistribution!.map((v) => v.toJson()).toList();
    }

    if (this.cess != null) {
      data['cess'] = this.cess!.toJson();
    }
    if (this.cessRate != null) {
      data['cess_rate'] = this.cessRate!.toJson();
    }
    if (this.demand != null) {
      data['demand'] = this.demand!.toJson();
    }
    if (this.demandRate != null) {
      data['demand_rate'] = this.demandRate!.toJson();
    }
    if (this.electricityDuty != null) {
      data['electricity_duty'] = this.electricityDuty!.toJson();
    }
    if (this.fppsRate != null) {
      data['fpps_rate'] = this.fppsRate!.toJson();
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
    if (this.normalFpps != null) {
      data['normal_fpps'] = this.normalFpps!.toJson();
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
    if (this.others != null) {
      data['others'] = this.others!.toJson();
    }
    if (this.totalEnergyCost != null) {
      data['total_energy_cost'] = this.totalEnergyCost!.toJson();
    }
    if (this.totolDemandCost != null) {
      data['total_demand_cost'] = this.totolDemandCost!.toJson();
    }
    return data;
  }
}