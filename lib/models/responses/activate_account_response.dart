import 'dart:convert';

ActivateAccountResponse activateAccountResponseFromJson(String str) =>
    ActivateAccountResponse.fromJson(json.decode(str));

String activateAccountResponseToJson(ActivateAccountResponse data) =>
    json.encode(data.toJson());

class ActivateAccountResponse {
  ActivateAccountResponse({
    this.id,
    this.userId,
    this.customerCode,
    this.documentPath,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final int userId;
  final String customerCode;
  final String documentPath;
  final bool status;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory ActivateAccountResponse.fromJson(Map<String, dynamic> json) =>
      ActivateAccountResponse(
        id: json['id'],
        userId: json['userId'],
        customerCode: json['customerCode'],
        documentPath: json['documentPath'],
        status: json['status'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'customerCode': customerCode,
        'documentPath': documentPath,
        'status': status,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };
}
