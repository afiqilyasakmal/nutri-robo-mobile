import 'package:flutter/material.dart';
import 'package:nutrirobo/faq/model/faq_model.dart';

class MyfaqDetail extends StatelessWidget {
  // In the constructor, require a Todo.
  const MyfaqDetail({super.key, required this.myfaqData});

  // Declare a field that holds the Todo.
  final MyfaqData myfaqData;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      // drawer: myDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              '${myfaqData.fields.question}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Answer: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${myfaqData.fields.answer}',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ListTile(
            title: Text(
              'Back',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              // Route kembali ke halaman sebelumnya
              Navigator.pop(context);
            },
            tileColor: Colors.blue,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
