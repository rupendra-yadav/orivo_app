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
        ? new AvgDemand.fromJson(json['avg_demand'])
        : null;
    currentDemand = json['current_demand'] != null
        ? new AvgDemand.fromJson(json['current_demand'])
        : null;
    highestDemand = json['highest_demand'] != null
        ? new AvgDemand.fromJson(json['highest_demand'])
        : null;
    loadFactor = json['load_factor'] != null
        ? new AvgDemand.fromJson(json['load_factor'])
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
    if (this.highestDemand != null) {
      data['highest_demand'] = this.highestDemand!.toJson();
    }
    if (this.loadFactor != null) {
      data['load_factor'] = this.loadFactor!.toJson();
    }
    return data;
  }
}
