import 'dart:ui';

import 'package:algolia/algolia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ifri/services/discussion_service/discussion_data.dart';
import 'package:ifri/services/discussion_service/discussion_service_impl.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/discuss/post_view.dart';
import 'package:ifri/ui/discuss/popular_posts.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  late DiscussionService discussionService;
  List<Widget> searchHits = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    discussionService = context.read<DiscussionService>();
    searchController.addListener(searchListener);
  }

  void searchListener() async {
    final text = searchController.text;
    if (text.isNotEmpty) {
      Algolia algolia = DiscussionService.algolia;
      AlgoliaQuery query = algolia.instance.index('dev').query(text);

      AlgoliaQuerySnapshot snap = await query.getObjects();
      searchHits.clear();
      if (!snap.hasHits) return;
      List<Widget> temp = List.empty(growable: true);
      discussionService.logger.i("Total hits ${snap.nbHits}");
      final h = snap.hits;
      for (final i in h) {
        final data = i.data;
        data['authoredDate'] =
            Timestamp.fromMillisecondsSinceEpoch(data['authoredDate']);
        data['lastEdited'] =
            Timestamp.fromMillisecondsSinceEpoch(data['lastEdited']);
        PostData postData = PostData.fromMap(data);
        temp.add(
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PostView(
                      data: postData,
                      ref: FirebaseFirestore.instance
                          .collection('posts')
                          .doc(postData.postUID),
                    ),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(15.0),
              child: PostSummary(postData: postData),
            ),
          ),
        );
      }
      setState(() {
        searchHits = temp;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Material(
        color: Colors.transparent,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                autocorrect: true,
                autofocus: true,
                controller: searchController,
                maxLines: 1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search Here",
                  hintStyle: CustomStyle.questionTitle.copyWith(
                    color: Colors.grey.shade500,
                  ),
                ),
                style: CustomStyle.questionTitle,
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: searchHits,
            )
          ],
        ),
      ),
    );
  }
}
