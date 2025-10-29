import 'dart:convert';
import 'dart:developer';
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
  // Future<List<UserModel>> getUserData(String userId) async {
  //   try {
  //     Map<String, dynamic> request = {'user_id': userId};

  //     Map<String, dynamic> response =
  //         await THttpHelper.post(APIKeys.userDetailsEND, request);

  //     if (kDebugMode) {
  //       print('user_details  Response: $response');
  //     }

  //     if (response['response'] == 'success') {
  //       List<dynamic> useData = response['data'];

  //       List<UserModel> userDetails =
  //           useData.map((data) => UserModel.fromJson(data)).toList();

  //       return userDetails;
  //     } else {
  //       throw Exception(response['message']);
  //     }
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

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
  Future<String> updateUserData(
      String mobileNo,
      String name,
      String companyName,
      String city,
      String state,
      String address,
      String pincode,
      String companyType,
      String gstNo,
      String accessToken,
      File profilePic) async {
    try {
      Map<String, dynamic> request = {
        "mobile_no": mobileNo,
        "name": name,
        // "profile_image_path": "https://ems-ota.s3.amazonaws.com/profile_images/11.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=ASIARRV6RGOVYM5DJU6L%2F20251029%2Fap-south-1%2Fs3%2Faws4_request&X-Amz-Date=20251029T093637Z&X-Amz-Expires=360000&X-Amz-SignedHeaders=host&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEBkaCmFwLXNvdXRoLTEiRjBEAiAdysr5JrjPELJzjhJABQ6jexoTG2HUsM1UqJ9QR4N3DQIgLiUlFdOy%2B2jzfdZ1sX4s14AK3%2BcQfZqYv%2BLZAvXyuegq7gII0%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxMDY3MDAwMjY3OTUiDOSNZlb8zerJg%2FSgGirCAuAPamT3RjNjlSQH2YzKuar9jFFYTpnHNctjOkIKp7OkMk0lBxTjXJYVBuVHxnO5W1yWZjpIPWZrJjKGUtVy41owIVlF5fUESIh9o1tfO0QNghYWjU%2BXPMpaABSZAt6HF5pxVyfEimNJN3EOLoIl%2FFU5XjNQuxrmYlGrn4eoXGvx3IgrfZSvnLloT9V4fKjmOQVjESbfTn5%2BkTBB1e8lQOr76J40Pkf7EizFB6LwNa%2Fo%2BZx5Mjl1JxQsnr4juFJ0Vl7br%2FH10YM1yKKev2veBWIGKuj881SxMDYFNb8P7AqME358%2BiWaPsDOFFRb7BWOe7UHQqfriy6D8qlsK8ux3YdSUqBvWP2QCocmyxRYBu5Sjq%2BeuQllV63mbWrOadQ0E3FEIPziB4RTc00Md0UALDKLshk6910UPbMYl0OX7%2FskGz8wwL2HyAY6nwHcGTip3V9n6NuiCZaPxSCR7UCf5y0DfyJ5%2F3dP2UDaF7MP0RwyDCsF9%2B5f9JVLA3nTMNGwOhzIQN1Z1Digk1eYeM9syGI5AQeTSsMq%2B1hlRoJd61fHp%2BRdeFktXXEXhuKV0DZhOhogOFVx43Jr8DZYkXZrYgIPfFuwrOagM9zfKAG1hHJ1t2WFXITAuMReDyCbVGczQVbYwkWkhZP%2FERE%3D&X-Amz-Signature=40170f78c07178b2a7d71e4ce1af7df792b3c17fae1fa5cb5ef2b8209bc3f110",
        "company_name": companyName,
        // "city": city,
        // "state": state,
        // "address": address,
        // "pincode": pincode,
        // "company_type": companyType,
        // "gst_no": gstNo
      };

      Map<String, String> photoRequest = {
        "mobile_no": mobileNo,
      };

      Map<String, dynamic> profileresponse = await THttpHelper3.postMultipart(
        APIKeys.userPhotoUpload,
        queryParams: photoRequest,
        file: profilePic, // can be null
        // fileField: "profile_image_path", // <-- backend field name
        accessToken: accessToken,
      );
      Map<String, dynamic> response = await THttpHelper3.postRaw(
          APIKeys.userEditProfile, null, request,
          accessToken: accessToken);
      // Make multipart request

      log(profileresponse.toString());

      if (response['response'] == 200) {
        return response['message']; // Return a single UserModel2 object
        // Check for 200 instead of 'success' and change response type to Int in Backend
        // Extract the user data from the "data" field
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  ///update Phone Number
  Future<List<UserModel>> updatePhoneNumber(
      String userId, String whatsApp, String altWhatsApp) async {
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
  Future<List<UserModel>> updatePhoneNumberStatus(
      String userId, String status1, String status2, String status3) async {
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
  Future<Map<String, dynamic>> logout(String reFreshToken, String uuid) async {
    try {
      Map<String, dynamic> request = {'refresh_token': reFreshToken};

      Map<String, dynamic> queryParams = {
        'device_id': uuid,
      };

      Map<String, dynamic> response =
          await THttpHelper3.post(APIKeys.authLogout, queryParams, request);

      if (kDebugMode) {
        print('authLogout  Response: $response');
      }

      if (response['message'] == 'Logged out from this device') {
        return {'success': true, 'message': response['message']};
      } else {
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
  Future<UserModel2> getUserData2(String mobileNo, String accessToken) async {
    try {
      Map<String, dynamic> request = {'mobile_no': "$mobileNo"};

      Map<String, dynamic> response = await THttpHelper3.postRaw(
          APIKeys.userProfile, null, request,
          accessToken: accessToken);

      log(response.toString());

      if (response['response'] == 200) {
        // Check for 200 instead of 'success' and change response type to Int in Backend
        // Extract the user data from the "data" field
        Map<String, dynamic> userData = response['data'];

        // Create a UserModel2 instance
        UserModel2 userDetails = UserModel2.fromJson(userData);

        return userDetails; // Return a single UserModel2 object
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  ///Update user data
  // Future<List<UserModel>> updateUserData2(String token, String mobileNumber, String companyName, String city, String state, String address, String pinCode, String companyType, String gstNumber,) async {
  //   try {
  //     var request = http.MultipartRequest(
  //         'POST', Uri.parse('https://webdevelopercg.com/electricity/myadmin/Api/update_profile'));
  //
  //     // Add text fields to the request
  //     request.fields['user_id'] = userId;
  //     request.fields['user_name'] = userName;
  //     request.fields['user_state'] = userState;
  //     request.fields['user_city'] = userCity;
  //     request.fields['user_address'] = userAddress;
  //     request.fields['user_company'] = userCompany;
  //     request.fields['user_company_type'] = userCompanyType;
  //     request.fields['user_owner_name'] = userOwnerName;
  //     request.fields['user_gstno'] = userGstNo;
  //
  //     // Add the image file to the request
  //     request.files.add(await http.MultipartFile.fromPath('user_pic', userPic.path));
  //
  //     // Send the request and get the response
  //     var response = await request.send();
  //
  //     // Check for response status and handle the response
  //     if (response.statusCode == 200) {
  //       var responseData = await response.stream.bytesToString();
  //       var jsonResponse = json.decode(responseData);
  //
  //       if (kDebugMode) {
  //         print('update_profile Response: $jsonResponse');
  //       }
  //
  //       if (jsonResponse['response'] == 'success') {
  //         List<dynamic> useData = jsonResponse['data'];
  //         List<UserModel> userDetails = useData.map((data) => UserModel.fromJson(data)).toList();
  //         return userDetails;
  //       } else {
  //         throw Exception(jsonResponse['message']);
  //       }
  //     } else {
  //       throw Exception('Failed to update profile');
  //     }
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }
}
