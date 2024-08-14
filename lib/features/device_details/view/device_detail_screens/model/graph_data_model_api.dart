
class GraphData {
  num value;
  String label;

  GraphData({required this.value, required this.label});

  factory GraphData.fromJson(Map<String, dynamic> json) {
    return GraphData(
    value : json['value']?? '',
    label : json['label']?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['label'] = label;
    return data;
  }
}
