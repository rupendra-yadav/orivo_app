import 'avg_demand_model.dart';

class DemandDetailModel {
  AvgDemand? avgDemand;
  AvgDemand? currentDemand;
  AvgDemand? highestDemand;
  AvgDemand? loadFactor;

  DemandDetailModel(
      {this.avgDemand,
        this.currentDemand,
        this.highestDemand,
        this.loadFactor});

  DemandDetailModel.fromJson(Map<String, dynamic> json) {
    avgDemand = json['avg_demand'] != null
        ? AvgDemand.fromJson(json['avg_demand'])
        : null;
    currentDemand = json['current_demand'] != null
        ? AvgDemand.fromJson(json['current_demand'])
        : null;
    highestDemand = json['highest_demand'] != null
        ? AvgDemand.fromJson(json['highest_demand'])
        : null;
    loadFactor = json['load_factor'] != null
        ? AvgDemand.fromJson(json['load_factor'])
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
    if (highestDemand != null) {
      data['highest_demand'] = highestDemand!.toJson();
    }
    if (loadFactor != null) {
      data['load_factor'] = loadFactor!.toJson();
    }
    return data;
  }
}
