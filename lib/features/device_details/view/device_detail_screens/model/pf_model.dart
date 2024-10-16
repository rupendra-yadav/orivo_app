
import 'package:auro/features/device_details/view/device_detail_screens/model/pf_data_model.dart';

class PfModel {
  Pf? pf;

  PfModel({this.pf});

  PfModel.fromJson(Map<String, dynamic> json) {
    pf = json['pf'] != null ? new Pf.fromJson(json['pf']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pf != null) {
      data['pf'] = this.pf!.toJson();
    }
    return data;
  }
}

