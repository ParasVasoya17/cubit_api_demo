// To parse this JSON data, do
//
//     final getAllBusinessModel = getAllBusinessModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetAllBusinessModel getAllBusinessModelFromMap(String str) =>
    GetAllBusinessModel.fromMap(json.decode(str));

String getAllBusinessModelToMap(GetAllBusinessModel data) =>
    json.encode(data.toMap());

class GetAllBusinessModel {
  GetAllBusinessModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<Datum> data;

  factory GetAllBusinessModel.fromMap(Map<String, dynamic> json) =>
      GetAllBusinessModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
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

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        userId: json["user_id"],
        logo: json["logo"] ?? '',
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
