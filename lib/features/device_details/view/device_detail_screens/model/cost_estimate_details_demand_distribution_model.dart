class DemandDistribution {
  int? cost;
  int? demand;
  String? end;
  int? rate;
  String? start;

  DemandDistribution({this.cost, this.demand, this.end, this.rate, this.start});

  DemandDistribution.fromJson(Map<String, dynamic> json) {
    cost = (json['cost'] is double) ? (json['cost'] as double).toInt() : json['cost'] as int?;
    demand = (json['demand'] is double) ? (json['demand'] as double).toInt() : json['demand'] as int?;
    rate = (json['rate'] is double) ? (json['rate'] as double).toInt() : json['rate'] as int?;
    end = json['end'];
    start = json['start'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cost'] = this.cost;
    data['demand'] = this.demand;
    data['end'] = this.end;
    data['rate'] = this.rate;
    data['start'] = this.start;
    return data;
  }
}
