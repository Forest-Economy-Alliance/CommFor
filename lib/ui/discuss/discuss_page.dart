import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/discuss/all_posts_page.dart';
import 'package:ifri/ui/discuss/new_post.dart';
import 'package:ifri/ui/discuss/popular_posts.dart';
import 'package:ifri/ui/discuss/recent_posts.dart';
import 'package:ifri/ui/discuss/search_page.dart';

import 'package:provider/provider.dart';

class DiscussPage extends StatefulWidget {
  const DiscussPage({Key? key}) : super(key: key);

  @override
  State<DiscussPage> createState() => _DiscussPageState();
}

class _DiscussPageState extends State<DiscussPage> {
  late FirebaseAuthService authService;

  @override
  void initState() {
    super.initState();
    authService = context.read<FirebaseAuthService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AllPostsPage(),
            ),
          );
        },
        backgroundColor: Colors.greenAccent,
        label: const Text(
          "View All",
          style: TextStyle(color: Colors.black),
        ),
      ),
      appBar: AppBar(
        title: const Text("Forum"),
        backgroundColor: Colors.grey.shade900,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            splashRadius: 25,
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) {
                  return const SearchPage();
                },
                barrierDismissible: true,
                useRootNavigator: true,
                useSafeArea: false,
              );
            },
            icon: const Icon(
              FlutterRemix.search_2_line,
            ),
          ),
          IconButton(
            splashRadius: 25,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const NewPost(),
                ),
              );
            },
            icon: const Icon(
              FlutterRemix.add_fill,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              InfoCard(
                info: "Feel free to ask questions and reply to other people. "
                    "Also any help in finding bugs is appreciated :)",
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
                  "Popular Questions",
                  style: CustomStyle.screenTitle,
                ),
              ),
              PopularPosts(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
                  "Recently Posted",
                  style: CustomStyle.screenTitle,
                ),
              ),
              RecentPosts()
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, required this.info}) : super(key: key);

  final String info;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      color: Colors.grey.shade900,
      child: Text(
        info,
        style: CustomStyle.answer.copyWith(
          fontSize: 12,
        ),
      ),
    );
  }
}
