// To parse this JSON data, do
//
//     final getBusinessModel = getBusinessModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetBusinessModel getBusinessModelFromMap(String str) =>
    GetBusinessModel.fromMap(json.decode(str));

String getBusinessModelToMap(GetBusinessModel data) =>
    json.encode(data.toMap());

class GetBusinessModel {
  GetBusinessModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory GetBusinessModel.fromMap(Map<String, dynamic> json) =>
      GetBusinessModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data.toMap(),
      };
}

class Data {
  Data({
    required this.id,
    required this.userId,
    required this.logo,
    required this.name,
    required this.phone,
    required this.email,
    required this.website,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int userId;
  String? logo;
  String name;
  String phone;
  String email;
  String website;
  String address;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["_id"],
        userId: json["user_id"],
        logo: json["logo"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        website: json["website"],
        address: json["address"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "user_id": userId,
        "logo": logo,
        "name": name,
        "phone": phone,
        "email": email,
        "website": website,
        "address": address,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
