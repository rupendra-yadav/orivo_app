class AvgDemand {
  String? unit;
  double? value;

  AvgDemand({this.unit, this.value});

  AvgDemand.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];

    // Convert the value to double if it's an int
    if (json['value'] is int) {
      value = (json['value'] as int).toDouble();
    } else {
      value = json['value'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unit'] = unit;
    data['value'] = value;
    return data;
  }
}
