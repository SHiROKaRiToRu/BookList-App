import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_project/pages/BookDetailsPage.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<dynamic> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Enter search query...',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  _search();
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: Text('Title')),
                DataColumn(label: Text('Author')),
                DataColumn(label: Text('Genre')),
                DataColumn(label: Text('Summary')),
                /* DataColumn(label: Text('Image')),*/
              ],
              columnSpacing: 20.0,
              rows: _searchResults.map((book) {
                return DataRow(
                  cells: [
                    DataCell(ElevatedButton(
                      onPressed: () {
                        // Navigate to BookDetailsPage when button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDetailsPage(book: book),
                          ),
                        );
                      },
                      child: Text(
                        book['title'] ?? '',
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
                    DataCell(Text(
                      book['author'] ?? '',
                      overflow: TextOverflow.ellipsis,
                    )),
                    DataCell(Text(
                      book['genre'] ?? '',
                      overflow: TextOverflow.ellipsis,
                    )),
                    DataCell(Container(
                      constraints: BoxConstraints(maxWidth: 200),
                      child: Text(
                        book['summary'] ?? '',
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
                    /*DataCell(Image.network(
                      book['img_url'] ?? '',
                      width: 100,
                      height: 100,
                    )),*/
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _search() async {
    final query = _searchController.text;
    final uri = Uri.parse("https://book-information-library.p.rapidapi.com/api/books/book-recommendations?genre=$query");
    final headers = {
      "X-RapidAPI-Key": "b19c08de04msh5e60c45f7a600adp1123cejsn870d9cba0a74",
      "X-RapidAPI-Host": "book-information-library.p.rapidapi.com",
    };

    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      setState(() {
        _searchResults = json.decode(response.body)['recommendations'];
      });
    } else {
      print('Failed to fetch search results: ${response.statusCode}');
    }
  }
}
