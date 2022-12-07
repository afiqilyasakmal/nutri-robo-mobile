// halaman yang menampilkan post
import 'package:flutter/material.dart';

import './dummy_data.dart';
import './blog_item.dart';

// class untuk menampilkan daftar post
class BlogsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Blog'),),
      body: GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_BLOGS
      .map(
        (blogData) => BlogItem(blogData.id, blogData.title, blogData.color)).toList(), 
      // desain grid
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        ),
    ),
    ); 
  }
}