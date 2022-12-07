import 'package:flutter/material.dart';
import './blog_detail_screen.dart';

// custom widget untuk masing-masing post
import 'package:nutrirobo/models/blog.dart';

class BlogItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  BlogItem(this.id, this.title, this.color);

  void selectPost(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return BlogDetailScreen(id, title);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectPost(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(1), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}