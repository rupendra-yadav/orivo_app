import 'package:auro/features/navigation/view/bottom_nav_screen/model/user_detail_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

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
  Future<List<UserModel>> updateUserData(String userId,userName,userState,userCity,userAddress,userCompany,userCompanyType,usrOwnerName,userGstNo,userPic) async {
    try {
      Map<String, dynamic> request = {
        'user_id': userId,
        'user_name': userName,
        'user_state': userState,
        'user_city': userCity,
        'user_address': userAddress,
        'user_company': userCompany,
        'user_company_type': userCompanyType,
        'user_owner_name': usrOwnerName,
        'user_gstno': userGstNo,
        'user_pic': userPic,
      };

      Map<String, dynamic> response =
      await THttpHelper.post('update_profile', request);

      if (kDebugMode) {
        print('update_profile  Response: $response');
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
}
