// To parse this JSON data, do

//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

PostModel postModelFromMap(String str) => PostModel.fromMap(json.decode(str));

String postModelToMap(PostModel data) => json.encode(data.toMap());

class PostModel {
  PostModel({
    required this.status,
    required this.message,
    required this.token,
  });

  bool? status;
  String? message;
  String? token;

  factory PostModel.fromMap(Map<String, dynamic> json) => PostModel(
        status: json["status"] as bool,
        message: json["message"] as String,
        token: json["token"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "token": token,
      };
}

// class PostModel {
//   PostModel({
//     required this.status,
//     required this.message,
//     required this.token,
//   });

//   bool status;
//   String message;
//   String token;
// }
// import 'dart:convert';

// RegisterModel registerModelFromMap(String str) =>
//     RegisterModel.fromMap(json.decode(str));
// String registerModelToMap(RegisterModel data) => json.encode(data.toMap());

// class RegisterModel {
//   RegisterModel({
//     this.status,
//     this.message,
//     this.token,
//   });
//   bool? status;
//   String? message;
//   String? token;
//   factory RegisterModel.fromMap(Map<String, dynamic> json) => RegisterModel(
//         status: json["status"] as bool,
//         message: json["message"] as String,
//         token: json["token"] ?? '',
//       );
//   Map<String, dynamic> toMap() => {
//         "status": status,
//         "message": message,
//         "token": token,
//       };
// }
