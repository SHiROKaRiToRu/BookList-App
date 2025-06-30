import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'BookDetailsPage.dart';

class Newreleasespage extends StatefulWidget {
  const Newreleasespage({super.key});

  @override
  State<Newreleasespage> createState() => _NewreleasespageState();
}

class _NewreleasespageState extends State<Newreleasespage> {
  List<dynamic> _books = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchNewReleases();
  }

  Future<void> _fetchNewReleases() async {
    final uri = Uri.parse("https://hapi-books.p.rapidapi.com/nominees/romance/2023");
    final headers = {
      "X-RapidAPI-Key": "b19c08de04msh5e60c45f7a600adp1123cejsn870d9cba0a74",
      "X-RapidAPI-Host": "hapi-books.p.rapidapi.com",
    };

    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      setState(() {
        _books = json.decode(response.body);
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load new releases');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Releases'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Cover')),
              DataColumn(label: Text('Title')),
              DataColumn(label: Text('Author')),
              DataColumn(label: Text('Votes')),
              DataColumn(label: Text('URL')),
            ],
            rows: _books.map((book) {
              return DataRow(cells: [
                DataCell(Image.network(
                  book['cover'],
                  width: 50,
                  height: 75,
                  fit: BoxFit.cover,
                )),
                DataCell(
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookDetailsPage(book: {
                            '_id': book['book_id'],
                            'title': book['name'],
                            'author': book['author'],
                            'votes': book['votes'],
                            'img_url': book['cover'],
                            'url': book['url']
                          }),
                        ),
                      );
                    },
                    child: Text(
                      book['name'] ?? '',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                DataCell(Text(book['author'] ?? '')),
                DataCell(Text(book['votes'].toString())),
                DataCell(
                  InkWell(
                    child: Text(
                      'Link',
                      style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                    ),
                    onTap: () => _launchURL(book['url']),
                  ),
                ),
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
