import 'current_detail_avg_model.dart';
import 'current_detail_timeline_model.dart';

class CurrentDetailModel {
  AvgCurrent? avgCurrent;
  AvgCurrent? current;
  AvgCurrent? highestCurrent;
  IaTimeline? iaTimeline;
  IaTimeline? ibTimeline;
  IaTimeline? icTimeline;

  CurrentDetailModel(
      {this.avgCurrent,
        this.current,
        this.highestCurrent,
        this.iaTimeline,
        this.ibTimeline,
        this.icTimeline});

  CurrentDetailModel.fromJson(Map<String, dynamic> json) {
    avgCurrent = json['avg_current'] != null
        ? new AvgCurrent.fromJson(json['avg_current'])
        : null;
    current = json['current'] != null
        ? new AvgCurrent.fromJson(json['current'])
        : null;
    highestCurrent = json['highest_current'] != null
        ? new AvgCurrent.fromJson(json['highest_current'])
        : null;
    iaTimeline = json['ia_timeline'] != null
        ? new IaTimeline.fromJson(json['ia_timeline'])
        : null;
    ibTimeline = json['ib_timeline'] != null
        ? new IaTimeline.fromJson(json['ib_timeline'])
        : null;
    icTimeline = json['ic_timeline'] != null
        ? new IaTimeline.fromJson(json['ic_timeline'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.avgCurrent != null) {
      data['avg_current'] = this.avgCurrent!.toJson();
    }
    if (this.current != null) {
      data['current'] = this.current!.toJson();
    }
    if (this.highestCurrent != null) {
      data['highest_current'] = this.highestCurrent!.toJson();
    }
    if (this.iaTimeline != null) {
      data['ia_timeline'] = this.iaTimeline!.toJson();
    }
    if (this.ibTimeline != null) {
      data['ib_timeline'] = this.ibTimeline!.toJson();
    }
    if (this.icTimeline != null) {
      data['ic_timeline'] = this.icTimeline!.toJson();
    }
    return data;
  }
}