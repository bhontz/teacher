import 'package:flutter/material.dart';
import '../models/book_model.dart';
import '../services/firebase_service.dart';

class CommentsPage extends StatelessWidget {
  final Book book;

  CommentsPage({super.key, required this.book});

  final TextEditingController commentController = TextEditingController();
  // final database = FirestoreDatabase(bookId: bookId);

  @override
  Widget build(BuildContext context) {
    var database = FirestoreDatabase(bookId: book.bookId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${'Comments for '}${book.title}'),
      ), // was ${book.title}
      body: Column(
        children: [
          StreamBuilder(
            stream: database.getComments(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              final commentList = snapshot.data!.docs;
              if (snapshot.data == null || commentList.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Text("No comments yet!"),
                  ),
                );
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: commentList.length,
                  itemBuilder: (context, index) {
                    final comment = commentList[index];
                    return ListTile(
                      title: Text(comment['comment']),
                      subtitle: Text(comment['userId']),
                    );
                  },
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            title: TextFormField(
              controller: commentController,
              decoration: InputDecoration(labelText: 'Leave a comment ...'),
            ),
            trailing: FloatingActionButton(
              onPressed: () {
                if (commentController.text.isNotEmpty) {
                  database.addComment(commentController.text);
                  commentController.clear();
                }
              },
              tooltip: 'Post',
              child: const Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          ),
        ],
      ),
    );
  }
}
