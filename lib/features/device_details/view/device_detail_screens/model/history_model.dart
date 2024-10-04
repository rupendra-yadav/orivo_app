import 'history_filter_data_model.dart';

class HistoryModel {
  List<Filters>? filters;

  HistoryModel({this.filters});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['filters'] != null) {
      filters = <Filters>[];
      json['filters'].forEach((v) {
        filters!.add(new Filters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.filters != null) {
      data['filters'] = this.filters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}