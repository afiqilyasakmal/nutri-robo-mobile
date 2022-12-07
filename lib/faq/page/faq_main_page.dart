import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:nutrirobo/faq/model/faq_model.dart';
import 'package:nutrirobo/faq/page/faq_detail_page.dart';

class MyfaqPage extends StatefulWidget {
  const MyfaqPage({Key? key}) : super(key: key);

  @override
  _MyfaqPageState createState() => _MyfaqPageState();
}

List<MyfaqData> listMyfaqData = [];
List<MyfaqData> listMyfaqDataFilter = [];

class _MyfaqPageState extends State<MyfaqPage> {
  Future<List<MyfaqData>> fetchMyfaqData() async {
    var url =
        Uri.parse('https://nutrirobo.up.railway.app/FAQ/get_faq_content/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // mereset listMyfaqData agar tidak terjadi duplikasi data
    listMyfaqData = [];

    // melakukan konversi data json menjadi object MyfaqData
    for (var d in data) {
      if (d != null) {
        listMyfaqData.add(MyfaqData.fromJson(d));
      }

      listMyfaqDataFilter = listMyfaqData;
    }

    return listMyfaqData;
  }

  void _runFilter(String enteredKeyword) {
    List<MyfaqData> results = [];
    if (enteredKeyword.isEmpty) {
      results = listMyfaqData;
    } else {
      results = listMyfaqData
          .where((element) => element.fields.question
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      listMyfaqDataFilter = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: FutureBuilder(
        future: fetchMyfaqData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Tidak ada myfaq :(",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    TextField(
                      onChanged: (value) => _runFilter(value),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                          itemCount: listMyfaqDataFilter.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: ListTile(
                                title: Text(
                                    listMyfaqDataFilter[index].fields.question),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MyfaqDetail(
                                          myfaqData: listMyfaqDataFilter[index],
                                        ),
                                      ));
                                },
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}

//https://docs.flutter.dev/cookbook/navigation/passing-data