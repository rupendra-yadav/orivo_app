import 'avg_current_model.dart';

class PowerFactorModel {
  AvgCurrent? avgCurrent;
  AvgCurrent? avgFreq;
  AvgCurrent? avgPf;
  AvgCurrent? avgVolt;
  AvgCurrent? current;
  AvgCurrent? freq;
  AvgCurrent? highestCurrent;
  AvgCurrent? highestFreq;
  AvgCurrent? highestPf;
  AvgCurrent? highestVolt;
  AvgCurrent? lowestPf;
  AvgCurrent? totalPf;
  AvgCurrent? volt;

  PowerFactorModel(
      {this.avgCurrent,
        this.avgFreq,
        this.avgPf,
        this.avgVolt,
        this.current,
        this.freq,
        this.highestCurrent,
        this.highestFreq,
        this.highestPf,
        this.highestVolt,
        this.lowestPf,
        this.totalPf,
        this.volt});

  PowerFactorModel.fromJson(Map<String, dynamic> json) {
    avgCurrent = json['avg_current'] != null
        ? AvgCurrent.fromJson(json['avg_current'])
        : null;
    avgFreq = json['avg_freq'] != null
        ? AvgCurrent.fromJson(json['avg_freq'])
        : null;
    avgPf = json['avg_pf'] != null ? AvgCurrent.fromJson(json['avg_pf']) : null;
    avgVolt = json['avg_volt'] != null
        ? AvgCurrent.fromJson(json['avg_volt'])
        : null;
    current = json['current'] != null
        ? AvgCurrent.fromJson(json['current'])
        : null;
    freq = json['freq'] != null ? AvgCurrent.fromJson(json['freq']) : null;
    highestCurrent = json['highest_current'] != null
        ? AvgCurrent.fromJson(json['highest_current'])
        : null;
    highestFreq = json['highest_freq'] != null
        ? AvgCurrent.fromJson(json['highest_freq'])
        : null;
    highestPf = json['highest_pf'] != null
        ? AvgCurrent.fromJson(json['highest_pf'])
        : null;
    highestVolt = json['highest_volt'] != null
        ? AvgCurrent.fromJson(json['highest_volt'])
        : null;
    lowestPf = json['lowest_pf'] != null
        ? AvgCurrent.fromJson(json['lowest_pf'])
        : null;
    totalPf =
    json['total_pf'] != null ? AvgCurrent.fromJson(json['total_pf']) : null;
    volt = json['volt'] != null ? AvgCurrent.fromJson(json['volt']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (avgCurrent != null) {
      data['avg_current'] = avgCurrent!.toJson();
    }
    if (avgFreq != null) {
      data['avg_freq'] = avgFreq!.toJson();
    }
    if (avgPf != null) {
      data['avg_pf'] = avgPf!.toJson();
    }
    if (avgVolt != null) {
      data['avg_volt'] = avgVolt!.toJson();
    }
    if (current != null) {
      data['current'] = current!.toJson();
    }
    if (freq != null) {
      data['freq'] = freq!.toJson();
    }
    if (highestCurrent != null) {
      data['highest_current'] = highestCurrent!.toJson();
    }
    if (highestFreq != null) {
      data['highest_freq'] = highestFreq!.toJson();
    }
    if (highestPf != null) {
      data['highest_pf'] = highestPf!.toJson();
    }
    if (highestVolt != null) {
      data['highest_volt'] = highestVolt!.toJson();
    }
    if (lowestPf != null) {
      data['lowest_pf'] = lowestPf!.toJson();
    }
    if (totalPf != null) {
      data['total_pf'] = totalPf!.toJson();
    }
    if (volt != null) {
      data['volt'] = volt!.toJson();
    }
    return data;
  }
}