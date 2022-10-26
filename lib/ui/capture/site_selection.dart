import 'dart:ui';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/capture/capture_page.dart';
import 'package:provider/provider.dart';

class SiteSelection extends StatefulWidget {
  const SiteSelection({Key? key}) : super(key: key);

  @override
  State<SiteSelection> createState() => _SiteSelectionState();
}

class _SiteSelectionState extends State<SiteSelection> {
  late FirebaseAuthService authService;
  DatabaseReference? ref;
  String? userId;

  @override
  void initState() {
    super.initState();
    authService = context.read<FirebaseAuthService>();
    userId = authService.user!.uid;
    ref = FirebaseDatabase.instance.ref('forms/${userId!}/');
  }

  void newSiteDialog() {
    showDialog(
        context: context,
        builder: (context) {
          TextEditingController controller = TextEditingController();
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF12160F),
                    ),
                    constraints:
                        const BoxConstraints(maxWidth: 400, maxHeight: 150),
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          TextField(
                            controller: controller,
                            maxLines: 1,
                            style: CustomStyle.questionTitle,
                            decoration: InputDecoration(
                              hintText: "Enter New Site Name",
                              hintStyle: CustomStyle.questionTitle.copyWith(
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ),
                          OutlinedButton(
                              onPressed: () {
                                if (controller.text.isEmpty) return;
                                final newRef = ref!
                                    .child(controller.text.trim())
                                    .child("section_b")
                                    .child("capture")
                                    .child('question_1');

                                newRef
                                    .child("question")
                                    .set("Name of the Site");
                                newRef.child("response").set(controller.text);
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Save",
                                style: CustomStyle.form,
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<List<String>?> getData() async {
    List<String> sites = List.empty(growable: true);
    final val = await ref!.get();
    if (val.children.isEmpty) return null;
    for (final i in val.children) {
      sites.add(i.key!);
    }
    return sites;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12160F),
      floatingActionButton: TextButton.icon(
        onPressed: () {
          newSiteDialog();
        },
        icon: const Icon(FlutterRemix.add_fill),
        label: const Text("New Site"),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
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
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: const Text(
                        "Site Selection",
                        style: CustomStyle.screenTitle,
                      ),
                    ),
                    InkWell(
                      onTap: () => {},
                      child: Image.asset(
                        'assets/icons/ic_close.png',
                        fit: BoxFit.cover,
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  color: Colors.black,
                  child: Text(
                    """
Note: After adding a new site, this list might not update immediately. 
Please go back and return to this page to see the new site""",
                    style: CustomStyle.form.copyWith(fontSize: 12),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: FutureBuilder<List<String>?>(
                    future: getData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView(
                          shrinkWrap: true,
                          children: snapshot.data!.map((String e) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => CapturePage(formName: e),
                                    ),
                                  );
                                },
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF7D893B),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15.0,
                                        ),
                                        child: Icon(
                                          FlutterRemix.pin_distance_fill,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                      Text(
                                        e,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: "HelveticaNeue",
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      }
                      return Container(
                        margin: const EdgeInsets.all(15),
                        child: const Text(
                          "No site entries found",
                          style: CustomStyle.questionBoldTitle,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
