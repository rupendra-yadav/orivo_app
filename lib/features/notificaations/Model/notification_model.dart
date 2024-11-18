class NotificationModel {
  String? mNotifId;
  String? mNotifTitle;
  String? mNotifCategory;
  String? mNotifDate;
  String? mNotifImage;
  String? mNotifMediaLink;
  String? mNotifMessage;
  String? mNotifSendTo;
  String? mNotifSendBy;
  String? mNotifAddedon;

  NotificationModel(
      {this.mNotifId,
        this.mNotifTitle,
        this.mNotifCategory,
        this.mNotifDate,
        this.mNotifImage,
        this.mNotifMediaLink,
        this.mNotifMessage,
        this.mNotifSendTo,
        this.mNotifSendBy,
        this.mNotifAddedon});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    mNotifId = json['m_notif_id'];
    mNotifTitle = json['m_notif_title'];
    mNotifCategory = json['m_notif_category'];
    mNotifDate = json['m_notif_date'];
    mNotifImage = json['m_notif_image'];
    mNotifMediaLink = json['m_notif_media_link'];
    mNotifMessage = json['m_notif_message'];
    mNotifSendTo = json['m_notif_send_to'];
    mNotifSendBy = json['m_notif_send_by'];
    mNotifAddedon = json['m_notif_addedon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['m_notif_id'] = this.mNotifId;
    data['m_notif_title'] = this.mNotifTitle;
    data['m_notif_category'] = this.mNotifCategory;
    data['m_notif_date'] = this.mNotifDate;
    data['m_notif_image'] = this.mNotifImage;
    data['m_notif_media_link'] = this.mNotifMediaLink;
    data['m_notif_message'] = this.mNotifMessage;
    data['m_notif_send_to'] = this.mNotifSendTo;
    data['m_notif_send_by'] = this.mNotifSendBy;
    data['m_notif_addedon'] = this.mNotifAddedon;
    return data;
  }
}