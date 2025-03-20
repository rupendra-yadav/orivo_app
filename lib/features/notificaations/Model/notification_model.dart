class NotificationModel {
  String createdAt;
  String title;
  String message;
  String cardLink;
  String alertType;
  String status;

  NotificationModel({
    required this.createdAt,
    required this.title,
    required this.message,
    required this.cardLink,
    required this.alertType,
    required this.status,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      createdAt: json['created_at'] ?? "",
      title: json['title'] ?? "",
      message: json['message'] ?? "",
      cardLink: json['card_link'] ?? "",
      alertType: json['alert_type'] ?? "",
      status: json['status'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created_at'] = createdAt;
    data['title'] = title;
    data['message'] = message;
    data['card_link'] = cardLink;
    data['alert_type'] = alertType;
    data['status'] = status;

    return data;
  }
}
