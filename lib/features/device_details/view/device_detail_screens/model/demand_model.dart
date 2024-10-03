import 'avg_demand_model.dart';

class DemandModel {
  AvgDemand? avgDemand;
  AvgDemand? currentDemand;

  DemandModel({this.avgDemand, this.currentDemand});

  DemandModel.fromJson(Map<String, dynamic> json) {
    avgDemand = json['avg_demand'] != null
        ? new AvgDemand.fromJson(json['avg_demand'])
        : null;
    currentDemand = json['current_demand'] != null
        ? new AvgDemand.fromJson(json['current_demand'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.avgDemand != null) {
      data['avg_demand'] = this.avgDemand!.toJson();
    }
    if (this.currentDemand != null) {
      data['current_demand'] = this.currentDemand!.toJson();
    }
    return data;
  }
}
