class AvgVolt {
  String? unit;
  double? value;

  AvgVolt({this.unit, this.value});

    AvgVolt.fromJson(Map<String, dynamic> json) {
      unit = json['unit'];
  
      // Check if the value is an int and convert it to double, otherwise use the value as is
      if (json['value'] is int) {
        value = (json['value'] as int).toDouble(); // Convert int to double
      } else {
        value = json['value']; // Use the value as double
      }
    }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit'] = this.unit;
    data['value'] = this.value;
    return data;
  }
}
