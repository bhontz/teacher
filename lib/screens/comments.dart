import 'package:flutter/material.dart';
import '../models/book_model.dart';

class CommentsPage extends StatelessWidget {
  final TextEditingController commentController = TextEditingController();

  CommentsPage({super.key, required this.book});

  final Book book;

  buildComments() {
    return Text("example comment");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${'Comments for '} ${book.title}')),
      body: Column(
        children: <Widget>[
          Expanded(child: buildComments()),
          Divider(),
          ListTile(
            title: TextFormField(
              controller: commentController,
              decoration: InputDecoration(labelText: 'Leave a comment ...'),
            ),
            trailing: FloatingActionButton(
              onPressed: () => Text("pressed it"),
              tooltip: 'Post',
              child: const Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          ),
        ],
      ),
    );
  }
}
