// ignore_for_file: sort_child_properties_last

import 'package:cubit_postmethod_api/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_business/get_business_cubit.dart';
import 'get_business/get_business_state.dart';
import 'my_homepage.dart';

class GetBusiness extends StatefulWidget {
  GetBusiness({Key? key}) : super(key: key);

  @override
  State<GetBusiness> createState() => _GetBusinessState();
}

// var box = Hive.box<String>('logindata');

class _GetBusinessState extends State<GetBusiness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get All Business'),
      ),
      drawer: const MyDrawer(),
      body: BlocBuilder<GetBusinessCubit, GetBusinessState>(
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
            final business = state.get;

            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(business.data.logo.toString()),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(business.message),
                      // Text(business.status.toString()),
                      Text(business.data.address),
                      Text(business.data.email),
                      Text(business.data.name),
                      Text(business.data.phone),
                      Text(business.data.id.toString()),
                      Text(business.data.userId.toString()),
                      Text(business.data.website),
                      Text(business.data.updatedAt.toIso8601String()),
                      Text(business.data.createdAt.isUtc.toString()),
                    ],
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
