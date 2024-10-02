import 'consumption_detail_graph_model.dart';
import 'consumption_detail_normal_model.dart';

class ConsumptionDetail {
  List<dynamic>? breakTime;  // Replace Null with dynamic or another type
  List<NormalGraph>? normalGraph;
  NormalUnit? normalUnit;
  List<NormalGraph>? offPeakGraph;
  NormalUnit? offPeakUnit;
  List<NormalGraph>? onPeakGraph;
  NormalUnit? onPeakUnit;
  NormalUnit? totalUnit;

  ConsumptionDetail({
    this.breakTime,
    this.normalGraph,
    this.normalUnit,
    this.offPeakGraph,
    this.offPeakUnit,
    this.onPeakGraph,
    this.onPeakUnit,
    this.totalUnit,
  });

  ConsumptionDetail.fromJson(Map<String, dynamic> json) {
    // breakTime handling (replace Null with dynamic or appropriate class)
    if (json['break_time'] != null) {
      breakTime = json['break_time'];
    }

    // normalGraph deserialization
    if (json['normal_graph'] != null) {
      normalGraph = <NormalGraph>[];
      json['normal_graph'].forEach((v) {
        normalGraph!.add(NormalGraph.fromJson(v));
      });
    }

    // Deserialize normalUnit
    normalUnit = json['normal_unit'] != null
        ? NormalUnit.fromJson(json['normal_unit'])
        : null;

    // offPeakGraph deserialization
    if (json['off_peak_graph'] != null) {
      offPeakGraph = <NormalGraph>[];
      json['off_peak_graph'].forEach((v) {
        offPeakGraph!.add(NormalGraph.fromJson(v));
      });
    }

    // Deserialize offPeakUnit
    offPeakUnit = json['off_peak_unit'] != null
        ? NormalUnit.fromJson(json['off_peak_unit'])
        : null;

    // onPeakGraph deserialization
    if (json['on_peak_graph'] != null) {
      onPeakGraph = <NormalGraph>[];
      json['on_peak_graph'].forEach((v) {
        onPeakGraph!.add(NormalGraph.fromJson(v));
      });
    }

    // Deserialize onPeakUnit
    onPeakUnit = json['on_peak_unit'] != null
        ? NormalUnit.fromJson(json['on_peak_unit'])
        : null;

    // Deserialize totalUnit
    totalUnit = json['total_unit'] != null
        ? NormalUnit.fromJson(json['total_unit'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    // Handle breakTime (replace with appropriate data if needed)
    if (this.breakTime != null) {
      data['break_time'] = this.breakTime;
    }

    // Serialize normalGraph
    if (this.normalGraph != null) {
      data['normal_graph'] = this.normalGraph!.map((v) => v.toJson()).toList();
    }

    // Serialize normalUnit
    if (this.normalUnit != null) {
      data['normal_unit'] = this.normalUnit!.toJson();
    }

    // Serialize offPeakGraph
    if (this.offPeakGraph != null) {
      data['off_peak_graph'] =
          this.offPeakGraph!.map((v) => v.toJson()).toList();
    }

    // Serialize offPeakUnit
    if (this.offPeakUnit != null) {
      data['off_peak_unit'] = this.offPeakUnit!.toJson();
    }

    // Serialize onPeakGraph
    if (this.onPeakGraph != null) {
      data['on_peak_graph'] = this.onPeakGraph!.map((v) => v.toJson()).toList();
    }

    // Serialize onPeakUnit
    if (this.onPeakUnit != null) {
      data['on_peak_unit'] = this.onPeakUnit!.toJson();
    }

    // Serialize totalUnit
    if (this.totalUnit != null) {
      data['total_unit'] = this.totalUnit!.toJson();
    }

    return data;
  }
}
