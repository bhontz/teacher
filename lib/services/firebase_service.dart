import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../models/comment_model.dart';
import 'package:intl/intl.dart';
import 'dart:developer' as logger;
import 'dart:math';

class FirestoreDatabase {
  User? user = FirebaseAuth.instance.currentUser; // part of the database key
  final CollectionReference commentsCollection = FirebaseFirestore.instance
      .collection('Testing');

  String createMessageId() {
    var rng = Random();
    var formatter = DateFormat('yyyyMdHms');
    String formatted = formatter.format(DateTime.now());
    return ('$formatted${rng.nextInt(999).toString().padLeft(4, '0')}');
  }

  Future<void> addComment(String commentText) {
    return commentsCollection.add({
      'messageId': createMessageId(),
      'userId': user?.email,
      'comment': commentText,
      'timestamp': DateTime.now(),
    });
  }

  Stream<QuerySnapshot> getComments() {
    final commentStream =
        FirebaseFirestore.instance.collection('Testing').snapshots();

    return commentStream;
  }
}
