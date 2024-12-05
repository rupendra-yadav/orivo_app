class Pf {
  String? unit;
  double? value;

  Pf({this.unit, this.value});

  Pf.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    value = (json['value'] is double) ? json['value'].toDouble() : json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit'] = this.unit;
    data['value'] = this.value;
    return data;
  }
}
