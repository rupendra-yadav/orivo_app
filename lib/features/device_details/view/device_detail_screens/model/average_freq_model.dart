class AvgFreq {
  String? unit;
  double? value;

  AvgFreq({this.unit, this.value});

  AvgFreq.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    if (json['value'] is int) {
      value = (json['value'] as int).toDouble(); // Convert int to double
    } else {
      value = json['value'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit'] = this.unit;
    data['value'] = this.value;
    return data;
  }
}
