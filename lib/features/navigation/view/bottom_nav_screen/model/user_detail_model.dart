class UserModel {

  String mCustId;
  String mCustName;
  String mCustUniqueId;
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
  String mCustAddress;
  String mCustPincode;
  String mCustCompanyType;
  String mCustOwnerName;
  String mCustGstno;
  String mCustFcmtoken;
  String mCustStatus;
  String mCustAddedon;
  String mCustUpdatedon;

  UserModel(
      {required this.mCustId,
        required this.mCustName,
        required this.mCustUniqueId,
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
        required this.mCustAddress,
        required this.mCustPincode,
        required this.mCustCompanyType,
        required this.mCustOwnerName,
        required this.mCustGstno,
        required this.mCustFcmtoken,
        required this.mCustStatus,
        required this.mCustAddedon,
        required this.mCustUpdatedon});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
    mCustId : json['m_cust_id']?? '',
    mCustName : json['m_cust_name']?? '',
    mCustUniqueId : json['m_cust_unique_id']?? '',
    mCustDesig : json['m_cust_desig']?? '',
    mCustMobile : json['m_cust_mobile']?? '',
    mCustEmail : json['m_cust_email']?? '',
    mCustImage : json['m_cust_image']?? '',
    mCustDob : json['m_cust_dob']?? '',
    mCustPass : json['m_cust_pass']?? '',
    mCustOtp : json['m_cust_otp']?? '',
    mCustCompany : json['m_cust_company']?? '',
    mCustState : json['m_cust_state']?? '',
    mCustCity : json['m_cust_city']?? '',
    mCustAddress : json['m_cust_address']?? '',
    mCustPincode : json['m_cust_pincode']?? '',
    mCustCompanyType : json['m_cust_company_type']?? '',
    mCustOwnerName : json['m_cust_owner_name']?? '',
    mCustGstno : json['m_cust_gstno']?? '',
    mCustFcmtoken : json['m_cust_fcmtoken']?? '',
    mCustStatus : json['m_cust_status']?? '',
    mCustAddedon : json['m_cust_addedon']?? '',
    mCustUpdatedon : json['m_cust_updatedon']?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['m_cust_id'] = this.mCustId;
    data['m_cust_name'] = this.mCustName;
    data['m_cust_unique_id'] = this.mCustUniqueId;
    data['m_cust_desig'] = this.mCustDesig;
    data['m_cust_mobile'] = this.mCustMobile;
    data['m_cust_email'] = this.mCustEmail;
    data['m_cust_image'] = this.mCustImage;
    data['m_cust_dob'] = this.mCustDob;
    data['m_cust_pass'] = this.mCustPass;
    data['m_cust_otp'] = this.mCustOtp;
    data['m_cust_company'] = this.mCustCompany;
    data['m_cust_state'] = this.mCustState;
    data['m_cust_city'] = this.mCustCity;
    data['m_cust_address'] = this.mCustAddress;
    data['m_cust_pincode'] = this.mCustPincode;
    data['m_cust_company_type'] = this.mCustCompanyType;
    data['m_cust_owner_name'] = this.mCustOwnerName;
    data['m_cust_gstno'] = this.mCustGstno;
    data['m_cust_fcmtoken'] = this.mCustFcmtoken;
    data['m_cust_status'] = this.mCustStatus;
    data['m_cust_addedon'] = this.mCustAddedon;
    data['m_cust_updatedon'] = this.mCustUpdatedon;
    return data;
  }
}

