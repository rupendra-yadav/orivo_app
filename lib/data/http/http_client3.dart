import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../utils/constant/api_constants.dart';

class THttpHelper3 {
  static const String _baseUrl = tBaseUrl3;

  /// Helper method to make a GET request
  static Future<Map<String, dynamic>> get(
      String endpoint, {
        String accessToken = "",
        Map<String, dynamic>? queryParams, dynamic data,}) async {
    final uri = Uri.parse('$_baseUrl$endpoint').replace(queryParameters: queryParams,
    );

    if (kDebugMode) {
      print('GET Request: $uri');
    }

    final response = await http.get(
      uri,
      headers: accessToken.isEmpty
          ? {'Content-Type': 'application/x-www-form-urlencoded'}
          : {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $accessToken'
      },

    );

    if (kDebugMode) {
      print('GET Request: $uri');
    }

    if (kDebugMode) {
      print('Authorization: Bearer $accessToken');
    }

    if (kDebugMode) {
      print('GET Response: ${response.body}');
    }

    return _handleResponse(response);
  }


  static Future<Map<String, dynamic>> redirectPost(String endpoint, dynamic data,
      {String accessToken = ""}) async {
    if (kDebugMode) {
      print('POST Request: $_baseUrl$endpoint');
      print('POST Data: $data');
    }

    Uri uri = Uri.parse('$_baseUrl$endpoint');
    int redirectCount = 0;
    bool redirect = true;
    http.Response? response;  // Initialize response as nullable

    while (redirect && redirectCount < 5) {
      response = await http.post(
        uri,
        headers: accessToken.isEmpty
            ? {'Content-Type': 'application/x-www-form-urlencoded'}
            : {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $accessToken'
        },
        body: _encodeFormData(data),  // Ensure form URL encoding
      );

      if (kDebugMode) {
        print('POST Response: ${response.body}');
      }

      // Handle redirect status codes (3xx)
      if (response.statusCode == 308 || response.statusCode == 301 || response.statusCode == 302) {
        String? redirectUrl = response.headers['location'];
        if (redirectUrl != null) {
          uri = Uri.parse(redirectUrl);
          redirectCount++;
          if (kDebugMode) {
            print('Redirecting to $redirectUrl');
          }
        } else {
          throw Exception('Redirection without location header');
        }
      } else {
        redirect = false; // No redirect, exit loop
      }
    }

    // Check if response is non-null before passing it to _handleResponse
    if (response != null) {
      return _handleResponse(response);
    } else {
      throw Exception('Failed to get a valid response.');
    }
  }




  /// Helper method to make a POST request
  static Future<Map<String, dynamic>> post(String endpoint,Map<String, dynamic>? queryParams, dynamic data, {String accessToken = ""}) async {
    if (kDebugMode) {
      print('POST Request: $_baseUrl$endpoint${Uri(queryParameters:queryParams)}');
      print('POST Data: $data');
    }

    // final response = await http.post(
    //   Uri.parse('$_baseUrl/$endpoint'),
    //   headers: {'Content-Type': 'application/json'},
    //   body: json.encode(data),
    // );

    final response = await http.post(Uri.parse('$_baseUrl$endpoint').replace(queryParameters:queryParams),

      headers: accessToken.isEmpty
          ? {'Content-Type': 'application/x-www-form-urlencoded'}
          : {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $accessToken'

      },
      body: _encodeFormData(data),
        // Set a reasonable limit for redirects
    );

    if (kDebugMode) {
      print('POST Response: ${response.body}');
    }

    return _handleResponse(response);
  }




  /// Helper method to make a PATCH request with form data
  static Future<Map<String, dynamic>> patchFormData(
      String endpoint, dynamic data,
      {String accessToken = ""}) async {
    if (kDebugMode) {
      print('PATCH Request: $_baseUrl/$endpoint');
      print('PATCH FormData: $data');
    }

    final response = await http.patch(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: accessToken.isEmpty
          ? {'Content-Type': 'application/x-www-form-urlencoded'}
          : {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $accessToken'
      },
      body: data,
    );

    if (kDebugMode) {
      print('PATCH Response: ${response.body}');
    }

    return _handleResponse(response);
  }

  /// Helper method to make a PUT request
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    if (kDebugMode) {
      print('PUT Request: $_baseUrl/$endpoint');
      print('PUT Data: $data');
    }

    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (kDebugMode) {
      print('PUT Response: ${response.body}');
    }

    return _handleResponse(response);
  }



  /// Helper method to make a PATCH request
  static Future<Map<String, dynamic>> patch(
      String endpoint, {
        String accessToken = "",
        Map<String, dynamic>? queryParams,
        dynamic data,
      }) async {
    final uri = Uri.parse('$_baseUrl/$endpoint').replace(
      queryParameters: queryParams,
    );

    if (kDebugMode) {
      print('PATCH Request: $uri');
      print('PATCH FormData: $data');
    }


    final response = await http.patch(
      uri,
      headers: accessToken.isEmpty
          ? {'Content-Type': 'application/x-www-form-urlencoded'}
          : {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $accessToken'
      },
      body: data,
    );

    if (kDebugMode) {
      print('PATCH Request: $uri');
    }

    if (kDebugMode) {
      print('Authorization: Bearer $accessToken');
    }

    if (kDebugMode) {
      print('PATCH Response: ${response.body}');
    }

    return _handleResponse(response);
  }




  /// Helper method to make a DELETE request
  static Future<Map<String, dynamic>> delete(
      String endpoint, {
        String accessToken = "",
        Map<String, dynamic>? queryParams,
        dynamic data,
      }) async {
    final uri = Uri.parse('$_baseUrl/$endpoint').replace(
      queryParameters: queryParams,
    );

    if (kDebugMode) {
      print('DELETE Request: $uri');
    }

    final response = await http.delete(
      uri,
      headers: accessToken.isEmpty
          ? {'Content-Type': 'application/x-www-form-urlencoded'}
          : {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $accessToken'
      },

    );

    if (kDebugMode) {
      print('DELETE Request: $uri');
    }

    if (kDebugMode) {
      print('Authorization: Bearer $accessToken');
    }

    if (kDebugMode) {
      print('DELETE Response: ${response.body}');
    }

    return _handleResponse(response);
  }

  // /// Helper method to make a DELETE request
  // static Future<Map<String, dynamic>> delete(String endpoint) async {
  //   if (kDebugMode) {
  //     print('DELETE Request: $_baseUrl/$endpoint');
  //   }
  //
  //   final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
  //
  //   if (kDebugMode) {
  //     print('DELETE Response: ${response.body}');
  //   }
  //
  //   return _handleResponse(response);
  // }

  // Handle the HTTP response


  static Map<String, dynamic> _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 400:
      case 401:
      case 403:
      case 404:
      case 409:
      case 500:
        return json.decode(response.body);
      default:
        throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  // Helper method to encode form data
  /*static String _encodeFormData(Map<String, dynamic> data) {
    return data.keys
        .map((key) => '$key=${Uri.encodeComponent(data[key])}')
        .join('&');
  }*/

  static String _encodeFormData(Map<String, dynamic> data) {
    return data.keys
        .map((key) => '$key=${Uri.encodeComponent(data[key].toString())}')
        .join('&');
  }
}
