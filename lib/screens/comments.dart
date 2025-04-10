import 'package:flutter/material.dart';
import '../services/firebase_service.dart';

class CommentsPage extends StatelessWidget {
  CommentsPage({super.key});
  final database = FirestoreDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${'Comments for '}${'name of book'}'),
      ), // was ${book.title}
      body: StreamBuilder(
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
    );
  }
}
