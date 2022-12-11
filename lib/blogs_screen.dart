// halaman yang menampilkan post
import 'package:flutter/material.dart';
import 'package:nutrirobo/models/blog.dart';

import './dummy_data.dart';
import './blog_item.dart';

// class untuk menampilkan daftar post
class BlogsScreen extends StatelessWidget {     
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Blog'),),
      body: FutureBuilder(
      future: fetchBlog(),
      builder: (context, AsyncSnapshot snapshot) {
        return GridView.builder(
          padding: const EdgeInsets.all(25),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: snapshot.data!.length, 
          itemBuilder: (_, index) => BlogItem(title: snapshot.data![index].fields.title, slug: snapshot.data![index].fields.slug, intro: snapshot.data![index].fields.intro, body: snapshot.data![index].fields.body, createdAt: snapshot.data![index].fields.createdAt.toString())
          );
        },
      ),
    ); 
  }
}