import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:ifri/services/discussion_service/discussion_data.dart';
import 'package:ifri/services/discussion_service/discussion_service_impl.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/discuss/new_post.dart';
import 'package:provider/provider.dart';

class PostView extends StatefulWidget {
  const PostView({
    Key? key,
    required this.data,
    required this.ref,
  }) : super(key: key);
  final PostData data;
  final DocumentReference<Object?> ref;
  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  late DiscussionService discussionService;
  late FirebaseAuthService authService;
  int upvotes = 0;
  @override
  void initState() {
    super.initState();
    discussionService = context.read<DiscussionService>();
    authService = context.read<FirebaseAuthService>();
    upvotes = widget.data.upvotes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Text(
                widget.data.postTitle,
                style: CustomStyle.questionBoldTitle,
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              tileColor: Colors.grey.shade900,
              title: Text(
                "By : ${widget.data.authorName}",
                style: CustomStyle.answer,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Last Edited on : ${widget.data.lastEdited.toUtc().toString()}",
                      style: CustomStyle.questionTitle.copyWith(fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SelectableText(
                    widget.data.postDescription,
                    style: CustomStyle.questionTitle.copyWith(fontSize: 15),
                  ),
                ],
              ),
              enableFeedback: true,
              isThreeLine: true,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Replies",
                    style: CustomStyle.questionTitle,
                  ),
                  Row(
                    children: [
                      TextButton.icon(
                        onPressed: () async {
                          final res = await discussionService.upvotePost(
                              widget.ref.id, authService.user!.uid);
                          if (res != null) {
                            setState(() {
                              upvotes += res ? 1 : -1;
                            });
                          }
                        },
                        icon: const Icon(
                          FlutterRemix.arrow_drop_up_fill,
                          color: Colors.greenAccent,
                          size: 30,
                        ),
                        label: Text(upvotes.toString()),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => NewPost(
                                  isReply: true,
                                  ref: widget.ref,
                                ),
                              ));
                        },
                        icon: const Icon(
                          FlutterRemix.add_fill,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: discussionService.getReplies(widget.ref),
              builder: (ctx, snapshot) {
                if (snapshot.hasError) {
                  return const Text(
                    'Something went wrong',
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                }
                if (snapshot.data!.size == 0) {
                  return Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: const Text(
                      "No Replies found",
                      style: CustomStyle.screenTitle,
                    ),
                  );
                }
                return ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    final map = document.data() as Map<String, dynamic>;
                    final postData = PostData.fromMap(map);
                    final authorNameSplit = postData.authorName.split(" ");
                    final authorName =
                        "By \"${authorNameSplit[0]} ${authorNameSplit[0][0].toUpperCase()}.\"";

                    return Container(
                      margin: const EdgeInsets.all(5),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        tileColor: Colors.grey.shade800,
                        title: Text(
                          postData.postTitle,
                          style: CustomStyle.questionBoldTitle,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              postData.postDescription,
                              style: CustomStyle.questionTitle
                                  .copyWith(fontSize: 12),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    authorName,
                                    style: CustomStyle.questionTitle.copyWith(
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  if (postData.isByAdmin)
                                    const Chip(
                                      backgroundColor: Colors.black,
                                      label: Text(
                                        "Admin",
                                        style: TextStyle(
                                          color: Colors.greenAccent,
                                          fontSize: 9,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            )
                          ],
                        ),
                        enableFeedback: true,
                      ),
                    );
                  }).toList(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
