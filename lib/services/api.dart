import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> fetchBookRecommendations() async {
  final uri = Uri.parse("https://book-information-library.p.rapidapi.com/api/books/book-recommendations?genre=Fiction");
  final headers = {
    "X-RapidAPI-Key": "b19c08de04msh5e60c45f7a600adp1123cejsn870d9cba0a74",
    "X-RapidAPI-Host": "book-information-library.p.rapidapi.com",
  };

  final response = await http.get(uri, headers: headers);
  print(response.body);
  Map result = json.decode(response.body);

}

void main() {
  fetchBookRecommendations();
}

