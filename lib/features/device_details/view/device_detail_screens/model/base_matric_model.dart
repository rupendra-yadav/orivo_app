import 'base_matric_current.dart';

class BaseMatricModel {
  Current? current;
  Current? freq;
  Current? volt;

  BaseMatricModel({this.current, this.freq, this.volt});

  BaseMatricModel.fromJson(Map<String, dynamic> json) {
    current =
    json['current'] != null ? new Current.fromJson(json['current']) : null;
    freq = json['freq'] != null ? new Current.fromJson(json['freq']) : null;
    volt = json['volt'] != null ? new Current.fromJson(json['volt']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.current != null) {
      data['current'] = this.current!.toJson();
    }
    if (this.freq != null) {
      data['freq'] = this.freq!.toJson();
    }
    if (this.volt != null) {
      data['volt'] = this.volt!.toJson();
    }
    return data;
  }
}