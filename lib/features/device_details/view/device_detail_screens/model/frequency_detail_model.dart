import 'average_freq_model.dart';
import 'freq_time_line_modle.dart';

class FrequencyDetailsModel {
  AvgFreq? avgFreq;
  AvgFreq? freq;
  FreqTimeline? freqTimeline;
  AvgFreq? highestFreq;

  FrequencyDetailsModel(
      {this.avgFreq, this.freq, this.freqTimeline, this.highestFreq});

  FrequencyDetailsModel.fromJson(Map<String, dynamic> json) {
    avgFreq = json['avg_freq'] != null
        ? new AvgFreq.fromJson(json['avg_freq'])
        : null;
    freq = json['freq'] != null ? new AvgFreq.fromJson(json['freq']) : null;
    freqTimeline = json['freq_timeline'] != null
        ? new FreqTimeline.fromJson(json['freq_timeline'])
        : null;
    highestFreq = json['highest_freq'] != null
        ? new AvgFreq.fromJson(json['highest_freq'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.avgFreq != null) {
      data['avg_freq'] = this.avgFreq!.toJson();
    }
    if (this.freq != null) {
      data['freq'] = this.freq!.toJson();
    }
    if (this.freqTimeline != null) {
      data['freq_timeline'] = this.freqTimeline!.toJson();
    }
    if (this.highestFreq != null) {
      data['highest_freq'] = this.highestFreq!.toJson();
    }
    return data;
  }
}