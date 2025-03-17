import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book_model.dart';

class GoogleAPIService {
  final String url =
      'https://www.googleapis.com/books/v1/volumes?q=inauthor:Smith';

  List<Book> fetchBooks() {
    return List.generate(
      100,
      (i) => Book(title: 'Book $i', author: 'Author $i'),
    );
  }

  Future<List<Book>> fetchPotterBooks() async {
    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return _parseBookJson(res.body);
    } else {
      throw Exception('Error: ${res.statusCode}');
    }
  }

  List<Book> _parseBookJson(String jsonStr) {
    final jsonMap = json.decode(jsonStr);
    final jsonList = (jsonMap['items'] as List);
    return jsonList
        .map(
          (jsonBook) => Book(
            title: jsonBook['volumeInfo']['title'],
            author: (jsonBook['volumeInfo']['authors'] as List).join(', '),
            thumbnailUrl:
                jsonBook['volumeInfo']['imageLinks']['smallThumbnail'],
          ),
        )
        .toList();
  }
}
