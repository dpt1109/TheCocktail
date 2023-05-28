// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';

import 'api_error.dart';
import './user.dart';

String _baseUrl = "http://localhost:3000/auth/login";
Future<ApiResponse> authenticateUser(String username, String password) async {
  ApiResponse apiResponse = new ApiResponse();

  try {
    var http;
    final response = await http.post('${_baseUrl}user/login', body: {
      'username': username,
      'password': password,
    });

    switch (response.statusCode) {
      case 200:
        apiResponse.Data = User.fromJson(json.decode(response.body));
        break;
      case 401:
        apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        break;
      default:
        apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        break;
    }
  } on SocketException {
    apiResponse.ApiError = ApiError(error: "Server error. Please retry");
  }
  return apiResponse;
}

class ApiResponse {
  // _data will hold any response converted into
  // its own object. For example user.
  late Object _data;
  // _apiError will hold the error object
  late Object _apiError;

  Object get Data => _data;
  set Data(Object data) => _data = data;

  Object get ApiError => _apiError as Object;
  set ApiError(Object error) => _apiError = error;
}
