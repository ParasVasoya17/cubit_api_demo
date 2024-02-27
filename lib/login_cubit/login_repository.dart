import 'dart:convert';

import 'package:cubit_postmethod_api/login_cubit/model.dart';
import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

class SendOtpRepository {
  SendOtpRepository(this.client);
  final Dio client;
  Future<SendOtpModel> sendOtp(String phone) async {
    try {
      Map<String, String> data = {
        'phone': phone,
      };

      final response = await http.post(
          Uri.parse(
              "https://postmaker.flexioninfotech.com/public/user/sendotp"),
          body: data);
      print(response.body);
      Map<String, dynamic> data2 =
          Map<String, dynamic>.from(json.decode(response.body));
      var otp = SendOtpModel.fromMap(data2);
      print("print from service: $otp");
      return otp;
    } catch (e) {
      print("print err,from service : $e");
      throw (e.toString());
    }
  }
}
