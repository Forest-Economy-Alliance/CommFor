import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/visualise/viz_card.dart';
import 'package:provider/provider.dart';

class VisualisePage extends StatefulWidget {
  const VisualisePage({Key? key}) : super(key: key);

  @override
  State<VisualisePage> createState() => _VisualisePageState();
}

const space = SizedBox(
  height: 20,
);

class _VisualisePageState extends State<VisualisePage> {
  String? userId;
  List<Widget> cards = List.empty(growable: true);
  late FirebaseAuthService authService;
  late Dio dio;

  @override
  void initState() {
    super.initState();
    authService = context.read<FirebaseAuthService>();
    userId = authService.user!.uid;
    dio = context.read<Dio>();
    getStats(uid: userId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF505921),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: const Color(0xFF48501E),
            padding:
                const EdgeInsets.only(top: 35, left: 20, right: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      FlutterRemix.home_3_line,
                      size: 40,
                      color: Colors.orangeAccent,
                    )),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: const Text(
                    "Visualisations",
                    style: CustomStyle.screenTitle,
                  ),
                ),
                InkWell(
                  onTap: () {
                    getStats(uid: userId!);
                  },
                  child: const Icon(
                    FlutterRemix.refresh_line,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              primary: true,
              children: cards,
            ),
          ),
          cards.isEmpty
              ? Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "No Visualisations Found :(",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: "HelveticaNeue",
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Future<Map<String, Map<String, dynamic>>> getStats(
      {required String uid}) async {
    final response = await dio.get("/tasks/$uid");
    final dict = Map<String, Map<String, dynamic>>.from(response.data);
    List<Widget> temp = List.empty(growable: true);
    dict.forEach((key, Map<String, dynamic> value) {
      List<String> urls = List.empty(growable: true);
      value.values.forEach((element) {
        urls.add(element as String);
      });
      temp.add(
        VizCard(imageURLs: urls, names: value.keys.toList()),
      );
    });
    setState(() {
      cards = temp;
    });
    return dict;
  }
}
