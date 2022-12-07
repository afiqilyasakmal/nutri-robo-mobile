import 'package:flutter/material.dart';
import './blogs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutrirobo - Blog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromRGBO(219, 232, 246, 1.0),
      ),
      home: BlogsScreen(),
    );
  }
}
