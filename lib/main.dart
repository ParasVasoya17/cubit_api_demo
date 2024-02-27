// ignore_for_file: unnecessary_const

import 'dart:io';

import 'package:cubit_postmethod_api/add_business/addbusiness_cubit.dart';
import 'package:cubit_postmethod_api/add_business/addbusiness_repository.dart';
import 'package:cubit_postmethod_api/get_all_business/get_all_business_cubit.dart';
import 'package:cubit_postmethod_api/get_all_business/get_all_business_repository.dart';
import 'package:cubit_postmethod_api/get_business/get_business_cubit.dart';
import 'package:cubit_postmethod_api/get_business/get_business_repository.dart';
import 'package:cubit_postmethod_api/login_cubit/login_cubit.dart';
import 'package:cubit_postmethod_api/login_page.dart';
import 'package:cubit_postmethod_api/my_homepage.dart';
import 'package:cubit_postmethod_api/post_cubit.dart';
import 'package:cubit_postmethod_api/post_repository.dart';
import 'package:cubit_postmethod_api/verify_otp/otp_cubit.dart';
import 'package:cubit_postmethod_api/verify_otp/otp_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'login_cubit/login_repository.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // Directory document = await getApplicationDocumentsDirectory();
  // Hive.init(document.path);
  // await Hive.openBox<String>("logindata");

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // var box = Hive.box<String>('logindata');
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<VerifyOtpCubit>(
          create: (context) =>
              VerifyOtpCubit(repository: VerifyOtpRepository(Dio())),
        ),
        BlocProvider<SendOtpCubit>(
          create: (context) =>
              SendOtpCubit(repository: SendOtpRepository(Dio())),
        ),
        BlocProvider<PostCubit>(
          create: (context) => PostCubit(repository: PostRepository(Dio())),
        ),
        BlocProvider<GetAllBusinessCubit>(
          create: (context) =>
              GetAllBusinessCubit(repository: GetAllBusinessRepository(Dio())),
        ),
        BlocProvider<GetBusinessCubit>(
          create: (context) =>
              GetBusinessCubit(repository: GetBusinessRepository(Dio())),
        ),
        BlocProvider<AddBusinessCubit>(
          create: (context) =>
              AddBusinessCubit(repository: AddBusinessRepository(Dio())),
        ),
      ],
      child: MaterialApp(
          title: 'Flexion API Register',
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          home: const SignIn()),
      // home: box.get(
      //           'isLogged',
      //         ) !=
      //         null
      //     ? MyHomePage()
      //     : const SignIn());
    );
  }
}
