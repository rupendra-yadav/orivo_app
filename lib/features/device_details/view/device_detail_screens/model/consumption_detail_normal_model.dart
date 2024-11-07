class NormalUnit {
  String? unit;
  double? value;

  NormalUnit({this.unit, this.value});

  NormalUnit.fromJson(Map<String, dynamic> json) {
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
