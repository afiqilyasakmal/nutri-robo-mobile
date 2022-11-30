import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyfaqPage extends StatefulWidget {
    const MyfaqPage({Key? key}) : super(key: key);

    @override
    _MyfaqPageState createState() => _MyfaqPageState();
}

class _MyfaqPageState extends State<MyfaqPage> {
    Future<List<MyfaqData>> fetchMyfaqData() async {
        var url = Uri.parse('masih belum');
        var response = await http.get(
          url,
          headers: {
              "Access-Control-Allow-Origin": "*",
              "Content-Type": "application/json",
          },
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object MyfaqData
        List<MyfaqData> listMyfaqData = [];
        for (var d in data) {
          if (d != null) {
              listMyfaqData.add(MyfaqData.fromJson(d));
          }
        }

        return listMyfaqData;
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('My Watchlist'),
        ),
        drawer: myDrawer(context),
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
                      "Tidak ada Myfaq :(",
                      style: TextStyle(
                          color: Color(0xff59A5D8),
                          fontSize: 20),
                      ),
                      SizedBox(height: 8),
                  ],
                );
                
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        "${snapshot.data![index].fields.title}"
                      ),
                      onTap: () {
                        Navigator.push(context, 
                          MaterialPageRoute(
                            builder: (context)=> MyfaqDetail(
                              MyfaqData: snapshot.data![index],
                            ),
                          )
                        );
                      } 
                    );
                  }      

                );
              }
            }
          },
        ),
      );
    }
    
}

//https://docs.flutter.dev/cookbook/navigation/passing-data