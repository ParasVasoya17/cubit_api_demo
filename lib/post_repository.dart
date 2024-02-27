import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'post_model.dart';

import 'package:http/http.dart' as http;

class PostRepository {
  PostRepository(this.client);
  final Dio client;
  Future<PostModel> postPost(String logo, String name, String phone,
      String email, String website) async {
    try {
      Map<String, String> data = {
        'logo': logo,
        'name': name,
        'email': email,
        'phone': phone,
        'website': website
      };

      final response = await http.post(
          Uri.parse(
              "https://postmaker.flexioninfotech.com/public/user/register"),
          body: data);
      print(response.body);
      Map<String, dynamic> data2 =
          Map<String, dynamic>.from(json.decode(response.body));
      var user = PostModel.fromMap(data2);
      print("print from service: $user");
      return user;
    } catch (e) {
      print("print err,from service : $e");
      throw (e.toString());
    }
  }
}

// class PostRepository {
//   const PostRepository(this.client);

//   final Dio client;

//   Future<PostModel> postPost(
//     // File image,
//     String name,
//     String phone,
//     String email,
//     String website,
//   ) async {
//     try {
//       Map<String, String> data = {
//         'name': name,
//         'email': email,
//         'phone': phone,
//         'website': website
//       };
//       const url = 'https://postmaker.flexioninfotech.com/public/user/register';

//       final response = await client.post(
//         url, data: data,
//         //  headers: <String, String>{
//         //   'Content-Type': 'application/json; charset=UTF-8',
//         // },
//         // data: jsonEncode(<String, String>{
//         //   'name': name,
//         //   "phone": phone,
//         //   "email": email,
//         //   "website": website,
//         // }),

//         // options: Options(
//         //   headers: <String, String>{
//         //     'Content-Type': 'application/json; charset=UTF-8',
//         //   },
//         // headers: {
//         //   "Authorization": token;
//         // },
//         // ),
//       );
//       // final post = List<PostModel>.of(response.data.tomap<PostModel>((json) =>
//       //     PostModel(
//       //         status: json["status"] as bool,
//       //         message: json["message"] as String,
//       //         token: json["token"] ?? "")));

//       // return post;
//       Map<String, dynamic> data2 =
//           Map<String, dynamic>.from(json.decode(response.data));
//       var user = PostModel.fromMap(data2);
//       print("print from service: $user");
//       return user;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
