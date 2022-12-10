import 'package:flutter/material.dart';

class DetailMyProfilePage extends StatefulWidget {
  var username;
  var name;
  var phone;
  var email;
  var role;

  DetailMyProfilePage(
      {super.key, this.username, this.name, this.phone, this.email, this.role});

  @override
  State<DetailMyProfilePage> createState() => _DetailMyProfileState();
}

class _DetailMyProfileState extends State<DetailMyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          title: Row(
            children: [
              const Text("User Profile"),
              const Text("   "),
              Icon(Icons.account_circle_outlined),
            ],
          ),
        ),
        body: Padding(
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
              if (widget.role == "2") Text("   "),
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
              Text(widget.name),
            ]),
            const SizedBox(height: 10),
            Row(children: [
              const Text("Phone ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(widget.phone),
            ]),
            const SizedBox(height: 10),
            Row(children: [
              const Text("Email ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(widget.email),
            ]),
            const SizedBox(height: 10),
            Row(children: [
              const Text("Role ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              if (widget.role == "1")
                const Text("User")
              else
                const Text("Instructor"),
            ]),
          ]),
        ),
        floatingActionButton: Container(
            margin: const EdgeInsets.only(left: 35),
            child: ElevatedButton(
              // style: ElevatedButton.styleFrom(
              //   primary: Colors.blue,
              //   minimumSize: const Size.fromHeight(40),
              // ),
              onPressed: () {
                //Navigator.pop(context);
              },
              child: const Text('EDIT'),
            )));
  }
}
