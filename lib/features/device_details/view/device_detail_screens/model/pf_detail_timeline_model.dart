import 'package:auro/features/device_details/view/device_detail_screens/model/pf_detail_value_model.dart';
import 'package:flutter/material.dart';

class PfTimeline {
  List<Value>? value;

  PfTimeline({this.value});

  PfTimeline.fromJson(Map<String, dynamic> json) {
    if (json['value'] != null) {
      value = <Value>[];
      json['value'].forEach((v) {
        value!.add(new Value.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.value != null) {
      data['value'] = this.value!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}