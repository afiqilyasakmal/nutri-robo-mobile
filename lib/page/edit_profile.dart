import 'dart:convert';
import 'package:/nutrirobo/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:';
import 'package:http/http.dart' as http;
//import 'package:pbp_django_auth/pbp_django_auth.dart';

//import 'package:shared_preferences/shared_preferences.dart';

Future<Profile> fetchProfile(String username) async {
  final response = await http.get(Uri.parse(username)); // ini msh blm bener

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Profile.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Profile');
  }
}

class EditProfile extends StatefulWidget {
  final String name;
  final String email;
  const EditProfile({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late String _phone;
  late String _role;

  late String name;
  late String email;
  late Future<Profile> futureProfile;
  late RestorableDateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    name = widget.name;
    email = widget.email;
    futureProfile = fetchProfile(name).then((value) {
      _phone = value.fields.phone;
      _role = value.fields.role;
      return value;
    });
  }

  Widget _buildBio(String initVal) {
    return TextFormField(
      initialValue: initVal,
      decoration: new InputDecoration(
        hintText: "contoh: Hai! saya suka kucing",
        labelText: "Role diri",
        border:
            OutlineInputBorder(borderRadius: new BorderRadius.circular(5.0)),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Role tidak boleh kosong';
        }
        return null;
      },
      onChanged: (x) {
        setState(() {
          _role = x;
        });
      },
    );
  }

  // void _selectDate(DateTime? newSelectedDate) {
  //   if (newSelectedDate != null) {
  //     setState(() {
  //       _selectedDate.value = newSelectedDate;
  //       _birthday = newSelectedDate;
  //     });
  //   }
  // }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Profile"),
          centerTitle: true,
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
                    return Form(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Text(
                                "Edit Your Profile",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      _buildBio(snapshot.data!.fields.phone)),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
              }
            }));
  }
}
