import 'dart:js_interop';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/currentUser.dart';




class BookDetailsPage extends StatelessWidget {
  final Map<String, dynamic> book;

  BookDetailsPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book['title'] ?? ''),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    'Title: ${book['title'] ?? ''}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 16.0),
                if (book['img_url'] != null)
                  Flexible(
                    child: Image.network(
                      book['img_url'],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 8.0),
            Text('Author: ${book['author'] ?? ''}'),
            SizedBox(height: 8.0),
            Text('Genre: ${book['genre'] ?? ''}'),
            SizedBox(height: 8.0),
            Text('Summary: ${book['summary'] ?? ''}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addBook();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<String?> _addBook() async{

    String? uid = UserSingleton.instance.uid;
    print(uid);
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    DocumentReference userDocRef = _firestore.collection('users').doc(uid);
    userDocRef.collection('userBookList').add({
      'id': book['_id'],
      'title': book['title'],
      'author': book['author'],
      'genre': book['genre'],
      'img_url': book['img_url'],
      'add_time': DateTime.now()
    });
  }
}


