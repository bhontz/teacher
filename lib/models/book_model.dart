class Book {
  final String bookID;
  final String title;
  final String author;
  final String? thumbnailUrl;

  Book({
    required this.bookID,
    required this.title,
    required this.author,
    this.thumbnailUrl,
  });
}
