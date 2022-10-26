import 'package:algolia/algolia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

import 'discussion_data.dart';

/// This is Discussion Service which deals with the discussion forum
class DiscussionService {
  DiscussionService();
  static final Algolia algolia = Algolia.init(
    applicationId: '4XN1GAX5VY',
    apiKey: '38df6d2551bcb41caf9f8babd8d93c56',
  );
  Logger logger = Logger();

  final db = FirebaseFirestore.instance.collection('posts');

  Future<DocumentReference<Map<String, dynamic>>?> makeReply(
      DocumentReference reference, PostData reply) async {
    final res = await reference
        .collection('replies')
        .add(reply.copyWith(isReply: true).toMap());
    return res;
  }

  Future<DocumentReference<Map<String, dynamic>>?> makePost(
    PostData data,
  ) async {
    /// makes the post
    var ref = db.add(data.toMap());
    return ref;
  }

  Stream<QuerySnapshot> viewAllPosts() {
    // get post
    return db.orderBy('authoredDate', descending: true).snapshots();
  }

  Future<PostData?> getPost(String id) async {
    // get post
    final doc = await db.doc(id).get();
    if (doc.data() == null) return null;
    final data = doc.data() as Map<String, dynamic>;
    return PostData.fromMap(data);
  }

  Future<bool?> upvotePost(String id, String uid) async {
    final data = await getPost(id);
    if (data == null) {
      Fluttertoast.showToast(msg: "Error adding an upvote");
      return null;
    }
    final ref = FirebaseFirestore.instance.collection('posts').doc(id);
    if (data.upvotersUID.contains(uid)) {
      ref.set({
        'upvotes': data.upvotes - 1,
        'upvotersUID': data.upvotersUID..remove(uid)
      }, SetOptions(merge: true));
      return false;
    } else {
      ref.set({
        'upvotes': data.upvotes + 1,
        'upvotersUID': data.upvotersUID..add(uid)
      }, SetOptions(merge: true));
      return true;
    }
  }

  Future<DocumentReference<Map<String, dynamic>>?> makeBugReport(
      BugReportData data) async {
    return await FirebaseFirestore.instance
        .collection("bugs")
        .add(data.toMap());
  }

  Stream<QuerySnapshot> getRecentPosts(int length) {
    // get recent posts for questions
    return FirebaseFirestore.instance
        .collection('posts')
        .orderBy('authoredDate', descending: true)
        .limit(length)
        .snapshots();
  }

  Stream<QuerySnapshot> getPopularPosts(int length) {
    // get recent posts for questions
    return FirebaseFirestore.instance
        .collection('posts')
        .orderBy('upvotes', descending: true)
        .limit(length)
        .snapshots();
  }

  Stream<QuerySnapshot> getReplies(DocumentReference postReference) {
    return postReference
        .collection('replies')
        .orderBy('authoredDate', descending: true)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getRecentBugReports(int length) {
    // ger recent bug reports posted in the forum
    return FirebaseFirestore.instance
        .collection('bugs')
        .orderBy('authoredDate')
        .limit(length)
        .snapshots();
  }
}
