import 'package:cubit_postmethod_api/add_business_page.dart';
import 'package:cubit_postmethod_api/editbusiness_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'get_business.dart';
import 'my_homepage.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.grey[800],
        child: ListView(padding: EdgeInsets.zero, children: [
          // DrawerHeader(
          //   padding: EdgeInsets.zero,
          //   child: UserAccountsDrawerHeader(
          //     decoration: BoxDecoration(color: Colors.grey[800]),
          //     margin: EdgeInsets.zero,
          //     accountName: Text(business),
          //     accountEmail: Text('parasvasoya.flexion@gmail.com'),
          //     currentAccountPicture: CircleAvatar(
          //       backgroundImage: NetworkImage(imgUrl),
          //     ),
          //   ),
          // ),
          ListTile(
            onTap: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MyHomePage())),
            leading: const Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: const Text(
              'GetAllBusiness',
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => GetBusiness())),
            leading: const Icon(
              Icons.add_card,
              color: Colors.white,
            ),
            title: const Text(
              'GetBusiness',
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddBusinessPage())),
            leading: const Icon(
              Icons.add_card,
              color: Colors.white,
            ),
            title: const Text(
              'Add Business',
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const EditBusinessPage())),
            leading: const Icon(
              Icons.add_card,
              color: Colors.white,
            ),
            title: const Text(
              'Edit Business',
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ]));
  }
}
