import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ifri/services/discussion_service/discussion_data.dart';
import 'package:ifri/services/discussion_service/discussion_service_impl.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/discuss/post_view.dart';
import 'package:provider/provider.dart';

class PopularPosts extends StatefulWidget {
  const PopularPosts({Key? key}) : super(key: key);

  @override
  State<PopularPosts> createState() => _PopularPostsState();
}

class _PopularPostsState extends State<PopularPosts> {
  late DiscussionService discussionService;

  @override
  void initState() {
    super.initState();
    discussionService = context.read<DiscussionService>();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: discussionService.getPopularPosts(3),
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
                  child: PostSummary(postData: postData)),
            );
          }).toList(),
        );
      },
    );
  }
}

class PostSummary extends StatelessWidget {
  const PostSummary({
    Key? key,
    required this.postData,
  }) : super(key: key);

  final PostData postData;

  @override
  Widget build(BuildContext context) {
    final temp = postData.authorName.toUpperCase().split(" ");
    String authorinitials;
    if (temp.length > 1) {
      authorinitials = "${temp[0][0]}.${temp[1][0]}.";
    } else {
      authorinitials = temp[0][0];
    }

    return ListTile(
      contentPadding: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      tileColor: Colors.grey.shade900,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            postData.postTitle,
            style: CustomStyle.questionBoldTitle,
          ),
          if (postData.isByAdmin)
            const Chip(
              backgroundColor: Colors.greenAccent,
              label: Text(
                "Admin",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 9,
                ),
              ),
            ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Text(authorinitials),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    postData.authoredDate.toString().substring(0, 16),
                    style: CustomStyle.questionTitle.copyWith(fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Text(
            postData.postDescription,
            style: CustomStyle.questionTitle.copyWith(fontSize: 12),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      enableFeedback: true,
    );
  }
}
