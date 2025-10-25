class BaseMetricResponseModel {
  String? status;
  String? statusNo;
  String? message;
  MetricData? data;

  BaseMetricResponseModel(
      {this.status, this.statusNo, this.message, this.data});

  BaseMetricResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusNo = json['status_no'].toString();
    message = json['message'];
    data = json['data'] != null ? MetricData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'status_no': statusNo,
        'message': message,
        if (data != null) 'data': data!.toJson(),
      };
}

class MetricData {
  VoltageMetrics? voltage;
  CurrentMetrics? current;
  FrequencyMetrics? frequency;
  PowerQualityMetrics? powerQuality;

  MetricData({this.voltage, this.current, this.frequency, this.powerQuality});

  MetricData.fromJson(Map<String, dynamic> json) {
    voltage = json['voltage'] != null
        ? VoltageMetrics.fromJson(json['voltage'])
        : null;
    current = json['current'] != null
        ? CurrentMetrics.fromJson(json['current'])
        : null;
    frequency = json['frequency'] != null
        ? FrequencyMetrics.fromJson(json['frequency'])
        : null;
    powerQuality = json['power_quality'] != null
        ? PowerQualityMetrics.fromJson(json['power_quality'])
        : null;
  }

  Map<String, dynamic> toJson() => {
        if (voltage != null) 'voltage': voltage!.toJson(),
        if (current != null) 'current': current!.toJson(),
        if (frequency != null) 'frequency': frequency!.toJson(),
        if (powerQuality != null) 'power_quality': powerQuality!.toJson(),
      };
}

//
// ----------- VOLTAGE --------------
//
class VoltageMetrics {
  NumericValue? current;
  NumericValue? average;
  NumericValue? highest;
  List<VoltageTimelinePoint>? timeline;

  VoltageMetrics({this.current, this.average, this.highest, this.timeline});

  VoltageMetrics.fromJson(Map<String, dynamic> json) {
    current =
        json['current'] != null ? NumericValue.fromJson(json['current']) : null;
    average =
        json['average'] != null ? NumericValue.fromJson(json['average']) : null;
    highest =
        json['highest'] != null ? NumericValue.fromJson(json['highest']) : null;
    if (json['timeline'] != null) {
      timeline = (json['timeline'] as List)
          .map((v) => VoltageTimelinePoint.fromJson(v))
          .toList();
    }
  }

  Map<String, dynamic> toJson() => {
        if (current != null) 'current': current!.toJson(),
        if (average != null) 'average': average!.toJson(),
        if (highest != null) 'highest': highest!.toJson(),
        if (timeline != null)
          'timeline': timeline!.map((v) => v.toJson()).toList(),
      };
}

class VoltageTimelinePoint {
  String? x;
  double? y;

  VoltageTimelinePoint({this.x, this.y});

  VoltageTimelinePoint.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = (json['y'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() => {
        'x': x,
        'y': y,
      };
}

//
// ----------- CURRENT --------------
//
class CurrentMetrics {
  NumericValue? current;
  NumericValue? average;
  NumericValue? highest;
  CurrentTimelineSeries? timeline;

  CurrentMetrics({this.current, this.average, this.highest, this.timeline});

  CurrentMetrics.fromJson(Map<String, dynamic> json) {
    current =
        json['current'] != null ? NumericValue.fromJson(json['current']) : null;
    average =
        json['average'] != null ? NumericValue.fromJson(json['average']) : null;
    highest =
        json['highest'] != null ? NumericValue.fromJson(json['highest']) : null;
    timeline = json['timeline'] != null
        ? CurrentTimelineSeries.fromJson(json['timeline'])
        : null;
  }

  Map<String, dynamic> toJson() => {
        if (current != null) 'current': current!.toJson(),
        if (average != null) 'average': average!.toJson(),
        if (highest != null) 'highest': highest!.toJson(),
        if (timeline != null) 'timeline': timeline!.toJson(),
      };
}

class CurrentTimelineSeries {
  List<CurrentTimelinePoint>? ia;
  List<CurrentTimelinePoint>? ib;
  List<CurrentTimelinePoint>? ic;

  CurrentTimelineSeries({this.ia, this.ib, this.ic});

  CurrentTimelineSeries.fromJson(Map<String, dynamic> json) {
    ia = (json['ia'] as List?)
        ?.map((v) => CurrentTimelinePoint.fromJson(v))
        .toList();
    ib = (json['ib'] as List?)
        ?.map((v) => CurrentTimelinePoint.fromJson(v))
        .toList();
    ic = (json['ic'] as List?)
        ?.map((v) => CurrentTimelinePoint.fromJson(v))
        .toList();
  }

  Map<String, dynamic> toJson() => {
        if (ia != null) 'ia': ia!.map((v) => v.toJson()).toList(),
        if (ib != null) 'ib': ib!.map((v) => v.toJson()).toList(),
        if (ic != null) 'ic': ic!.map((v) => v.toJson()).toList(),
      };
}

//
// ----------- FREQUENCY (reuses VoltageMetrics structure) --------------
//
typedef FrequencyMetrics = VoltageMetrics;

//
// ----------- POWER QUALITY --------------
//
class PowerQualityMetrics {
  NumericValue? currentPf;
  NumericValue? averagePf;
  NumericValue? highestPf;
  NumericValue? lowestPf;
  List<PowerQualityTimelinePoint>? timeline;

  PowerQualityMetrics(
      {this.currentPf,
      this.averagePf,
      this.highestPf,
      this.lowestPf,
      this.timeline});

  PowerQualityMetrics.fromJson(Map<String, dynamic> json) {
    currentPf = json['current_pf'] != null
        ? NumericValue.fromJson(json['current_pf'])
        : null;
    averagePf = json['average_pf'] != null
        ? NumericValue.fromJson(json['average_pf'])
        : null;
    highestPf = json['highest_pf'] != null
        ? NumericValue.fromJson(json['highest_pf'])
        : null;
    lowestPf = json['lowest_pf'] != null
        ? NumericValue.fromJson(json['lowest_pf'])
        : null;
    if (json['timeline'] != null) {
      timeline = (json['timeline'] as List)
          .map((v) => PowerQualityTimelinePoint.fromJson(v))
          .toList();
    }
  }

  Map<String, dynamic> toJson() => {
        if (currentPf != null) 'current_pf': currentPf!.toJson(),
        if (averagePf != null) 'average_pf': averagePf!.toJson(),
        if (highestPf != null) 'highest_pf': highestPf!.toJson(),
        if (lowestPf != null) 'lowest_pf': lowestPf!.toJson(),
        if (timeline != null)
          'timeline': timeline!.map((v) => v.toJson()).toList(),
      };
}

class PowerQualityTimelinePoint {
  String? x;
  double? y;

  PowerQualityTimelinePoint({this.x, this.y});

  PowerQualityTimelinePoint.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = (json['y'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() => {
        'x': x,
        'y': y,
      };
}

//
// ----------- COMMON NUMERIC VALUE --------------
//
class NumericValue {
  double? value;
  String? unit;

  NumericValue({this.value, this.unit});

  NumericValue.fromJson(Map<String, dynamic> json) {
    value = (json['value'] as num?)?.toDouble();
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() => {
        'value': value,
        'unit': unit,
      };
}

class CurrentTimelinePoint {
  String? x;
  double? y;

  CurrentTimelinePoint({this.x, this.y});

  CurrentTimelinePoint.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = (json['y'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() => {
        'x': x,
        'y': y,
      };
}
