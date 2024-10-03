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
        ? new AvgCurrent.fromJson(json['avg_current'])
        : null;
    avgFreq = json['avg_freq'] != null
        ? new AvgCurrent.fromJson(json['avg_freq'])
        : null;
    avgPf = json['avg_pf'] != null ? new AvgCurrent.fromJson(json['avg_pf']) : null;
    avgVolt = json['avg_volt'] != null
        ? new AvgCurrent.fromJson(json['avg_volt'])
        : null;
    current = json['current'] != null
        ? new AvgCurrent.fromJson(json['current'])
        : null;
    freq = json['freq'] != null ? new AvgCurrent.fromJson(json['freq']) : null;
    highestCurrent = json['highest_current'] != null
        ? new AvgCurrent.fromJson(json['highest_current'])
        : null;
    highestFreq = json['highest_freq'] != null
        ? new AvgCurrent.fromJson(json['highest_freq'])
        : null;
    highestPf = json['highest_pf'] != null
        ? new AvgCurrent.fromJson(json['highest_pf'])
        : null;
    highestVolt = json['highest_volt'] != null
        ? new AvgCurrent.fromJson(json['highest_volt'])
        : null;
    lowestPf = json['lowest_pf'] != null
        ? new AvgCurrent.fromJson(json['lowest_pf'])
        : null;
    totalPf =
    json['total_pf'] != null ? new AvgCurrent.fromJson(json['total_pf']) : null;
    volt = json['volt'] != null ? new AvgCurrent.fromJson(json['volt']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.avgCurrent != null) {
      data['avg_current'] = this.avgCurrent!.toJson();
    }
    if (this.avgFreq != null) {
      data['avg_freq'] = this.avgFreq!.toJson();
    }
    if (this.avgPf != null) {
      data['avg_pf'] = this.avgPf!.toJson();
    }
    if (this.avgVolt != null) {
      data['avg_volt'] = this.avgVolt!.toJson();
    }
    if (this.current != null) {
      data['current'] = this.current!.toJson();
    }
    if (this.freq != null) {
      data['freq'] = this.freq!.toJson();
    }
    if (this.highestCurrent != null) {
      data['highest_current'] = this.highestCurrent!.toJson();
    }
    if (this.highestFreq != null) {
      data['highest_freq'] = this.highestFreq!.toJson();
    }
    if (this.highestPf != null) {
      data['highest_pf'] = this.highestPf!.toJson();
    }
    if (this.highestVolt != null) {
      data['highest_volt'] = this.highestVolt!.toJson();
    }
    if (this.lowestPf != null) {
      data['lowest_pf'] = this.lowestPf!.toJson();
    }
    if (this.totalPf != null) {
      data['total_pf'] = this.totalPf!.toJson();
    }
    if (this.volt != null) {
      data['volt'] = this.volt!.toJson();
    }
    return data;
  }
}