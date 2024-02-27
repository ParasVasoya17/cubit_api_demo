// ignore_for_file: sort_child_properties_last

import 'package:cubit_postmethod_api/drawer.dart';
import 'package:cubit_postmethod_api/get_all_business/get_all-business_state.dart';
import 'package:cubit_postmethod_api/get_all_business/get_all_business_cubit.dart';
import 'package:cubit_postmethod_api/get_business.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// var box = Hive.box<String>('logindata');

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get All Business'),
      ),
      drawer: const MyDrawer(),
      body: BlocBuilder<GetAllBusinessCubit, GetAllBusinessState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return const Center(
              child: Icon(Icons.close),
            );
          } else if (state is LoadedState) {
            final getbusiness = state.getBusiness;

            return ListView.builder(
              itemCount: getbusiness.data.length,
              itemBuilder: (context, index) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                getbusiness.data[index].logo.toString()),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(getbusiness.message),
                          Text(getbusiness.status.toString()),
                          Text(getbusiness.data[index].address),
                          Text(getbusiness.data[index].email),
                          Text(getbusiness.data[index].name),
                          Text(getbusiness.data[index].phone),
                          Text(getbusiness.data[index].id.toString()),
                          Text(getbusiness.data[index].userId.toString()),
                          Text(getbusiness.data[index].website),
                          Text(getbusiness.data[index].updatedAt
                              .toIso8601String()),
                          Text(getbusiness.data[index].createdAt.isUtc
                              .toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

// import 'package:cubit_postmethod_api/get_all_business/get_all-business_state.dart';
// import 'package:cubit_postmethod_api/get_all_business/get_all_business_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('getallbusiness'),
//       ),
//       body: BlocBuilder<GetAllBusinessCubit, GetAllBusinessState>(
//         builder: (context, state) {
//           builder:
//           (context, state) {
//             if (state is LoadingState) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (state is ErrorState) {
//               return const Center(
//                 child: Icon(Icons.close),
//               );
//             } else if (state is LoadedState) {
//               final getbusiness = state.getBusiness;

//               return ListView.builder(
//                 itemCount: getbusiness.data.length,
//                 itemBuilder: (context, index) => Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Row(
//                       children: [
//                         Column(
//                           children: [
//                             CircleAvatar(
//                               backgroundImage:
//                                   NetworkImage(getbusiness.data[index].logo),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(getbusiness.message[index]),
//                             Text(getbusiness.status.toString()),
//                             Text(getbusiness.data[index].address),
//                             Text(getbusiness.data[index].email),
//                             Text(getbusiness.data[index].name),
//                             Text(getbusiness.data[index].phone),

//                             Text(getbusiness.data[index].id.toString()),
//                             Text(getbusiness.data[index].userId.toString()),
//                             Text(getbusiness.data[index].website),
//                             //   Text(getbusiness.data[index].updatedAt
//                             //       .toIso8601String()),
//                             //          Text(getbusiness.data[index].createdAt.isUtc
//                             //       .toString()),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             }
//           };
//           return Container();
//         },
//       ),
//     );
//   }
// }
