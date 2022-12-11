// widget untuk menampilkan detail post
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

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
        centerTitle: true,
        title: Text(title),
        ) ,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Html(
              data:body,
              style: {
                "p": Style(
                  fontSize: FontSize.larger,
                  lineHeight: LineHeight.em(2),
                  margin: EdgeInsets.only(bottom: 2),
                ),
              },
            ),
          ], 
          ) 
        ),
    );
  }
}