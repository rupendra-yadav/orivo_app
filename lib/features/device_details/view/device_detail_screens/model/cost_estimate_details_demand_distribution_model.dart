
class DemandDistribution {
  int? cost;
  int? demand;
  String? end;
  int? rate;
  String? start;

  DemandDistribution({this.cost, this.demand, this.end, this.rate, this.start});

  DemandDistribution.fromJson(Map<String, dynamic> json) {
    cost = json['cost'];
    demand = json['demand'];
    end = json['end'];
    rate = json['rate'];
    start = json['start'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cost'] = this.cost;
    data['demand'] = this.demand;
    data['end'] = this.end;
    data['rate'] = this.rate;
    data['start'] = this.start;
    return data;
  }
}