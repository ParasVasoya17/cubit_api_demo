// To parse this JSON data, do
//
//     final sendOtpModel = sendOtpModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SendOtpModel sendOtpModelFromMap(String str) =>
    SendOtpModel.fromMap(json.decode(str));

String sendOtpModelToMap(SendOtpModel data) => json.encode(data.toMap());

class SendOtpModel {
  SendOtpModel({
    required this.status,
    required this.message,
    required this.token,
  });

  bool? status;
  String? message;
  String? token;

  factory SendOtpModel.fromMap(Map<String, dynamic> json) => SendOtpModel(
        status: json["status"] as bool,
        message: json["message"] as String,
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "token": token,
      };
}
