import 'history_filter_data_model.dart';

class HistoryModel {
  List<Filters>? filters;

  HistoryModel({this.filters});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['value'] != null) {
      filters = <Filters>[];
      json['value'].forEach((v) {
        filters!.add(Filters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (filters != null) {
      data['value'] = filters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}