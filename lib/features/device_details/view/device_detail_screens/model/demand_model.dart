import 'avg_demand_model.dart';

class DemandModel {
  AvgDemand? avgDemand;
  AvgDemand? currentDemand;

  DemandModel({this.avgDemand, this.currentDemand});

  DemandModel.fromJson(Map<String, dynamic> json) {
    avgDemand = json['avg_demand'] != null
        ? AvgDemand.fromJson(json['avg_demand'])
        : null;
    currentDemand = json['current_demand'] != null
        ? AvgDemand.fromJson(json['current_demand'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (avgDemand != null) {
      data['avg_demand'] = avgDemand!.toJson();
    }
    if (currentDemand != null) {
      data['current_demand'] = currentDemand!.toJson();
    }
    return data;
  }
}
