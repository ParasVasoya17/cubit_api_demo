import 'dart:convert';

import 'package:cubit_postmethod_api/get_all_business/get_all_business_model.dart';

import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

class GetAllBusinessRepository {
  GetAllBusinessRepository(this.client);
  final Dio client;
  Future<GetAllBusinessModel> getAllBusiness() async {
    try {
      // Map<String, String> data = {
      //   'phone': phone,
      // };

      final response = await http.get(
          Uri.parse(
              "https://postmaker.flexioninfotech.com/private/user/allbusiness"),
          headers: {
            'Authorization':
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOjEsImlhdCI6MTY2MjQ0MjU5MCwiZXhwIjoxNjYyNDQyNTkxfQ.6dFWTORfPT2J-spQz8lmPav4nAdAksnhzUOAT3NFz88",
          });
      print(response.body);
      Map<String, dynamic> data2 =
          Map<String, dynamic>.from(json.decode(response.body));
      var getBusiness = GetAllBusinessModel.fromMap(data2);
      print("print from service: $getBusiness");
      return getBusiness;
    } catch (e) {
      print("print err,from service : $e");
      throw (e.toString());
    }
  }
}
