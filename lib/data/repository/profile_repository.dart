import 'dart:convert';
import 'dart:io';

import 'package:auro/features/navigation/view/bottom_nav_screen/model/user_detail_model.dart';
import 'package:auro/utils/constant/api_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../features/navigation/view/bottom_nav_screen/model/user_detail_model2.dart';
import '../http/http_client.dart';
import '../http/http_client3.dart';

class ProfileRepository extends GetxController {
  static ProfileRepository get instance => Get.find();

  ///Get user data
  Future<List<UserModel>> getUserData(String userId) async {
    try {
      Map<String, dynamic> request = {'user_id': userId};

      Map<String, dynamic> response =
          await THttpHelper.post(APIKeys.userDetailsEND, request);

      if (kDebugMode) {
        print('user_details  Response: $response');
      }

      if (response['response'] == 'success') {
        List<dynamic> useData = response['data'];

        List<UserModel> userDetails =
            useData.map((data) => UserModel.fromJson(data)).toList();

        return userDetails;
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  ///Update Password
  Future<Map<String, dynamic>> updatePassword(String userId, userPass, userConPass) async {
    try {
      Map<String, dynamic> request = {
        'user_id': userId,
        'user_pass': userPass,
        'user_con_pass': userConPass
      };

      Map<String, dynamic> response =
          await THttpHelper.post(APIKeys.updatePasswordEND, request);

      if (kDebugMode) {
        print('update_password  Response: $response');
      }

      if (response['response'] == 'success') {
        return {'success': true, 'message': 'Password Reset Successfully'};
      } else {
        // Error occurred, return response
        return {'success': false, 'message': response['message']};
      }
    } catch (e) {
      return {'response': 'error', 'message': e.toString()};
    }
  }

  ///Update user data
  Future<List<UserModel>> updateUserData(String userId, String userName, String userState, String userCity, String userAddress, String userCompany, String userCompanyType, String userOwnerName, String userGstNo, File userPic) async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://webdevelopercg.com/electricity/myadmin/Api/update_profile'));

      // Add text fields to the request
      request.fields['user_id'] = userId;
      request.fields['user_name'] = userName;
      request.fields['user_state'] = userState;
      request.fields['user_city'] = userCity;
      request.fields['user_address'] = userAddress;
      request.fields['user_company'] = userCompany;
      request.fields['user_company_type'] = userCompanyType;
      request.fields['user_owner_name'] = userOwnerName;
      request.fields['user_gstno'] = userGstNo;

      // Add the image file to the request
      request.files.add(await http.MultipartFile.fromPath('user_pic', userPic.path));

      // Send the request and get the response
      var response = await request.send();

      // Check for response status and handle the response
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var jsonResponse = json.decode(responseData);

        if (kDebugMode) {
          print('update_profile Response: $jsonResponse');
        }

        if (jsonResponse['response'] == 'success') {
          List<dynamic> useData = jsonResponse['data'];
          List<UserModel> userDetails = useData.map((data) => UserModel.fromJson(data)).toList();
          return userDetails;
        } else {
          throw Exception(jsonResponse['message']);
        }
      } else {
        throw Exception('Failed to update profile');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  ///update Phone Number
  Future<List<UserModel>> updatePhoneNumber(String userId,String whatsApp, String altWhatsApp) async {
    try {
      Map<String, dynamic> request = {
        'user_id': userId,
        'user_whatsapp': whatsApp,
        'user_alt_whatsapp': altWhatsApp,
      };

      Map<String, dynamic> response =
      await THttpHelper.post(APIKeys.updateContacts, request);

      if (kDebugMode) {
        print('user_details  Response: $response');
      }

      if (response['response'] == 'success') {
        List<dynamic> useData = response['data'];

        List<UserModel> userDetails =
        useData.map((data) => UserModel.fromJson(data)).toList();

        return userDetails;
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  ///update Phone Number status
  Future<List<UserModel>> updatePhoneNumberStatus(String userId,String status1, String status2,String status3) async {
    try {
      Map<String, dynamic> request = {
        'user_id': userId,
        'whatsapp_status_1': status1,
        'whatsapp_status_2': status2,
        'whatsapp_status_3': status3,
      };

      Map<String, dynamic> response =
      await THttpHelper.post(APIKeys.updateNotificationContact, request);

      if (kDebugMode) {
        print('user_details  Response: $response');
      }

      if (response['response'] == 'success') {
        List<dynamic> useData = response['data'];

        List<UserModel> userDetails =
        useData.map((data) => UserModel.fromJson(data)).toList();

        return userDetails;
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }



  //////////////////////////////////Gen2////////////////////////////////////////


  ///Get user data
  Future<Map<String, dynamic>> logout(String reFreshToken ,String uuid) async {
    try {
      Map<String, dynamic> request = {'refresh_token': reFreshToken};

      Map<String, dynamic> queryParams = {
        'device_id': uuid,
      };

      Map<String, dynamic> response = await THttpHelper3.post(APIKeys.authLogout, queryParams,request);

      if (kDebugMode) {
        print('authLogout  Response: $response');
      }

      if (response['message'] == 'Logged out from this device') {
        return {'success': true, 'message': response['message']};
      }else{
        return {'success': true, 'message': response['message']};
      }




     /* if (response['response'] == 'success') {
        List<dynamic> useData = response['data'];

        List<UserModel> userDetails =
        useData.map((data) => UserModel.fromJson(data)).toList();

        return userDetails;
      } else {
        throw Exception(response['message']);
      }*/
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  ///Get user data
  Future<List<UserModel2>> getUserData2(String mobileNo,String accessToken) async {
    try {
      Map<String, dynamic> request = {'mobile_no': mobileNo};

      Map<String, dynamic> response =
      await THttpHelper3.postRaw(APIKeys.userProfile,null, request,accessToken: accessToken);

      if (response['response'] == 'success') {
        List<dynamic> useData = response['data'];

        List<UserModel2> userDetails =
        useData.map((data) => UserModel2.fromJson(data)).toList();

        return userDetails;
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
