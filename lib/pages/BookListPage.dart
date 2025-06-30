import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/currentUser.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({Key? key}) : super(key: key);

  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book List'),
      ),
      body: _buildUserBookList(),
    );
  }

  Widget _buildUserBookList() {
    String? uid = UserSingleton.instance.uid;
    if (uid == null) {
      // If UID is not available, display a placeholder or loading indicator
      return CircularProgressIndicator(); // Example of a loading indicator
    } else {
      return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users')
            .doc(uid)
            .collection('userBookList')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Loading indicator while data is being fetched
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          // Display the user's book list
          List<Map<String, dynamic>> books = snapshot.data!.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
          return DataTable(
            columns: const [
              DataColumn(label: Text('Image')),
              DataColumn(label: Text('Title')),
              DataColumn(label: Text('Author')),
              DataColumn(label: Text('Genre')),
              DataColumn(label: Text('Delete')),
              // Add more columns as needed
            ],
            rows: books
                .map(
                  (book) => DataRow(
                cells: [
                  DataCell(
                    // Display the image using an Image widget
                    book['img_url'] != null
                        ? Image.network(
                      book['img_url'],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                        : SizedBox(), // Placeholder if image URL is null
                  ),
                  DataCell(Text(book['title'] ?? '')),
                  DataCell(Text(book['author'] ?? '')),
                  DataCell(Text(book['genre'] ?? '')),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteBook(uid, book['title']), // Call method to delete book
                    ),
                  ),
                  // Add more DataCells for additional columns
                ],
              ),
            )
                .toList(),
          );
        },
      );
    }
  }

  Future<void> _deleteBook(String uid, String bookTitle) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('userBookList')
          .where('title', isEqualTo: bookTitle) // Assuming 'title' field uniquely identifies a book
          .get();

      querySnapshot.docs.forEach((doc) {
        doc.reference.delete();
      });
    } catch (e) {
      print('Error deleting book: $e');
      // Handle error (e.g., show error message to user)
    }
  }
}