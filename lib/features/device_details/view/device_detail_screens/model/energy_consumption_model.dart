import 'normal_model.dart';

class EnergyConsumptionModel {
  NormalUnit? normalUnit;
  NormalUnit? offPeakUnit;
  NormalUnit? onPeakUnit;
  NormalUnit? totalUnit;

  EnergyConsumptionModel(
      {this.normalUnit,
        this.offPeakUnit,
        this.onPeakUnit,
        this.totalUnit});

  EnergyConsumptionModel.fromJson(Map<String, dynamic> json) {
    normalUnit = json['normal_unit'] != null
        ? new NormalUnit.fromJson(json['normal_unit'])
        : null;
    offPeakUnit = json['off_peak_unit'] != null
        ? new NormalUnit.fromJson(json['off_peak_unit'])
        : null;
    onPeakUnit = json['on_peak_unit'] != null
        ? new NormalUnit.fromJson(json['on_peak_unit'])
        : null;
    totalUnit = json['total_unit'] != null
        ? new NormalUnit.fromJson(json['total_unit'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.normalUnit != null) {
      data['normal_unit'] = this.normalUnit!.toJson();
    }
    if (this.offPeakUnit != null) {
      data['off_peak_unit'] = this.offPeakUnit!.toJson();
    }
    if (this.onPeakUnit != null) {
      data['on_peak_unit'] = this.onPeakUnit!.toJson();
    }
    if (this.totalUnit != null) {
      data['total_unit'] = this.totalUnit!.toJson();
    }
    return data;
  }
}
