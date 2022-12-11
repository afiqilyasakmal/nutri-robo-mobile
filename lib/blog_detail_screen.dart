import 'package:flutter/material.dart';

class BlogDetailScreen extends StatelessWidget {

  final String title;
  final String slug;
  final String intro;
  final String body;
  final String createdAt;
  //final String pk;

  BlogDetailScreen(this.title, this.slug, this.intro, this.body, this.createdAt); 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        ) ,
      body: Center(
        child: Text(
          body, //INI MASIH BELOM BISA ANJAY
          ) 
        ),
    );
  }
}