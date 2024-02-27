import 'package:cubit_postmethod_api/my_homepage.dart';
import 'package:cubit_postmethod_api/verify_otp/model.dart';

import 'package:cubit_postmethod_api/verify_otp/otp_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class Verifyotp extends StatefulWidget {
  const Verifyotp(
    this.phone, {
    Key? key,
  }) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final String? phone;

  @override
  State<Verifyotp> createState() => _VerifyotpState();
}

class _VerifyotpState extends State<Verifyotp> {
  @override
  OtpFieldController otpController = OtpFieldController();
  late final String phone;
  String isPin = '';
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return
//     Scaffold(
//         appBar: AppBar(
//           title: Text("Verify Otp"),
//           centerTitle: true,
//         ),
//         body: BlocBuilder<VerifyOtpCubit, PostState>(
//           builder: (context, state) {
//             if (state is LoadingState) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (state is ErrorState) {
//               return const Center(
//                 child: Icon(Icons.close),
//               );
//             } else if (state is LoadedState) {
//               final data = state.post;
//               return Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Expanded(child: darkRoundedPinPut()),
//                       Expanded(child: animatedBorders())
//                     ]),
//               );
//             }

//             return Container();
//           },
//         ));
//   }

//   // Widget darkRoundedPinPut() {
//   //   return PinPut(
//   //     eachFieldWidth: 50.0,
//   //     eachFieldHeight: 50.0,
//   //     withCursor: true,
//   //     fieldsCount: 5,
//   //     controller: _pinPutController,
//   //     eachFieldMargin: EdgeInsets.symmetric(horizontal: 10),
//   //     onSubmit: (String pin) => _showSnackBar(pin),
//   //     submittedFieldDecoration: BoxDecoration(
//   //       color: Colors.green[800],
//   //       borderRadius: BorderRadius.circular(15.0),
//   //     ),
//   //     selectedFieldDecoration: BoxDecoration(
//   //       color: Colors.green[800],
//   //       borderRadius: BorderRadius.circular(15.0),
//   //     ),
//   //     followingFieldDecoration: BoxDecoration(
//   //       color: Colors.green[800],
//   //       borderRadius: BorderRadius.circular(15.0),
//   //     ),
//   //     pinAnimationType: PinAnimationType.rotation,
//   //     textStyle: TextStyle(color: Colors.white,
//   //                          fontSize: 20.0,
//   //                          height: 1),
//   //   );
//   // }

//   Widget animatedBorders() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Pinput(length: 4,
//         // fieldsCount:4,
//         // eachFieldHeight: 50.0,
//         showCursor: true,
//         onSubmitted: (String pin) => _showSnackBar(pin),
//         controller: _pinPutController,
//         submittedFieldDecoration: BoxDecoration(
//           border: Border.all(color: Colors.black),
//           borderRadius: BorderRadius.circular(15.0),
//         ).copyWith(
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         selectedFieldDecoration: BoxDecoration(
//           color: Colors.green,
//           border: Border.all(color: Colors.black),
//           borderRadius: BorderRadius.circular(15.0),
//         ),
//         followingFieldDecoration: BoxDecoration(
//           border: Border.all(color: Colors.black),
//           borderRadius: BorderRadius.circular(15.0),
//         ).copyWith(
//           borderRadius: BorderRadius.circular(5.0),
//           border: Border.all(
//             color: Colors.black,
//           ),
//         ),
//       ),
//     );
//   }

//   void _showSnackBar(String pin) {
//     final snackBar = SnackBar(
//       duration: const Duration(seconds: 4),
//       content: Container(
//         height: 80.0,
//         child: Center(
//           child: Text(
//             'Pin Submitted: $pin',
//             style: const TextStyle(fontSize: 25.0),
//           ),
//         ),
//       ),
//       backgroundColor: Colors.green,
//     );
//     ScaffoldMessenger.of(context)
//       ..hideCurrentSnackBar()
//       ..showSnackBar(snackBar);
//   }
// }
        Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.cleaning_services),
        onPressed: () {
          print("Floating button was pressed.");
          otpController.clear();
          // otpController.set(['2', '3', '5', '5', '7']);
          // otpController.setValue('3', 0);
          // otpController.setFocus(1);
        },
      ),
      body: Center(
        child: Column(
          children: [
            OTPTextField(
                controller: otpController,
                length: 4,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 45,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 15,
                style: const TextStyle(fontSize: 17),
                onChanged: (pin) {
                  print("Changed: " + pin);
                },
                onCompleted: (pin) {
                  print("Completed: " + pin);
                  setState(() {
                    isPin = pin;
                  });
                  // print(otpController);
                }),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                _verify(isPin);
              },
              child: const Text("Confirm"),
            ),
          ],
        ),
      ),
    );
  }

  dynamic _verify(isPin) async {
    final VerifyOtpRepository repository = VerifyOtpRepository(Dio());
    // final otp = otpController.toString();

    final VerifyOtpModel isVerified =
        await repository.verifyotp(isPin, widget.phone!);
// 9737999898
    if (isVerified.status == true) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Successfully Logged In')));
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Please Try Again')));
    }
  }
}
