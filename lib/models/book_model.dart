import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Book {
  final String title;
  final String author;
  final String genre;
  final String summary;
  final String img_url;

  Book({
    required this.title,
    required this.author,
    required this.genre,
    required this.summary,
    required this.img_url,

  });
}


Book parseBook(Map<String, dynamic> json) {
  return Book(
    title: json['title'] ?? '',
    author: json['author'] ?? '',
    genre: json['genre'] ?? '',
    summary: json['summary'] ?? '',
    img_url: json['img_url'] ?? '',

  );
}
