class Demand {
  String? unit;
  double? value;

  Demand({this.unit, this.value});

  Demand.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    // Handle both double and int values by converting int to double if necessary
    value = (json['value'] is int) ? (json['value'] as int).toDouble() : json['value']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit'] = this.unit;
    data['value'] = this.value;
    return data;
  }
}
