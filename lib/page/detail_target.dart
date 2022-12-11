import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:nutrirobo/model/physical_info.dart';
//import 'package:pbp_django_auth/pbp_django_auth.dart';

class DetailMyTargetPage extends StatefulWidget {
  final String username;
  //final String weight;
  //final String height;
  //final String age;
  //final String gender;
  //final String calories;
  //final String water;
  //final String exercise;
  //final String sleep;
  //final String role;

  DetailMyTargetPage({
    super.key,
    required this.username,
    // required this.weight,
    // required this.height,
    // required this.age,
    // this.gender,
    // this.calories,
    // this.water,
    // this.exercise,
    // this.sleep,
    // this.role
  });

  @override
  State<DetailMyTargetPage> createState() => _DetailMyTargetState();
}

class _DetailMyTargetState extends State<DetailMyTargetPage> {
  late String weight;
  late String height;
  late String age;
  late String gender;
  late String calories;
  late String sleep;
  late String exercise;

  late Future<PhysicalInfo> futureProfile;

  Future<List<PhysicalInfo>> fetchTarget() async {
    var url = Uri.parse(
        'https://nutrirobo.up.railway.app/target_profile/accounts/detail/target/json/');
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
    List<PhysicalInfo> listTarget = [];
    for (var d in data) {
      if (d != null) {
        listTarget.add(PhysicalInfo.fromJson(d));
      }
    }

    return listTarget;
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
              const Text("Target Helath"),
              const Text("   "),
              Icon(Icons.health_and_safety_outlined),
            ],
          ),
        ),
        body: FutureBuilder<PhysicalInfo>(
            future: futureProfile,
            builder: (context, AsyncSnapshot<PhysicalInfo> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    //                   return targetView();
                    //                 }
                    //             }
                    //           }));
                    // }

                    // Widget targetView() {
                    return Column(children: <Widget>[
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
                              // if (snapshot.data!.fields.role == "2") Text("   "),
                              // Icon(
                              //   Icons.verified_outlined,
                              //   color: Colors.blue[800],
                              // )
                            ])),
                          ])),
                      const SizedBox(height: 20),
                      Text("Weight"),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                          child: Container(
                            height: 60,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                // ini warna msh blm di setting
                                child: Text(
                                    snapshot.data!.fields.weight.toString() +
                                        " kg"),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                    width: 1.0, color: Colors.indigo.shade600)),
                          )),
                      const SizedBox(height: 12),
                      Text("Height"),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                          child: Container(
                            height: 60,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                // ini warna msh blm di setting
                                child: Text(
                                    snapshot.data!.fields.height.toString() +
                                        " cm"),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                    width: 1.0, color: Colors.indigo.shade600)),
                          )),
                      const SizedBox(height: 12),
                      Text("Age"),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                          child: Container(
                            height: 60,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                // ini warna msh blm di setting
                                child: Text(
                                    snapshot.data!.fields.age.toString() +
                                        " years"),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                    width: 1.0, color: Colors.indigo.shade600)),
                          )),
                      const SizedBox(height: 12),
                      Text("Gender"),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                          child: Container(
                            height: 60,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  // ini warna msh blm di setting
                                  child: Row(children: [
                                    if (snapshot.data!.fields.gender
                                            .toString() ==
                                        "m")
                                      const Text("Male")
                                    else
                                      const Text("Female"),
                                  ])
                                  //Text(widget.gender + ),
                                  ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                    width: 1.0, color: Colors.indigo.shade600)),
                          )),
                      const SizedBox(height: 12),
                      Text("Calories"),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                          child: Container(
                            height: 60,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                // ini warna msh blm di setting
                                child: Text(
                                    snapshot.data!.fields.calories.toString() +
                                        " kal/day"),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                    width: 1.0, color: Colors.indigo.shade600)),
                          )),
                      const SizedBox(height: 12),
                      Text("Water"),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                          child: Container(
                            height: 60,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                // ini warna msh blm di setting
                                child: Text(
                                    snapshot.data!.fields.water.toString() +
                                        " ml/day"),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                    width: 1.0, color: Colors.indigo.shade600)),
                          )),
                      const SizedBox(height: 12),
                      Text("Exercise"),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                          child: Container(
                            height: 60,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                // ini warna msh blm di setting
                                child: Text(
                                    snapshot.data!.fields.exercise.toString() +
                                        " minutes/day"),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                    width: 1.0, color: Colors.indigo.shade600)),
                          )),
                      const SizedBox(height: 12),
                      Text("Sleep Time"),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                          child: Container(
                            height: 60,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                // ini warna msh blm di setting
                                child: Text(
                                    snapshot.data!.fields.sleep.toString() +
                                        " hours/day"),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                    width: 1.0, color: Colors.indigo.shade600)),
                          )),
                      const SizedBox(height: 12),
                    ]);
                  }
              }
            }));
  }
}
