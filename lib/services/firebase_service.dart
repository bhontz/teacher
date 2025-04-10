import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../models/comment_model.dart';
import 'dart:developer' as logger;
import 'package:intl/intl.dart';
import 'dart:math';

class FirestoreDatabase {
  final String bookId;

  FirestoreDatabase({required this.bookId});

  User? user = FirebaseAuth.instance.currentUser; // part of the database key

  CollectionReference fbCollection(bookId) {
    return FirebaseFirestore.instance
        .collection('Comments')
        .doc(bookId)
        .collection('Comments');
  }

  // // original below
  // final CollectionReference commentsCollection = FirebaseFirestore.instance
  //     .collection('Comments')
  //     .doc(bookId)
  //     .collection('Comments');

  String createMessageId() {
    var rng = Random();
    var formatter = DateFormat('yyyyMdHms');
    String formatted = formatter.format(DateTime.now());
    return ('$formatted${rng.nextInt(999).toString().padLeft(4, '0')}');
  }

  Future<void> addComment(String commentText) {
    String messageId = createMessageId();
    var commentsCollection = fbCollection(bookId);
    var docRef = commentsCollection.doc(messageId);
    return docRef.set({
      'messageId': messageId,
      'userId': user?.email,
      'comment': commentText,
      'timestamp': DateTime.now(),
    });
  }

  void deleteComment(String messageId) async {
    var commentsCollection = fbCollection(bookId);
    var docRef = commentsCollection.doc(messageId);
    try {
      await docRef.delete();
    } catch (e) {
      logger.log('$e');
    }
  }

  Stream<QuerySnapshot> getComments() {
    var commentsCollection = fbCollection(bookId);
    final commentStream = commentsCollection.snapshots();

    return commentStream;
  }
}
