import 'package:auro/features/device_details/view/device_detail_screens/model/voltage_detail_avg_model.dart';
import 'package:auro/features/device_details/view/device_detail_screens/model/voltage_detail_timeline_model.dart';

class VoltageDetailModel {
  AvgVolt? avgVolt;
  AvgVolt? highestVolt;
  AvgVolt? volt;
  VoltageTimeline? voltageTimeline;

  VoltageDetailModel(
      {this.avgVolt, this.highestVolt, this.volt, this.voltageTimeline});

  VoltageDetailModel.fromJson(Map<String, dynamic> json) {
    avgVolt = json['avg_volt'] != null
        ? new AvgVolt.fromJson(json['avg_volt'])
        : null;
    highestVolt = json['highest_volt'] != null
        ? new AvgVolt.fromJson(json['highest_volt'])
        : null;
    volt = json['volt'] != null ? new AvgVolt.fromJson(json['volt']) : null;
    voltageTimeline = json['voltage_timeline'] != null
        ? new VoltageTimeline.fromJson(json['voltage_timeline'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.avgVolt != null) {
      data['avg_volt'] = this.avgVolt!.toJson();
    }
    if (this.highestVolt != null) {
      data['highest_volt'] = this.highestVolt!.toJson();
    }
    if (this.volt != null) {
      data['volt'] = this.volt!.toJson();
    }
    if (this.voltageTimeline != null) {
      data['voltage_timeline'] = this.voltageTimeline!.toJson();
    }
    return data;
  }
}