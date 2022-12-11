import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:nutrirobo/model/profile.dart';
import 'package:nutrirobo/page/edit_profile.dart';
//import 'package:pbp_django_auth/pbp_django_auth.dart';

class DetailMyProfilePage extends StatefulWidget {
  final String username;
  //final String name;
  //final String  phone;
  //final String email;
  //final String role;

  DetailMyProfilePage({
    super.key,
    required this.username,
    //required this.name,
    ///required this.phone,
    //required this.email,
    //required this.role
  });

  @override
  State<DetailMyProfilePage> createState() => _DetailMyProfileState();
}

class _DetailMyProfileState extends State<DetailMyProfilePage> {
  late String name;
  late String phone;
  late String email;
  late String role;
  late Future<Profile> futureProfile;

//  @override
//   void initState() {
//     super.initState();

//     name = widget.name;
//     urlImage = widget.urlImage;
//     email = widget.email;
//     futureProfile = fetchProfile(widget.username);
//   }

  Future<List<Profile>> fetchProfile(username) async {
    var url = Uri.parse(
        'https://nutrirobo.up.railway.app/target_profile/accounts/detail/profile/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object ToDo
    List<Profile> listProfile = [];
    for (var d in data) {
      if (d != null) {
        listProfile.add(Profile.fromJson(d));
      }
    }

    return listProfile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Row(
            children: [
              const Text("User Profile"),
              const Text("   "),
              Icon(Icons.account_circle_outlined),
            ],
          ),
        ),
        body: FutureBuilder<Profile>(
            future: futureProfile,
            builder: (context, AsyncSnapshot<Profile> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(children: [
                          Center(
                              child: Row(children: [
                            Text(
                              widget.username,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            if (snapshot.data!.fields.role == "2") Text("   "),
                            Icon(
                              Icons.verified_outlined,
                              color: Colors.blue[800],
                            )
                          ])),
                          const SizedBox(height: 12),
                          Row(children: [
                            const Text(
                              "Name ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(snapshot.data!.fields.name),
                          ]),
                          const SizedBox(height: 10),
                          Row(children: [
                            const Text("Phone ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(snapshot.data!.fields.phone),
                          ]),
                          const SizedBox(height: 10),
                          Row(children: [
                            const Text("Email ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(snapshot.data!.fields.email),
                          ]),
                          const SizedBox(height: 10),
                          Row(children: [
                            const Text("Role ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            if (snapshot.data!.fields.role == "1")
                              const Text("User")
                            else
                              const Text("Instructor"),
                          ]),
                        ]),
                      ),
                      // floatingActionButton:
                      Container(
                          margin: const EdgeInsets.only(left: 35),
                          child: ElevatedButton(
                            // style: ElevatedButton.styleFrom(
                            //   primary: Colors.blue,
                            //   minimumSize: const Size.fromHeight(40),
                            // ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditProfile(
                                          name: snapshot.data!.fields.name,
                                          email: snapshot.data!.fields.email)));
                              //Navigator.pop(context);
                            },
                            child: const Text('EDIT'),
                          ))
                    ]);
                  }
              }
            }));
  }
}
