import 'package:flutter/material.dart';

class DetailMyTargetPage extends StatefulWidget {
  var username;
  var weight;
  var height;
  var age;
  var gender;
  var calories;
  var water;
  var exercise;
  var sleep;
  var role;

  DetailMyTargetPage(
      {super.key,
      this.username,
      this.weight,
      this.height,
      this.age,
      this.gender,
      this.calories,
      this.water,
      this.exercise,
      this.sleep,
      this.role});

  @override
  State<DetailMyTargetPage> createState() => _DetailMyTargetState();
}

class _DetailMyTargetState extends State<DetailMyTargetPage> {
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
            const Text("Target Helath"),
            const Text("   "),
            Icon(Icons.health_and_safety_outlined),
          ],
        ),
      ),
      //body:,
    );
  }

  Widget targetView() {
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
              if (widget.role == "2") Text("   "),
              Icon(
                Icons.verified_outlined,
                color: Colors.blue[800],
              )
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
                child: Text(widget.weight + " kg"),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(width: 1.0, color: Colors.indigo.shade600)),
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
                child: Text(widget.height + " cm"),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(width: 1.0, color: Colors.indigo.shade600)),
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
                child: Text(widget.age + " years"),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(width: 1.0, color: Colors.indigo.shade600)),
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
                    if (widget.gender == "m")
                      const Text("Male")
                    else
                      const Text("Female"),
                  ])
                  //Text(widget.gender + ),
                  ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(width: 1.0, color: Colors.indigo.shade600)),
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
                child: Text(widget.calories + " kal/day"),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(width: 1.0, color: Colors.indigo.shade600)),
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
                child: Text(widget.water + " ml/day"),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(width: 1.0, color: Colors.indigo.shade600)),
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
                child: Text(widget.exercise + " minutes/day"),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(width: 1.0, color: Colors.indigo.shade600)),
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
                child: Text(widget.sleep + " hours/day"),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(width: 1.0, color: Colors.indigo.shade600)),
          )),
      const SizedBox(height: 12),
    ]);
  }
}
