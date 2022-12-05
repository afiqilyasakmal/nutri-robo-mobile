import 'package:flutter/material.dart';
import 'package:nutrirobo/landingPage/page/landingPage.dart';
import 'package:nutrirobo/tracker/page/tracker_main_page.dart';
import 'package:nutrirobo/faq/page/faq_main_page.dart';

import 'landingPage/page/signIn.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Color.fromRGBO(38, 70, 85, 1),
            ),
            title: const Text("Home Page"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const MyHomePage(title: 'NUTRI-ROBO')),
              );
            },
          ),
          ListTile(
            title: const Text("Tracker"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyTrackerPage()),
              );
            },
          ),
          ListTile(
            title: const Text("Target Health"),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pop(
                context,
              );
            },
          ),
          ListTile(
            title: const Text('Blog'),
            onTap: () {
              Navigator.pop(
                context,
              );
            },
          ),
          ListTile(
            title: const Text('FAQ'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const MyfaqPage()));
            },
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                leading: const Icon(
                  Icons.login,
                  color: Colors.black,
                ),
                title: const Text('Sign In'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInPage()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
