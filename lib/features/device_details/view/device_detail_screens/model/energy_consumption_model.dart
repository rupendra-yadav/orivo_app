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
        ? NormalUnit.fromJson(json['normal_unit'])
        : null;
    offPeakUnit = json['off_peak_unit'] != null
        ? NormalUnit.fromJson(json['off_peak_unit'])
        : null;
    onPeakUnit = json['on_peak_unit'] != null
        ? NormalUnit.fromJson(json['on_peak_unit'])
        : null;
    totalUnit = json['total_unit'] != null
        ? NormalUnit.fromJson(json['total_unit'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (normalUnit != null) {
      data['normal_unit'] = normalUnit!.toJson();
    }
    if (offPeakUnit != null) {
      data['off_peak_unit'] = offPeakUnit!.toJson();
    }
    if (onPeakUnit != null) {
      data['on_peak_unit'] = onPeakUnit!.toJson();
    }
    if (totalUnit != null) {
      data['total_unit'] = totalUnit!.toJson();
    }
    return data;
  }
}
