class UserModel2 {
  final String mobileNo;
  final String name;
  final String profileImagePath;
  final String companyName;
  final String city;
  final String state;
  final String address;
  final String pinCode;
  final String companyType;
  final String gstNo;

  UserModel2({
    required this.mobileNo,
    required this.name,
    required this.profileImagePath,
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
      profileImagePath: json['profile_image_path'] ?? '',
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
    return {
      'mobile_no': mobileNo,
      'name': name,
      'profile_image_path': profileImagePath,
      'company_name': companyName,
      'city': city,
      'state': state,
      'address': address,
      'pincode': pinCode,
      'company_type': companyType,
      'gst_no': gstNo,
    };
  }
}
