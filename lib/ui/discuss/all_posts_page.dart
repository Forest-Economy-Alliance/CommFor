import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ifri/services/discussion_service/discussion_data.dart';
import 'package:ifri/services/discussion_service/discussion_service_impl.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/discuss/post_view.dart';
import 'package:ifri/ui/discuss/recent_posts.dart';
import 'package:provider/provider.dart';

class AllPostsPage extends StatefulWidget {
  const AllPostsPage({Key? key}) : super(key: key);

  @override
  State<AllPostsPage> createState() => _AllPostsPageState();
}

class _AllPostsPageState extends State<AllPostsPage> {
  late DiscussionService discussionService;

  @override
  void initState() {
    super.initState();
    discussionService = context.read<DiscussionService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("All Posts"),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: discussionService.viewAllPosts(),
          builder: ((context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'Something went wrong',
                  style: CustomStyle.form,
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text(
                  "Loading",
                  style: CustomStyle.form,
                ),
              );
            }

            return ListView(
              physics: const BouncingScrollPhysics(),
              primary: true,
              addAutomaticKeepAlives: true,
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
                            builder: (_) => PostView(
                                data: postData, ref: document.reference),
                          ),
                        );
                      },
                      child: PostMini(postData: postData)),
                );
              }).toList(),
            );
          }),
        ),
      ),
    );
  }
}
