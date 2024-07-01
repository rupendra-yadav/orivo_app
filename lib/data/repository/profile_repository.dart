import 'dart:convert';
import 'dart:io';

import 'package:auro/features/navigation/view/bottom_nav_screen/model/user_detail_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../http/http_client.dart';

class ProfileRepository extends GetxController {
  static ProfileRepository get instance => Get.find();

  ///Get user data
  Future<List<UserModel>> getUserData(String userId) async {
    try {
      Map<String, dynamic> request = {'user_id': userId};

      Map<String, dynamic> response =
          await THttpHelper.post('user_details', request);

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
  Future<Map<String, dynamic>> updatePassword(
      String userId, userPass, userConPass) async {
    try {
      Map<String, dynamic> request = {
        'user_id': userId,
        'user_pass': userPass,
        'user_con_pass': userConPass
      };

      Map<String, dynamic> response =
          await THttpHelper.post('update_password', request);

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
  Future<List<UserModel>> updateUserData(
      String userId,
      String userName,
      String userState,
      String userCity,
      String userAddress,
      String userCompany,
      String userCompanyType,
      String userOwnerName,
      String userGstNo,
      File userPic) async {
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
      request.files
          .add(await http.MultipartFile.fromPath('user_pic', userPic.path));

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
          List<UserModel> userDetails =
              useData.map((data) => UserModel.fromJson(data)).toList();
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
}
