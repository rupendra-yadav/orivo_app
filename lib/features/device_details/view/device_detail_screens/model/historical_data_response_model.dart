class HistoricalDataResponse {
  final String? status;
  final String? statusNo;
  final String? message;
  final HistoricalData? data;

  HistoricalDataResponse({
    this.status,
    this.statusNo,
    this.message,
    this.data,
  });

  factory HistoricalDataResponse.fromJson(Map<String, dynamic> json) {
    return HistoricalDataResponse(
      status: json['status'],
      statusNo: json['status_no'].toString(),
      message: json['message'],
      data: json['data'] != null ? HistoricalData.fromJson(json['data']) : null,
    );
  }
}

class HistoricalData {
  final List<HistoricalPoint>? value;

  HistoricalData({this.value});

  factory HistoricalData.fromJson(Map<String, dynamic> json) {
    return HistoricalData(
      value: (json['value'] as List?)
          ?.map((e) => HistoricalPoint.fromJson(e))
          .toList(),
    );
  }
}

class HistoricalPoint {
  final DateTime? x;
  final double? y;

  HistoricalPoint({this.x, this.y});

  factory HistoricalPoint.fromJson(Map<String, dynamic> json) {
    return HistoricalPoint(
      x: json['x'] != null ? DateTime.tryParse(json['x']) : null,
      y: (json['y'] as num?)?.toDouble(),
    );
  }
}
