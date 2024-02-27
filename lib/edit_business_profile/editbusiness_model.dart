// To parse this JSON data, do
//
//     final editBusinessModel = editBusinessModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

EditBusinessModel editBusinessModelFromMap(String str) =>
    EditBusinessModel.fromMap(json.decode(str));

String editBusinessModelToMap(EditBusinessModel data) =>
    json.encode(data.toMap());

class EditBusinessModel {
  EditBusinessModel({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory EditBusinessModel.fromMap(Map<String, dynamic> json) =>
      EditBusinessModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
      };
}
