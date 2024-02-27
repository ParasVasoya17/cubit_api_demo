// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'dart:io';

import 'package:cubit_postmethod_api/login_page.dart';
import 'package:cubit_postmethod_api/post_cubit.dart';
import 'package:cubit_postmethod_api/post_model.dart';
import 'package:cubit_postmethod_api/post_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.grey[500],
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 1.0,
            backgroundColor: Colors.white,
          ),
          body: const Padding(
            padding: EdgeInsets.all(0),
            child: SignUp(),
          ),
        ),
      ),
    );
  }
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();

  final TextEditingController _logocontroller = TextEditingController();
  final TextEditingController _websitecontroller = TextEditingController();
  final postuser = PostCubit;
  final poster = PostRepository;
  final _formKey = GlobalKey<FormState>();
  PostRepository repository = PostRepository(Dio());
  // PostCubit postcubit = PostCubit(repository: PostRepository(Dio()));
  String? email;
  final ImagePicker _picker = ImagePicker();
  late String _image = '';
  Future _getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    final File imagefile = File(image!.path);
// var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = imagefile.path;
      print(_image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namecontroller,
                decoration: const InputDecoration(
                  hintText: "Name",
                ),
                validator: (val) => val!.isEmpty || val.length <= 3
                    ? "username length should be at least 3"
                    : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _phonecontroller,
                decoration: const InputDecoration(hintText: "Phone Number"),
                validator: (val) => val!.isEmpty || val.length < 10
                    ? "Phone Number length should be 10"
                    : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailcontroller,
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
                validator: (val) => val!.isEmpty || !val.contains("@")
                    ? "enter a valid eamil"
                    : null,
                onSaved: (val) {
                  email = val;
                },
              ),
              const SizedBox(height: 10),

              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  onPressed: this._getImage,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              // ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _websitecontroller,
                decoration: const InputDecoration(hintText: "Website"),
              ),
              const SizedBox(height: 30),
              ElevatedButton(onPressed: _signup, child: const Text("SignUp")),
              const SizedBox(
                height: 40,
              ),
              const SizedBox(
                height: 50,
              ),
              RichText(
                text: TextSpan(
                  text: 'Click here to',
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Login',
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignIn()))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signup() async {
    if (_formKey.currentState!.validate()) {
      // final PostModel isSignUp = (await repository.postPost(
      final PostModel isSignUp = (await repository.postPost(
          // _logocontroller.text,
          // _image ,
          _image,
          _namecontroller.text,
          _phonecontroller.text,
          _emailcontroller.text,
          _websitecontroller.text));
      if (isSignUp.status == true) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Successfully Registered Please Signin')));
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Please Try Again')));
      }
    }
  }
}
