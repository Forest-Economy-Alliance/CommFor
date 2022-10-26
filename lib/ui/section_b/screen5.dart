import 'package:flutter/material.dart';
import 'package:ifri/constants/section_b.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_multi_select.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/section_b/screen6.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:provider/provider.dart';

class Screen5 extends StatefulWidget {
  const Screen5({Key? key, required this.formName}) : super(key: key);
  final String formName;
  @override
  State<Screen5> createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  DatabaseReference? ref;
  String screenName = "screen_5";
  List<String> _response = [];
  bool isLoading = true;
  String? userId;
  late FirebaseAuthService authService;

  @override
  void initState() {
    super.initState();
    authService = context.read<FirebaseAuthService>();

    initialize();
  }

  void initialize() async {
    userId = authService.user!.uid;

    ref = FirebaseDatabase.instance
        .ref('forms/${userId!}/${widget.formName}/section_b');
    setData();
  }

  void setResponse(List<String> value) async {
    _response = value;
  }

  navigateToPreviousScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  void setData() async {
    final res = await ref!
        .child(screenName)
        .child("question_7")
        .child("response")
        .get();
    setState(() {
      // _response[0] = null == res.value ? "" : res.value.toString();

      isLoading = false;
    });
  }

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        "question_7": {
          "question": SectionB.SECTION_B_QUESTION_7,
          "response": _response
        }
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }

  @override
  Widget build(BuildContext context) {
    List<String> reportList = [
      'Agriculture',
      'Social infrastructure (schools, hospitals, etc.)',
      'Industry',
      'Other'
    ];
    if (isLoading) {
      return Container();
    } else {
      return SafeArea(
        child: Scaffold(
          body: ColoredBox(
            color: const Color(0xFF12160F),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => {navigateToPreviousScreen(context)},
                        child: Image.asset(
                          'assets/icons/ic_back.png',
                          fit: BoxFit.cover,
                          width: 20,
                          height: 20,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: const Text(
                          SectionB.SECTION_B_SECTION_3,
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
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: const SizedBox(
                            height: 20,
                            width: 300,
                            child: Divider(color: Color(0xffD1D0BD))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(SectionB.SECTION_B_QUESTION_7,
                                style: CustomStyle.questionTitle),
                            const SizedBox(
                              height: 5,
                            ),
                            MultiSelectChip(
                              reportList: reportList,
                              onSelectionChanged: (selectedList) {
                                setResponse(selectedList);
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () => syncData(context),
                              splashColor: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(2),
                              child: CustomButton.nextButton),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return Screen6(formName: widget.formName);
        },
      ),
    );
  }
}
