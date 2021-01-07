// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.userId,
    this.personId,
    this.customerId,
    this.fullName,
  });

  final int userId;
  final int personId;
  final int customerId;
  final String fullName;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        userId: json['userId'],
        personId: json['personId'],
        customerId: json['customerId'],
        fullName: json['fullName'],
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'personId': personId,
        'customerId': customerId,
        'fullName': fullName,
      };
}
