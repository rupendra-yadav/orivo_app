class EnergyConsumptionModel {
  Data? data;

  EnergyConsumptionModel({this.data});

  EnergyConsumptionModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  NormalUnit? normalUnit;
  NormalUnit? offPeakUnit;
  OnPeakUnit? onPeakUnit;
  OnPeakUnit? totalUnit;

  Data({this.normalUnit, this.offPeakUnit, this.onPeakUnit, this.totalUnit});

  Data.fromJson(Map<String, dynamic> json) {
    normalUnit = json['normal_unit'] != null
        ? new NormalUnit.fromJson(json['normal_unit'])
        : null;
    offPeakUnit = json['off_peak_unit'] != null
        ? new NormalUnit.fromJson(json['off_peak_unit'])
        : null;
    onPeakUnit = json['on_peak_unit'] != null
        ? new OnPeakUnit.fromJson(json['on_peak_unit'])
        : null;
    totalUnit = json['total_unit'] != null
        ? new OnPeakUnit.fromJson(json['total_unit'])
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

class NormalUnit {
  String? unit;
  Null? value;

  NormalUnit({this.unit, this.value});

  NormalUnit.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit'] = this.unit;
    data['value'] = this.value;
    return data;
  }
}

class OnPeakUnit {
  String? unit;
  double? value;

  OnPeakUnit({this.unit, this.value});

  OnPeakUnit.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit'] = this.unit;
    data['value'] = this.value;
    return data;
  }
}
