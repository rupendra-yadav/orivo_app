import 'package:auro/features/device_details/view/device_detail_screens/model/history_field_modle.dart';

class HistoryFiltersResponse {
  final String? status;
  final int? statusNo;
  final String? message;
  final HistoryFieldModel? data;

  HistoryFiltersResponse({
    this.status,
    this.statusNo,
    this.message,
    this.data,
  });

  factory HistoryFiltersResponse.fromJson(Map<String, dynamic> json) {
    return HistoryFiltersResponse(
      status: json['status'],
      statusNo: json['status_no'],
      message: json['message'],
      data: json['data'] != null
          ? HistoryFieldModel.fromJson(json['data'])
          : null,
    );
  }
}
