import 'dart:convert';
import 'dart:io';

import './api_response.dart';
import './api_error.dart';
import 'package:http/http.dart' as http;

String _baseUrl = "http://localhost:3000/auth/login";

class User {
  int? status;
  int? code;
  String? message;
  Null? error;
  Data? data;

  User({this.status, this.code, this.message, this.error, this.data});

  User.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    error = json['error'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  Null? firstName;
  Null? lastName;
  Null? email;
  String? username;
  String? createdAt;
  Null? createdBy;
  String? updatedAt;
  Null? updatedBy;

  Data(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.username,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    username = json['username'];
    createdAt = json['createdAt'];
    createdBy = json['createdBy'];
    updatedAt = json['updatedAt'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['username'] = this.username;
    data['createdAt'] = this.createdAt;
    data['createdBy'] = this.createdBy;
    data['updatedAt'] = this.updatedAt;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

Future<ApiResponse> getUserDetails(String userId) async {
  ApiResponse apiResponse = new ApiResponse();
  try {
    final response =
        await http.get(Uri.parse('http://localhost:3000/user/$userId'));

    switch (response.statusCode) {
      case 200:
        apiResponse.Data = User.fromJson(json.decode(response.body));
        break;
      case 401:
        print((apiResponse.ApiError as ApiError).error);
        apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        break;
      default:
        print((apiResponse.ApiError as ApiError).error);
        apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        break;
    }
  } on SocketException {
    apiResponse.ApiError = ApiError(error: "Server error. Please retry");
  }
  return apiResponse;
}
