class DeviceListModel {
  String mMachineId;
  String mMachineTitle;
  String mMachineType;
  String mMachineImage;
  String mMachineDesc;
  String mMachineOrder;
  String mMachineStatus;
  String mMachineAddedon;
  String mMachineUpdatedon;
  String mMachinePower;
  String mMtId;
  String mMtTitle;
  String mMtImage;
  String mMtOrder;
  String mMtStatus;
  String mMtAddedon;
  String mMtUpdatedon;

  DeviceListModel(
      {required this.mMachineId,
      required this.mMachineTitle,
      required this.mMachineType,
      required this.mMachineImage,
      required this.mMachineDesc,
      required this.mMachineOrder,
      required this.mMachineStatus,
      required this.mMachineAddedon,
      required this.mMachineUpdatedon,
      required this.mMachinePower,
      required this.mMtId,
      required this.mMtTitle,
      required this.mMtImage,
      required this.mMtOrder,
      required this.mMtStatus,
      required this.mMtAddedon,
      required this.mMtUpdatedon});

  factory DeviceListModel.fromJson(Map<String, dynamic> json) {
    return DeviceListModel(
      mMachineId: json['m_machine_id'] ?? '',
      mMachineTitle: json['m_machine_title'] ?? '',
      mMachineType: json['m_machine_type'] ?? '',
      mMachineImage: json['m_machine_image'] ?? '',
      mMachineDesc: json['m_machine_desc'] ?? '',
      mMachineOrder: json['m_machine_order'] ?? '',
      mMachineStatus: json['m_machine_status'] ?? '',
      mMachineAddedon: json['m_machine_addedon'] ?? '',
      mMachineUpdatedon: json['m_machine_updatedon'] ?? '',
      mMachinePower: json['m_machine_power'] ?? '',
      mMtId: json['m_mt_id'] ?? '',
      mMtTitle: json['m_mt_title'] ?? '',
      mMtImage: json['m_mt_image'] ?? '',
      mMtOrder: json['m_mt_order'] ?? '',
      mMtStatus: json['m_mt_status'] ?? '',
      mMtAddedon: json['m_mt_addedon'] ?? '',
      mMtUpdatedon: json['m_mt_updatedon'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['m_machine_id'] = mMachineId;
    data['m_machine_title'] = mMachineTitle;
    data['m_machine_type'] = mMachineType;
    data['m_machine_image'] = mMachineImage;
    data['m_machine_desc'] = mMachineDesc;
    data['m_machine_order'] = mMachineOrder;
    data['m_machine_status'] = mMachineStatus;
    data['m_machine_addedon'] = mMachineAddedon;
    data['m_machine_updatedon'] = mMachineUpdatedon;
    data['m_machine_power'] = mMachinePower;
    data['m_mt_id'] = mMtId;
    data['m_mt_title'] = mMtTitle;
    data['m_mt_image'] = mMtImage;
    data['m_mt_order'] = mMtOrder;
    data['m_mt_status'] = mMtStatus;
    data['m_mt_addedon'] = mMtAddedon;
    data['m_mt_updatedon'] = mMtUpdatedon;
    return data;
  }
}
