class UserModel2 {
  String mobileNo;
  String name;
  String companyName;
  String city;
  String state;
  String address;
  String pinCode;
  String companyType;
  String gstNo;

  UserModel2({
    required this.mobileNo,
    required this.name,
    required this.companyName,
    required this.city,
    required this.state,
    required this.address,
    required this.pinCode,
    required this.companyType,
    required this.gstNo,
  });

  factory UserModel2.fromJson(Map<String, dynamic> json) {
    return UserModel2(
      mobileNo: json['mobile_no'] ?? '',
      name: json['name'] ?? '',
      companyName: json['company_name'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      address: json['address'] ?? '',
      pinCode: json['pincode'] ?? '',
      companyType: json['company_type'] ?? '',
      gstNo: json['gst_no'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile_no'] = mobileNo;
    data['name'] = name;
    data['company_name'] = companyName;
    data['city'] = city;
    data['state'] = state;
    data['address'] = address;
    data['pincode'] = pinCode;
    data['company_type'] = companyType;
    data['gst_no'] = gstNo;

    return data;
  }
}
