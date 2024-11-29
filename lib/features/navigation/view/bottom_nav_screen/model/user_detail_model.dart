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

  String? custTotalload;
  String? custTarrifplan;
  String? custBpno;
  String? custCspcdlpass;

  String? mCustMobileActive;
  String? mCustWhatsappActive;
  String? mCustAltWhatsappActive;

  String? mCustWhatsapp;
  String? mCustAltWhatsapp;

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
        required this.mCustUpdatedon,

        required this.custTotalload,
        required this.custTarrifplan,
        required this.custBpno,
        required this.custCspcdlpass,

        required this.mCustMobileActive,
        required this.mCustWhatsappActive,
        required this.mCustAltWhatsappActive,

        required this.mCustWhatsapp,
        required this.mCustAltWhatsapp,

      });

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

      custTotalload: json['cust_totalload'] ?? '',
      custTarrifplan: json['cust_tarrifplan'] ?? '',
      custBpno: json['cust_bpno'] ?? '',
      custCspcdlpass: json['cust_cspcdlpass'] ?? '',

      mCustMobileActive: json['m_cust_mobile_active'] ?? '',
      mCustWhatsappActive: json['m_cust_whatsapp_active'] ?? '',
      mCustAltWhatsappActive: json['m_cust_alt_whatsapp_active'] ?? '',

      mCustWhatsapp: json['m_cust_whatsapp'] ?? '',
      mCustAltWhatsapp: json['m_cust_alt_whatsapp'] ?? '',


    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['m_cust_id'] = mCustId;
    data['m_cust_name'] = mCustName;
    data['m_cust_unique_id'] = mCustUniqueId;
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
    data['m_cust_address'] = mCustAddress;
    data['m_cust_pincode'] = mCustPincode;
    data['m_cust_company_type'] = mCustCompanyType;
    data['m_cust_owner_name'] = mCustOwnerName;
    data['m_cust_gstno'] = mCustGstno;
    data['m_cust_fcmtoken'] = mCustFcmtoken;
    data['m_cust_status'] = mCustStatus;
    data['m_cust_addedon'] = mCustAddedon;
    data['m_cust_updatedon'] = mCustUpdatedon;

    data['m_cust_updatedon'] = custTotalload;
    data['m_cust_updatedon'] = custTarrifplan;
    data['m_cust_updatedon'] = custBpno;
    data['m_cust_updatedon'] = custCspcdlpass;

    data['m_cust_mobile_active'] = mCustMobileActive;
    data['m_cust_whatsapp_active'] = mCustWhatsappActive;
    data['m_cust_alt_whatsapp_active'] = mCustAltWhatsappActive;

    data['m_cust_whatsapp'] = mCustWhatsapp;
    data['m_cust_alt_whatsapp'] = mCustAltWhatsapp;
    return data;
  }
}

