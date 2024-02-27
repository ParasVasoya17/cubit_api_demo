import 'dart:convert';

import 'package:cubit_postmethod_api/edit_business_profile/editbusiness_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class EditbusinessRepository {
  EditbusinessRepository(this.client);
  final Dio client;
  Future<EditBusinessModel> editBusiness(String logo, String name, String phone,
      String email, String address, String website) async {
    try {
      Map<String, String> data = {
        'logo': logo,
        'name': name,
        'phone': phone,
        'email': email,
        'website': website,
        'address': address,
      };

      final response = await http.post(
          Uri.parse(
              'https://postmaker.flexioninfotech.com/private/user/editbusiness/4'),
          body: data,
          headers: {
            'Authorization':
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOjEsImlhdCI6MTY2MjQ0MjU5MCwiZXhwIjoxNjYyNDQyNTkxfQ.6dFWTORfPT2J-spQz8lmPav4nAdAksnhzUOAT3NFz88",
          });
      print(response.body);
      Map<String, dynamic> data2 =
          Map<String, dynamic>.from(json.decode(response.body));
      var editBusiness = EditBusinessModel.fromMap(data2);
      print("print from service: $editBusiness");
      return editBusiness;
    } catch (e) {
      print("print err,from service : $e");
      throw (e.toString());
    }
  }
}
