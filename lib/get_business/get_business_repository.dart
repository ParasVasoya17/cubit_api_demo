import 'dart:convert';

import 'package:cubit_postmethod_api/get_business/get_business_model.dart';

import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

class GetBusinessRepository {
  GetBusinessRepository(this.client);
  final Dio client;
  Future<GetBusinessModel> getBusiness() async {
    try {
      // Map<String, String> data = {
      //   'phone': phone,
      // };

      final response = await http.get(
          Uri.parse(
              "https://postmaker.flexioninfotech.com//private/user/business/4"),
          headers: {
            'Authorization':
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOjEsImlhdCI6MTY2MjQ0MjU5MCwiZXhwIjoxNjYyNDQyNTkxfQ.6dFWTORfPT2J-spQz8lmPav4nAdAksnhzUOAT3NFz88",
          });
      print(response.body);
      Map<String, dynamic> data2 =
          Map<String, dynamic>.from(json.decode(response.body));
      var get = GetBusinessModel.fromMap(data2);
      print("print from service: $get");
      return get;
    } catch (e) {
      print("print err,from service : $e");
      throw (e.toString());
    }
  }
}
