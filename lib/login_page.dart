import 'package:cubit_postmethod_api/login_cubit/model.dart';
import 'package:cubit_postmethod_api/signup_page.dart';

import 'package:cubit_postmethod_api/verify_otp.dart';

import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

import 'package:hive_flutter/adapters.dart';

import 'login_cubit/login_repository.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _phonecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  SendOtpRepository repository = SendOtpRepository(Dio());
  // late Box<String> loginBox;

  @override
  void initState() {
    super.initState();
    // loginBox = Hive.box<String>('logindata');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _phonecontroller,
                  decoration: const InputDecoration(
                    hintText: "Phone Number",
                    alignLabelWithHint: true,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Phone number Can not be empty';
                    } else if (value.length == 9) {
                      return 'Phone number should be 10';
                    }
                    return null;
                  },
                  // onSaved: (val) {
                  //   phone = val;
                  // },
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    sendOtp();
                    // 9737999898
                  },
                  child: const Text("Send Otp"),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text("+919737999898"),
                const SizedBox(
                  height: 50,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Click here to',
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Register',
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage()))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendOtp() async {
    if (_formKey.currentState!.validate()) {
      SendOtpRepository repository = SendOtpRepository(Dio());
      final SendOtpModel sendOtp =
          await repository.sendOtp(_phonecontroller.text);
      if (sendOtp.status!) {
        showToast();
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Verifyotp(_phonecontroller.text)));
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Phone Number is Not Registered')));
      }
    }
  }
}

void showToast() {
  Fluttertoast.showToast(
    msg: 'Please Enter Otp',
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.redAccent,
    textColor: Colors.white,
  );
}
