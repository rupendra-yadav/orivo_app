// class DeviceAlertNotificationModel {
//   String? mNotifId;
//   String? mNotifTitle;
//   String? mNotifMachine;
//   String? mNotifDate;
//   String? mNotifTime;
//   String? mNotifImage;
//   String? mNotifSubText;
//   String? mNotifMessage;
//   String? mNotifAddedon;

//   DeviceAlertNotificationModel(
//       {this.mNotifId,
//         this.mNotifTitle,
//         this.mNotifMachine,
//         this.mNotifDate,
//         this.mNotifTime,
//         this.mNotifImage,
//         this.mNotifSubText,
//         this.mNotifMessage,
//         this.mNotifAddedon});

//   DeviceAlertNotificationModel.fromJson(Map<String, dynamic> json) {
//     mNotifId = json['m_notif_id'];
//     mNotifTitle = json['m_notif_title'];
//     mNotifMachine = json['m_notif_machine'];
//     mNotifDate = json['m_notif_date'];
//     mNotifTime = json['m_notif_time'];
//     mNotifImage = json['m_notif_image'];
//     mNotifSubText = json['m_notif_sub_text'];
//     mNotifMessage = json['m_notif_message'];
//     mNotifAddedon = json['m_notif_addedon'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['m_notif_id'] = this.mNotifId;
//     data['m_notif_title'] = this.mNotifTitle;
//     data['m_notif_machine'] = this.mNotifMachine;
//     data['m_notif_date'] = this.mNotifDate;
//     data['m_notif_time'] = this.mNotifTime;
//     data['m_notif_image'] = this.mNotifImage;
//     data['m_notif_sub_text'] = this.mNotifSubText;
//     data['m_notif_message'] = this.mNotifMessage;
//     data['m_notif_addedon'] = this.mNotifAddedon;
//     return data;
//   }
// }

class DeviceAlertNotificationModel {
  String? createdAt;
  String? title;
  String? message;
  String? cardLink;
  String? alertType;
  String? alertLevel;
  String? status;
  String? deviceName;
  String? deviceStatus;
  String? installationLocation;
  String? factoryName;
  String? factoryCode;

  DeviceAlertNotificationModel({
    this.createdAt,
    this.title,
    this.message,
    this.cardLink,
    this.alertType,
    this.alertLevel,
    this.status,
    this.deviceName,
    this.deviceStatus,
    this.installationLocation,
    this.factoryName,
    this.factoryCode,
  });

  factory DeviceAlertNotificationModel.fromJson(Map<String, dynamic> json) {
    return DeviceAlertNotificationModel(
      createdAt: json['created_at'],
      title: json['title'],
      message: json['message'],
      cardLink: json['card_link'],
      alertType: json['alert_type'],
      alertLevel: json['alert_level'],
      status: json['status'],
      deviceName: json['Device_Name'],
      deviceStatus: json['Device_Status'],
      installationLocation: json['Installation_Location'],
      factoryName: json['Factory_Name'],
      factoryCode: json['Factory_Code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'created_at': createdAt,
      'title': title,
      'message': message,
      'card_link': cardLink,
      'alert_type': alertType,
      'alert_level': alertLevel,
      'status': status,
      'Device_Name': deviceName,
      'Device_Status': deviceStatus,
      'Installation_Location': installationLocation,
      'Factory_Name': factoryName,
      'Factory_Code': factoryCode,
    };
  }
}
