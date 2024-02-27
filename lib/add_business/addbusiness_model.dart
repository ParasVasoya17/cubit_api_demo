// To parse this JSON data, do
//
//     final addBusinessModel = addBusinessModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AddBusinessModel addBusinessModelFromMap(String str) =>
    AddBusinessModel.fromMap(json.decode(str));

String addBusinessModelToMap(AddBusinessModel data) =>
    json.encode(data.toMap());

class AddBusinessModel {
  AddBusinessModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory AddBusinessModel.fromMap(Map<String, dynamic> json) =>
      AddBusinessModel(
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
    required this.updatedAt,
    required this.createdAt,
  });

  int id;
  int userId;
  String logo;
  String name;
  String phone;
  String email;
  String website;
  String address;
  DateTime updatedAt;
  DateTime createdAt;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["_id"],
        userId: json["user_id"],
        logo: json["logo"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        website: json["website"],
        address: json["address"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
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
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
}
