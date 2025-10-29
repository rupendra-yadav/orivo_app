// const String tBaseUrl = "https://webdevelopercg.com/electricity/myadmin";
const String tBaseUrl =
    "https://jbrzivlj0f.execute-api.ap-south-1.amazonaws.com/api/v1/";
// const String tBaseUrl2 = "http://3.232.30.235:5001/api/v1/";
// const String tBaseUrl3 = "http://3.232.30.235:5002/api/v1/";
const String tBaseImageUrl = "";

///End Keys
class APIKeys {
  static const String userLoginEND = "Api/user_login";
  static const String signupUserEND = "Api/signup_user";
  static const String sendOtpEND = "Api/send_otp";
  static const String verifyOtpEND = "Api/verify_otp";

  // static const String userDetailsEND = "Api/user_details";
  static const String updatePasswordEND = "Api/update_password";

  static const String machineEND = "Api/machine";
  static const String machineDetailsEND = "Api/machine_details";
  static const String notifications = "Api/notification";
  static const String deviceNotification = "Api/device_notification";
  static const String updateMachineName = "Api/update_machine_name";
  static const String updateFcm = "Api/update_fcm";

  static const String updateContacts = "Api/update_contact";
  static const String updateNotificationContact =
      "Api/update_notification_contact";

  static const String machineDetailsDataItemsEND = "readflux.php";
  static const String machineDetailsGraphDataEND = "readfieldwisedata.php";

//////////////////Version 2 API/////////////////////////////////////////////////

  ///Auth
  static const String refresh = "auth/refresh";
  static const String login = "auth/login"; //
  static const String otpSend = "otp/send"; //
  static const String otpVerify = "otp/verify"; //
  static const String authLogout = "auth/logout"; //

  ///DeviceList
  static const String userDevices = "user/devices"; //

  /// user
  static const String userProfile = "user/profile"; //
  static const String userEditProfile = "user/edit-profile";
  static const String userPhotoUpload = "user/update-profile-pic";

  /// Notifications
  static const String notificationsList = "notification/list-notifications";
  static const String deviceAlertList = "notification/list-device-alerts";
  static const String setupWhatsappAlerts =
      "notification/setup-whatsapp-alerts";

  /// energy-meter
  static const String homeScreen = "energy-meter/home-screen"; //
  static const String energyConsumptionDetails =
      "energy-meter/energy-consumption-details"; //
  static const String costEstimate = "energy-meter/cost-estimate-details"; //
  static const String demandAnalysis = "energy-meter/demand-analysis";
  static const String baseMetric = "energy-meter/base-metric";
  static const String historyFields = "energy-meter/history-field";
  static const String history = "energy-meter/history";

  /// device
  static const String editDeviceDetails = "device/edit-device-details";

  // /// whatsapp toggles
  // static const String whatsappToggles = "device/edit-device-details";

  /// electricity bills
  static const String billUpload = "energy-meter/consumer-bill/upload";
  static const String bills = "energy-meter/consumer-bill/bills"; // factory/5
  static const String billDetails = "energy-meter/consumer-bill/bill-details";

  static const String billDownloadById = "energy-meter/consumer-bill/download";
  static const String billDownloadByFactory =
      "energy-meter/consumer-bill/download-by-factory";
}

///End Keys
class APIKeys2 {
  static const String energyConsumption = "energy-consumption";
  // static const String energyConsumptionDetails = "energy-consumption-details";
  static const String demand = "demand";
  static const String demandDetail = "demand-analysis";
  static const String pf = "pf";
  // static const String costEstimate = "cost-estimate";
  static const String costEstimateDetail = "cost-estimate-details";
  static const String historyFields = "history-field";
  static const String history = "history";
  static const String frequencyDetails = "frequency-details";
  static const String voltageDetails = "voltage-details";
  static const String currentDetails = "current-details";
  static const String baseMetric = "base-metric";
  static const String pfDetails = "pf-details";
}
