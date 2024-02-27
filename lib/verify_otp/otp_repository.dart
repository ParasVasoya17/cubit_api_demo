import 'dart:convert';

import 'package:cubit_postmethod_api/verify_otp/model.dart';
import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

class VerifyOtpRepository {
  VerifyOtpRepository(this.client);
  final Dio client;
  Future<VerifyOtpModel> verifyotp(String otp, String phone) async {
    try {
      Map<String, String> data = {
        'otp': otp,
        'phone': phone,
      };

      final response = await http.post(
          Uri.parse("https://postmaker.flexioninfotech.com/public/user/login"),
          body: data);
      print(response.body);
      Map<String, dynamic> data2 =
          Map<String, dynamic>.from(json.decode(response.body));
      var verifyotp = VerifyOtpModel.fromMap(data2);
      print("print from service: $verifyotp");
      return verifyotp;
    } catch (e) {
      print("print err,from service : $e");
      throw (e.toString());
    }
  }
}
