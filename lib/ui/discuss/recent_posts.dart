import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:ifri/services/discussion_service/discussion_data.dart';
import 'package:ifri/services/discussion_service/discussion_service_impl.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/discuss/post_view.dart';
import 'package:provider/provider.dart';

class RecentPosts extends StatefulWidget {
  const RecentPosts({Key? key}) : super(key: key);

  @override
  State<RecentPosts> createState() => _RecentPostsState();
}

class _RecentPostsState extends State<RecentPosts> {
  late DiscussionService discussionService;

  @override
  void initState() {
    super.initState();
    discussionService = context.read<DiscussionService>();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: discussionService.getRecentPosts(5),
      builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        return ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            final map = document.data() as Map<String, dynamic>;
            final postData = PostData.fromMap(map);

            return Container(
              margin: const EdgeInsets.all(5),
              child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            PostView(data: postData, ref: document.reference),
                      ),
                    );
                  },
                  child: PostMini(postData: postData)),
            );
          }).toList(),
        );
      },
    );
  }
}

class PostMini extends StatelessWidget {
  const PostMini({
    Key? key,
    required this.postData,
  }) : super(key: key);

  final PostData postData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      minVerticalPadding: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      tileColor: Colors.grey.shade900,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: Text(
              postData.postTitle,
              style: CustomStyle.questionBoldTitle.copyWith(fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    FlutterRemix.arrow_drop_up_line,
                    color: Colors.greenAccent,
                  ),
                  label: Text(postData.upvotes.toString())),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  postData.authoredDate.toString().substring(0, 16),
                  style: CustomStyle.questionTitle.copyWith(fontSize: 9),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
      enableFeedback: true,
    );
  }
}
