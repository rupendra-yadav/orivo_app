class NormalGraph {
  String? x;
  double? y;

  NormalGraph({this.x, this.y});

  NormalGraph.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    // Convert 'y' to double if it's an int
    y = (json['y'] is int) ? (json['y'] as int).toDouble() : json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['x'] = x;
    data['y'] = y;
    return data;
  }
}
