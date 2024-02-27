// To parse this JSON data, do
//
//     final verifyOtpModel = verifyOtpModelFromMap(jsonString);

import 'dart:convert';

VerifyOtpModel verifyOtpModelFromMap(String str) =>
    VerifyOtpModel.fromMap(json.decode(str));

String verifyOtpModelToMap(VerifyOtpModel data) => json.encode(data.toMap());

class VerifyOtpModel {
  VerifyOtpModel({
    required this.status,
    required this.message,
  });

  bool? status;
  String? message;

  factory VerifyOtpModel.fromMap(Map<String, dynamic> json) => VerifyOtpModel(
        status: json["status"] as bool,
        message: json["message"] as String,
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
      };
}
