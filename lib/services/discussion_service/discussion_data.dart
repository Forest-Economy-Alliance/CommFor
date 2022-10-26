import 'package:cloud_firestore/cloud_firestore.dart';

class PostData {
  final String postUID;
  final String authorEmail;
  final String authorName;
  final String authorUID;
  final String postTitle;
  final String postDescription;
  final DateTime authoredDate;
  final DateTime lastEdited;
  final int upvotes;
  final List<String> upvotersUID;
  final bool isReply;
  final bool isByAdmin;

  PostData({
    required this.postUID,
    required this.authorEmail,
    required this.authorName,
    required this.authorUID,
    required this.postTitle,
    required this.postDescription,
    required this.authoredDate,
    required this.lastEdited,
    required this.upvotes,
    required this.upvotersUID,
    required this.isReply,
    required this.isByAdmin,
  });

  PostData.fromMap(Map<String, dynamic> map)
      : postUID = map['postUID'],
        authorEmail = map['authorEmail'],
        authorName = map["authorName"],
        authorUID = map['authorUID'],
        postTitle = map['postTitle'],
        postDescription = map['postDescription'],
        authoredDate = (map['authoredDate'] as Timestamp).toDate(),
        lastEdited = map['lastEdited'].toDate(),
        upvotes = map['upvotes'],
        upvotersUID = (map['upvotersUID'] as List<dynamic>).cast<String>(),
        isReply = map['isReply'],
        isByAdmin = map['isByAdmin'];

  PostData copyWith({
    String? postUID,
    String? authorEmail,
    String? authorName,
    String? authorUID,
    String? postTitle,
    String? postDescription,
    DateTime? authoredDate,
    DateTime? lastEdited,
    int? upvotes,
    List<String>? upvotersUID,
    bool? isReply,
    bool? isByAdmin,
  }) {
    return PostData(
      postUID: postUID ?? this.postUID,
      authorEmail: authorEmail ?? this.authorEmail,
      authorName: authorName ?? this.authorName,
      authorUID: authorUID ?? this.authorUID,
      postTitle: postTitle ?? this.postTitle,
      postDescription: postDescription ?? this.postDescription,
      authoredDate: authoredDate ?? this.authoredDate,
      lastEdited: lastEdited ?? this.lastEdited,
      upvotes: upvotes ?? this.upvotes,
      upvotersUID: upvotersUID ?? this.upvotersUID,
      isReply: isReply ?? this.isReply,
      isByAdmin: isByAdmin ?? this.isByAdmin,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "postUID": postUID,
      'authorEmail': authorEmail,
      "authorName": authorName,
      "authorUID": authorUID,
      "postTitle": postTitle,
      "postDescription": postDescription,
      "authoredDate": Timestamp.fromDate(authoredDate.toUtc()),
      "lastEdited": Timestamp.fromDate(lastEdited.toUtc()),
      "upvotes": upvotes,
      "upvotersUID": upvotersUID,
      "isReply": isReply,
      'isByAdmin': isByAdmin,
    };
  }
}

class BugReportData {
  final String bugReportUID;
  final String title;
  final String description;
  final String stepsToFind;
  final String? screenshotURL;

  BugReportData({
    required this.bugReportUID,
    required this.title,
    required this.description,
    required this.stepsToFind,
    required this.screenshotURL,
  });

  BugReportData.fromMap(Map<String, dynamic> map)
      : bugReportUID = map['bugReportUID'],
        title = map['title'],
        description = map['description'],
        stepsToFind = map['stepsToFind'],
        screenshotURL = map['screenshotURL'];

  Map<String, dynamic> toMap() {
    return {
      'bugReportUID': bugReportUID,
      'title': title,
      'description': description,
      'stepsToFind': stepsToFind,
      'screenshotURL': screenshotURL,
    };
  }
}
