import 'package:auro/features/device_details/view/device_detail_screens/model/pf_detail_avg_model.dart';
import 'package:auro/features/device_details/view/device_detail_screens/model/pf_detail_timeline_model.dart';
import 'package:flutter/material.dart';

class PfDetailModel {
  AvgPf? avgPf;
  AvgPf? highestPf;
  AvgPf? lowestPf;
  PfTimeline? pfTimeline;
  AvgPf? totalPf;

  PfDetailModel(
      {this.avgPf,
        this.highestPf,
        this.lowestPf,
        this.pfTimeline,
        this.totalPf});

  PfDetailModel.fromJson(Map<String, dynamic> json) {
    avgPf = json['avg_pf'] != null ? new AvgPf.fromJson(json['avg_pf']) : null;
    highestPf = json['highest_pf'] != null
        ? new AvgPf.fromJson(json['highest_pf'])
        : null;
    lowestPf = json['lowest_pf'] != null
        ? new AvgPf.fromJson(json['lowest_pf'])
        : null;
    pfTimeline = json['pf_timeline'] != null
        ? new PfTimeline.fromJson(json['pf_timeline'])
        : null;
    totalPf =
    json['total_pf'] != null ? new AvgPf.fromJson(json['total_pf']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.avgPf != null) {
      data['avg_pf'] = this.avgPf!.toJson();
    }
    if (this.highestPf != null) {
      data['highest_pf'] = this.highestPf!.toJson();
    }
    if (this.lowestPf != null) {
      data['lowest_pf'] = this.lowestPf!.toJson();
    }
    if (this.pfTimeline != null) {
      data['pf_timeline'] = this.pfTimeline!.toJson();
    }
    if (this.totalPf != null) {
      data['total_pf'] = this.totalPf!.toJson();
    }
    return data;
  }
}