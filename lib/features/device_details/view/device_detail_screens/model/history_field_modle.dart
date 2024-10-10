import 'history_filter_model.dart';

class HistoryFieldModel {
  List<Filters>? filters;

  HistoryFieldModel({this.filters});

  HistoryFieldModel.fromJson(Map<String, dynamic> json) {
    if (json['filters'] != null) {
      filters = <Filters>[];
      json['filters'].forEach((v) {
        filters!.add(Filters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (filters != null) {
      data['filters'] = filters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}