import 'dart:io';

import 'package:cubit_postmethod_api/edit_business_profile/editbusiness_model.dart';
import 'package:cubit_postmethod_api/edit_business_profile/editbusiness_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

import 'drawer.dart';

class EditBusinessPage extends StatefulWidget {
  const EditBusinessPage({Key? key}) : super(key: key);

  @override
  State<EditBusinessPage> createState() => _EditBusinessPageState();
}

class _EditBusinessPageState extends State<EditBusinessPage> {
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
          drawer: const MyDrawer(),
          body: const Padding(
            padding: EdgeInsets.all(0),
            child: AddBusiness(),
          ),
        ),
      ),
    );
  }
}

class AddBusiness extends StatefulWidget {
  const AddBusiness({Key? key}) : super(key: key);

  @override
  State<AddBusiness> createState() => _AddBusinessState();
}

class _AddBusinessState extends State<AddBusiness> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();

  final TextEditingController _logocontroller = TextEditingController();
  final TextEditingController _websitecontroller = TextEditingController();
  final TextEditingController _addresscontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  EditbusinessRepository repository = EditbusinessRepository(Dio());

  String? email;
  final ImagePicker _picker = ImagePicker();
  late String _image;
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
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _addresscontroller,
                decoration: const InputDecoration(hintText: "Address"),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _websitecontroller,
                decoration: const InputDecoration(hintText: "Website"),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: _addbusiness, child: const Text("Add Business")),
              const SizedBox(
                height: 40,
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addbusiness() async {
    if (_formKey.currentState!.validate()) {
      final EditBusinessModel isEdited = (await repository.editBusiness(
          _image,
          _namecontroller.text,
          _phonecontroller.text,
          _emailcontroller.text,
          _addresscontroller.text,
          _websitecontroller.text));
      if (isEdited.status == true) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Business Edited Successfully')));
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Please Try Again')));
      }
    }
  }
}
