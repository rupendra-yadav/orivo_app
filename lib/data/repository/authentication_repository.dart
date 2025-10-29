import 'dart:developer';

import 'package:auro/features/authentication/model/user_detail.dart';
import 'package:auro/utils/constant/api_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../utils/constant/text_strings.dart';
import '../../utils/local_storage/storage_utility.dart';
import '../../utils/preferences/cache_manager.dart';
import '../http/http_client.dart';
import '../http/http_client3.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  static const String _userDataKey = 'user_data';
  final TLocalStorage _localStorage = TLocalStorage();

  ///----User Login
  Future<Map<String, dynamic>> userLogin(
      String mobileNumber, String password) async {
    try {
      Map<String, dynamic> data = {
        'user_mobile': mobileNumber,
        "user_pass": password
      };
      Map<String, dynamic> response =
          await THttpHelper.post(APIKeys.userLoginEND, data);

      if (kDebugMode) {
        print('user_login Response: $response');
      }

      if (response['response'] == 'success') {
        List<dynamic> userDataList = response['user'];

        /// SetData in Model...
        if (userDataList.isNotEmpty) {
          Map<String, dynamic> userData = userDataList.first;
          UserDetail user = UserDetail.fromJson(userData);
          _localStorage.saveData(_userDataKey, user.toJson());

          return {'success': true, 'message': 'Logged in successfully'};
        } else {
          return {'success': false, 'message': 'User data is empty'};
        }
      } else {
        // Error occurred, return response
        return {'success': false, 'message': response['message']};
      }
    } catch (e) {
      return {'response': 'error', 'message': e.toString()};
    }
  }

  ///-----Register User
  Future<Map<String, dynamic>> registerUser(String companyName, fullName,
      mobileNumber, emailAddress, userPassword) async {
    try {
      Map<String, dynamic> data = {
        'user_company': companyName,
        'user_name': fullName,
        'user_mobile': mobileNumber,
        'user_email': emailAddress,
        'user_pass': userPassword,
      };
      Map<String, dynamic> response =
          await THttpHelper.post(APIKeys.signupUserEND, data);

      if (kDebugMode) {
        print('signup_user Response: $response');
      }

      if (response['response'] == 'success') {
        List<dynamic> userDataList = response['data'];

        /// SetData in Model...
        if (userDataList.isNotEmpty) {
          Map<String, dynamic> userData = userDataList.first;
          UserDetail user = UserDetail.fromJson(userData);
          _localStorage.saveData(_userDataKey, user.toJson());

          return {'success': true, 'message': 'User Registered Successfully'};
        } else {
          return {'success': false, 'message': 'User data is empty'};
        }
      } else {
        // Error occurred, return response
        return {'success': false, 'message': response['message']};
      }
    } catch (e) {
      return {'response': 'error', 'message': e.toString()};
    }
  }

  ///-----Send OTP
  Future<Map<String, dynamic>> sendOtp(mobileNumber) async {
    try {
      Map<String, dynamic> data = {
        'mobile_no': "$mobileNumber",
      };

      Map<String, dynamic> response = await THttpHelper.post(
          APIKeys.sendOtpEND, data,
          accessToken: SharedPrefs.getString(TTexts.prefAccessToken) ?? "");

      log(response.toString());

      if (kDebugMode) {
        print('send_otp Response: $response');
      }

      if (response['response'] == 200) {
        return {'success': true, 'message': 'OTP Send Successfully'};
      } else {
        // Error occurred, return response
        return {'success': false, 'message': response['message']};
      }
    } catch (e) {
      return {'response': 'error', 'message': e.toString()};
    }
  }

  ///-----Verify  OTP
  Future<Map<String, dynamic>> verifyOtp(userId, otp) async {
    try {
      Map<String, dynamic> data = {
        'user_mobile': userId,
        'otp': otp,
      };
      Map<String, dynamic> response =
          await THttpHelper.post(APIKeys.verifyOtpEND, data);

      if (kDebugMode) {
        print('verify_otp Response: $response');
      }

      if (response['response'] == 'success') {
        List<dynamic> userDataList = response['user'];

        /// SetData in Model...
        if (userDataList.isNotEmpty) {
          Map<String, dynamic> userData = userDataList.first;
          UserDetail user = UserDetail.fromJson(userData);
          _localStorage.saveData(_userDataKey, user.toJson());

          return {'success': true, 'message': 'Logged in successfully'};
        } else {
          return {'success': false, 'message': 'User data is empty'};
        }

        return {'success': true, 'message': 'OTP Send Successfully'};
      } else {
        // Error occurred, return response
        return {'success': false, 'message': response['message']};
      }
    } catch (e) {
      return {'response': 'error', 'message': e.toString()};
    }
  }

  ///////////////////// NEW APIS ///////////////////////////////////////////

  /// Login
  Future<Map<String, dynamic>> login(String mobileNumber, String password,
      String uuid, String fcmToken, String deviceType) async {
    try {
      Map<String, dynamic> data = {
        'username': "$mobileNumber",
        "password": password
      };

      Map<String, dynamic> queryParams = {
        'device_id': uuid,
        'device_fcm_token': fcmToken,
        'device_type': deviceType,
      };

      final response =
          await THttpHelper3.post(APIKeys.login, queryParams, data);

      if (kDebugMode) {
        print('login Response: $response');
      }

      if (response['detail'] == 'Invalid credentials') {
        return {
          'success': false,
          'message': response['detail'] ?? 'Unknown error'
        };
      }
      if (response['access_token'].toString().isNotEmpty &&
          response['refresh_token'].toString().isNotEmpty) {
        if (kDebugMode) {
          print("AccessToken --> ${response['access_token']}");
          print("RefreshToken --> ${response['refresh_token']}");
        }

        SharedPrefs.setString(TTexts.prefAccessToken, response['access_token']);
        SharedPrefs.setString(
            TTexts.prefRefreshToken, response['refresh_token']);

        return {'success': true, 'message': 'Logged in successfully'};
      } else {
        return {'success': false, 'message': response['message']};
      }

      // if (response['response'] == 'success') {
      //   List<dynamic> userDataList = response['user'];
      //
      //
      //   return {'success': true, 'message': 'Logged in successfully'};
      //
      //   /// SetData in Model...
      //   if (userDataList.isNotEmpty) {
      //     Map<String, dynamic> userData = userDataList.first;
      //     UserDetail user = UserDetail.fromJson(userData);
      //     _localStorage.saveData(_userDataKey, user.toJson());
      //
      //     return {'success': true, 'message': 'Logged in successfully'};
      //   } else {
      //     return {'success': false, 'message': 'User data is empty'};
      //   }
      // } else {
      //   // Error occurred, return response
      //   return {'success': false, 'message': response['message']};
      // }
    } catch (e) {
      return {'response': 'error', 'message': e.toString()};
    }
  }

  /// Refresh Token
  Future<Map<String, dynamic>> reFresh(
      String refreshToken, String accessToken, String uuid) async {
    try {
      Map<String, dynamic> data = {
        'refresh_token': refreshToken,
        "access_token": accessToken
      };

      Map<String, dynamic> queryParams = {
        'device_id': uuid,
      };

      Map<String, dynamic> response =
          await THttpHelper3.postRaw(APIKeys.refresh, queryParams, data);

      if (response['access_token'].toString().isNotEmpty &&
          response['refresh_token'].toString().isNotEmpty) {
        if (kDebugMode) {
          print("AccessToken --> ${response['access_token']}");
          print("RefreshToken --> ${response['refresh_token']}");
        }

        SharedPrefs.setString(TTexts.prefAccessToken, response['access_token']);
        SharedPrefs.setString(
            TTexts.prefRefreshToken, response['refresh_token']);

        return {'success': true, 'message': 'Logged in successfully'};
      } else {
        return {
          'success': false,
          'message': 'Unknown error'
        }; // Handle potential null message
      }
    } catch (e) {
      if (kDebugMode) {
        print("Refresh Token Catch Error --> $e");
      }
      return {
        'success': false,
        'message': e.toString()
      }; // Return success: false here.
    }
  }

  ///-----Send OTP2
  Future<Map<String, dynamic>> sendOtp2(
      String mobileNumber, String uuid) async {
    try {
      Map<String, dynamic> data = {
        'mobile_no': "$mobileNumber",
      };

      Map<String, dynamic> queryParams = {
        'device_id': uuid,
      };

      Map<String, dynamic> response = await THttpHelper3.postRaw(
          APIKeys.otpSend, queryParams, data,
          accessToken: SharedPrefs.getString(TTexts.prefAccessToken) ?? "");

      if (kDebugMode) {
        print('otpSend Response: $response');
      }

      if (response['message'] == 'OTP sent successfully') {
        return {'success': true, 'message': 'OTP Send Successfully'};
      } else {
        // Error occurred, return response
        return {'success': false, 'message': response['message']};
      }
    } catch (e) {
      return {'response': 'error', 'message': e.toString()};
    }
  }

  ///-----Verify  OTP2
  Future<Map<String, dynamic>> verifyOtp2(String userId, String otp,
      String uuid, String fcm, String deviceType) async {
    try {
      Map<String, dynamic> data = {
        'mobile_no': "$userId",
        'otp': otp,
        'device_id': uuid,
        'device_fcm_token': fcm,
        'device_type': deviceType
      };

      Map<String, dynamic> queryParams = {};

      Map<String, dynamic> response = await THttpHelper3.postRaw(
          APIKeys.otpVerify, queryParams, data,
          accessToken: SharedPrefs.getString(TTexts.prefAccessToken) ?? "");

      if (kDebugMode) {
        print('verify_otp Response: $response');
      }

      if (response['access_token'].toString().isNotEmpty &&
          response['refresh_token'].toString().isNotEmpty) {
        if (kDebugMode) {
          print("AccessToken --> ${response['access_token']}");
          print("RefreshToken --> ${response['refresh_token']}");
        }

        SharedPrefs.setString(TTexts.prefAccessToken, response['access_token']);
        SharedPrefs.setString(
            TTexts.prefRefreshToken, response['refresh_token']);

        return {'success': true, 'message': 'Logged in successfully'};
      } else {
        return {'success': false, 'message': response['message']};
      }
    } catch (e) {
      return {'response': 'error', 'message': e.toString()};
    }
  }
}
