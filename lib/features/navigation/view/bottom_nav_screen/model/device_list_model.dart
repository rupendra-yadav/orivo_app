class DeviceListModel {
  String userDeviceId;
  String publicDeviceId;
  String imagePath;
  String model;
  String name;
  String description;
  String installationDate;
  String status;

  DeviceListModel({
    required this.userDeviceId,
    required this.publicDeviceId,
    required this.imagePath,
    required this.model,
    required this.name,
    required this.description,
    required this.installationDate,
    required this.status,
  });

  factory DeviceListModel.fromJson(Map<String, dynamic> json) {
    return DeviceListModel(
      userDeviceId: json['user_device_id'] ?? '',
      publicDeviceId: json['public_device_id'] ?? '',
      imagePath: json['image_path'] ?? '',
      model: json['model'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      installationDate: json['installation_date'] ?? '',
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_device_id'] = userDeviceId;
    data['public_device_id'] = publicDeviceId;
    data['image_path'] = imagePath;
    data['model'] = model;
    data['name'] = name;
    data['description'] = description;
    data['installation_date'] = installationDate;
    data['status'] = status;
    return data;
  }
}
