// memodelkan data yang ingin ditampilkan
import 'package:flutter/material.dart';

class Blog {
  final String id;
  final String title;
  final Color color;

  const Blog({
    required this.id, 
    required this.title, 
    this.color = Colors.white
    });
}