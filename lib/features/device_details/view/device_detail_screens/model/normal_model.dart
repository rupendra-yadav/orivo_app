
class NormalUnit {
  String? unit;
  double? value;  // Use double instead of Double

  NormalUnit({this.unit, this.value});

  NormalUnit.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    value = (json['value'] is int) ? (json['value'] as int).toDouble() : json['value']; // Convert int to double if necessary
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unit'] = unit;
    data['value'] = value;
    return data;
  }
}