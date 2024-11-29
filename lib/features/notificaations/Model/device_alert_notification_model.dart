class DeviceAlertNotificationModel {
  String? mNotifId;
  String? mNotifTitle;
  String? mNotifMachine;
  String? mNotifDate;
  String? mNotifTime;
  String? mNotifImage;
  String? mNotifSubText;
  String? mNotifMessage;
  String? mNotifAddedon;

  DeviceAlertNotificationModel(
      {this.mNotifId,
        this.mNotifTitle,
        this.mNotifMachine,
        this.mNotifDate,
        this.mNotifTime,
        this.mNotifImage,
        this.mNotifSubText,
        this.mNotifMessage,
        this.mNotifAddedon});

  DeviceAlertNotificationModel.fromJson(Map<String, dynamic> json) {
    mNotifId = json['m_notif_id'];
    mNotifTitle = json['m_notif_title'];
    mNotifMachine = json['m_notif_machine'];
    mNotifDate = json['m_notif_date'];
    mNotifTime = json['m_notif_time'];
    mNotifImage = json['m_notif_image'];
    mNotifSubText = json['m_notif_sub_text'];
    mNotifMessage = json['m_notif_message'];
    mNotifAddedon = json['m_notif_addedon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['m_notif_id'] = this.mNotifId;
    data['m_notif_title'] = this.mNotifTitle;
    data['m_notif_machine'] = this.mNotifMachine;
    data['m_notif_date'] = this.mNotifDate;
    data['m_notif_time'] = this.mNotifTime;
    data['m_notif_image'] = this.mNotifImage;
    data['m_notif_sub_text'] = this.mNotifSubText;
    data['m_notif_message'] = this.mNotifMessage;
    data['m_notif_addedon'] = this.mNotifAddedon;
    return data;
  }
}