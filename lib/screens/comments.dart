import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/commentlist/listcomments_bloc.dart';
import '../models/book_model.dart';
import '../models/comment_model.dart';

class CommentsPage extends StatelessWidget {
  final TextEditingController commentController = TextEditingController();

  CommentsPage({
    super.key,
    required this.book,
  }); // will need to get the currentUser info into here

  final Book book;
  final User? currentUser = FirebaseAuth.instance.currentUser;

  Future<void> stabInDatabase(Book book, Comment comment) async {
    String key = 'Comments';
    await FirebaseFirestore.instance
        .collection(key)
        .doc(book.bookId)
        .collection(key)
        .doc(comment.userId)
        .set({'comment': comment.comment, 'timestamp': comment.timestamp});
  }

  Widget createExpanded(listComments) {
    return Expanded(
      child: BlocBuilder<CommentListBloc, CommentListState>(
        builder: (context, state) {
          if (state is CommentListLoaded) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final item = state.items[index];
                return ListTile(
                  // title: Text(item.comment),
                  title: Row(
                    children: [
                      Text(item.userId),
                      SizedBox(width: 10),
                      Text(item.comment),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => listComments.add(CommentRemoveItem(index)),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final listComments = BlocProvider.of<CommentListBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('${'Comments for '} ${book.title}')),
      body: Column(
        children: <Widget>[
          createExpanded(listComments),
          Divider(),
          ListTile(
            title: TextFormField(
              controller: commentController,
              decoration: InputDecoration(labelText: 'Leave a comment ...'),
            ),
            trailing: FloatingActionButton(
              onPressed: () {
                if (commentController.text.isNotEmpty &&
                    currentUser!.email != null) {
                  Comment comment = Comment(
                    userId:
                        currentUser!.email ?? "", // really should never be null
                    comment: commentController.text,
                    timestamp: DateTime.now(),
                  );
                  listComments.add(CommentAddItem(comment));
                  commentController.clear();
                  stabInDatabase(book, comment);
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
