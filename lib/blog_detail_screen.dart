import 'package:flutter/material.dart';

class BlogDetailScreen extends StatelessWidget {
  
  final String blogId;
  final String blogTitle;

  BlogDetailScreen(this.blogId, this.blogTitle); 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(blogTitle),
        ) ,
      body: Center(
        child: Text(
          'The detailed post!',
          ) 
        ),
    );
  }
}