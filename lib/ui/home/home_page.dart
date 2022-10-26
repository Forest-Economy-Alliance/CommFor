import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:ifri/ui/capture/capture_page.dart';
import 'package:ifri/ui/discuss/discuss_page.dart';
import 'package:ifri/ui/visualise/visualise_page.dart';
import 'package:provider/provider.dart';

import '../capture/site_selection.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FirebaseAuthService authService;
  @override
  void initState() {
    super.initState();
    authService = context.read<FirebaseAuthService>();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          "assets/images/BG Image@2x.png",
          height: size.height,
          width: size.width,
          fit: BoxFit.cover,
        ),
        SafeArea(
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text("CommFor"),
                  ),
                ),
                backgroundColor: Colors.transparent,
                actions: [
                  IconButton(
                    onPressed: () {
                      authService.logout();
                    },
                    icon: const Icon(
                      Icons.logout,
                    ),
                  )
                ],
              ),
              backgroundColor: Colors.transparent,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => const SiteSelection(),
                          ),
                        );
                      },
                      child: Container(
                        width: (size.width - 40).abs(),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF12160F),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Icon(
                              FlutterRemix.camera_2_line,
                              color: Colors.white,
                              size: 60,
                            ),
                            Text(
                              "Capture",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "HelveticaNeue",
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => const VisualisePage(),
                          ),
                        );
                      },
                      child: Container(
                        width: (size.width - 40).abs(),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF505921),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Icon(
                              FlutterRemix.line_chart_line,
                              color: Colors.white,
                              size: 60,
                            ),
                            Text(
                              "Visualise",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "HelveticaNeue",
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => const DiscussPage(),
                          ),
                        );
                      },
                      child: Container(
                        width: size.width - 40,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF7D893B),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Icon(
                              FlutterRemix.discuss_line,
                              color: Colors.white,
                              size: 60,
                            ),
                            Text(
                              "Discuss",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "HelveticaNeue",
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
