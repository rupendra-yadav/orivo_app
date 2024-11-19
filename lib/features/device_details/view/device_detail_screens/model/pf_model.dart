
import 'package:auro/features/device_details/view/device_detail_screens/model/pf_data_highest_model.dart';
import 'package:auro/features/device_details/view/device_detail_screens/model/pf_data_model.dart';

class PfModel {
  HighestPf? highestPf;
  Pf? pf;

  PfModel({this.highestPf, this.pf});

  PfModel.fromJson(Map<String, dynamic> json) {
    highestPf = json['curr_pf'] != null
        ? new HighestPf.fromJson(json['curr_pf'])
        : null;
    pf = json['avg_pf'] != null ? new Pf.fromJson(json['avg_pf']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.highestPf != null) {
      data['highest_pf'] = this.highestPf!.toJson();
    }
    if (this.pf != null) {
      data['pf'] = this.pf!.toJson();
    }
    return data;
  }
}