class UserDetail {
  String mCustId;
  String mCustName;
  String mCustDesig;
  String mCustMobile;
  String mCustEmail;
  String mCustImage;
  String mCustDob;
  String mCustPass;
  String mCustOtp;
  String mCustCompany;
  String mCustState;
  String mCustCity;
  String mCustPincode;
  String mCustStatus;
  String mCustAddedon;
  String mCustUpdatedon;

  UserDetail(
      {required this.mCustId,
      required this.mCustName,
      required this.mCustDesig,
      required this.mCustMobile,
      required this.mCustEmail,
      required this.mCustImage,
      required this.mCustDob,
      required this.mCustPass,
      required this.mCustOtp,
      required this.mCustCompany,
      required this.mCustState,
      required this.mCustCity,
      required this.mCustPincode,
      required this.mCustStatus,
      required this.mCustAddedon,
      required this.mCustUpdatedon});

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      mCustId: json['m_cust_id'] ?? '',
      mCustName: json['m_cust_name'] ?? '',
      mCustDesig: json['m_cust_desig'] ?? '',
      mCustMobile: json['m_cust_mobile'] ?? '',
      mCustEmail: json['m_cust_email'] ?? '',
      mCustImage: json['m_cust_image'] ?? '',
      mCustDob: json['m_cust_dob'] ?? '',
      mCustPass: json['m_cust_pass'] ?? '',
      mCustOtp: json['m_cust_otp'] ?? '',
      mCustCompany: json['m_cust_company'] ?? '',
      mCustState: json['m_cust_state'] ?? '',
      mCustCity: json['m_cust_city'] ?? '',
      mCustPincode: json['m_cust_pincode'] ?? '',
      mCustStatus: json['m_cust_status'] ?? '',
      mCustAddedon: json['m_cust_addedon'] ?? '',
      mCustUpdatedon: json['m_cust_updatedon'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['m_cust_id'] = mCustId;
    data['m_cust_name'] = mCustName;
    data['m_cust_desig'] = mCustDesig;
    data['m_cust_mobile'] = mCustMobile;
    data['m_cust_email'] = mCustEmail;
    data['m_cust_image'] = mCustImage;
    data['m_cust_dob'] = mCustDob;
    data['m_cust_pass'] = mCustPass;
    data['m_cust_otp'] = mCustOtp;
    data['m_cust_company'] = mCustCompany;
    data['m_cust_state'] = mCustState;
    data['m_cust_city'] = mCustCity;
    data['m_cust_pincode'] = mCustPincode;
    data['m_cust_status'] = mCustStatus;
    data['m_cust_addedon'] = mCustAddedon;
    data['m_cust_updatedon'] = mCustUpdatedon;
    return data;
  }
}
