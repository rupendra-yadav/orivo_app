class AvgCurrent {
  String? unit;
  double? value;

  AvgCurrent({this.unit, this.value});

  AvgCurrent.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    value = (json['value'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unit'] = unit;
    data['value'] = value;
    return data;
  }
}
