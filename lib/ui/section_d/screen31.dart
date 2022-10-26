import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/section_d.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_option.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/section_d/screen33.dart';
import 'package:provider/provider.dart';

class Screen31 extends StatefulWidget {
  const Screen31({Key? key, required this.formName}) : super(key: key);
  final String formName;
  @override
  State<Screen31> createState() => _Screen31State();
}

class _Screen31State extends State<Screen31> {
  DatabaseReference? ref;
  String screenName = "screen_31";
  Map<int, String> response57 = {};
  String _response58 = "";
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
        .ref('forms/${userId!}/${widget.formName}/section_d');
    setData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12160F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
          child: SingleChildScrollView(
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
                        SectionD.SECTION_D_SECTION_2,
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
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(SectionD.SECTION_D_QUESTION_57,
                                    style: CustomStyle.questionTitle),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: SizedBox(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                child: Row(children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 200,
                                            height: 60,
                                            child: Text(
                                                SectionD
                                                    .SECTION_D_QUESTION_57_OPTION_1,
                                                style: CustomStyle.answer),
                                          ),
                                          CustomOption.yesNoButtons(
                                              1, response57[1], setResponse),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 200,
                                            height: 75,
                                            child: Text(
                                                SectionD
                                                    .SECTION_D_QUESTION_57_OPTION_2,
                                                style: CustomStyle.answer),
                                          ),
                                          CustomOption.yesNoButtons(
                                              2, response57[2], setResponse),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 200,
                                            height: 60,
                                            child: Text(
                                                SectionD
                                                    .SECTION_D_QUESTION_57_OPTION_3,
                                                style: CustomStyle.answer),
                                          ),
                                          CustomOption.yesNoButtons(
                                              3, response57[3], setResponse),
                                        ],
                                      ),
                                    ],
                                  )
                                ]),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(SectionD.SECTION_D_QUESTION_58,
                              style: CustomStyle.questionTitle),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomOption.optionRadioButtons(const [
                            'Yes',
                            'No',
                          ], true, _response58, setResponse58),
                          const SizedBox(
                            height: 10,
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

  void setResponse(int position, String value) async {
    response57[position] = value;
  }

  void setResponse58(String value) async {
    _response58 = value;
  }

  navigateToPreviousScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  void setData() async {
    final res3 = await ref!
        .child(screenName)
        .child("question_58")
        .child("response")
        .get();
    ref!
        .child(screenName)
        .child("question_57")
        .child("response")
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value) {
          // print(key);
          int p = -1;
          if (SectionD.SECTION_D_QUESTION_57_OPTION_1 == key) {
            p = 1;
          } else if (SectionD.SECTION_D_QUESTION_57_OPTION_2 == key) {
            p = 2;
          } else if (SectionD.SECTION_D_QUESTION_57_OPTION_3 == key) {
            p = 3;
          }
          if (p > -1) {
            response57[p] = value;
          }
        });
      } else {
        print('No data available');
      }

      setState(() {
        _response58 = null == res3.value ? "" : res3.value.toString();
        isLoading = false;
      });
    });
  }

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        "question_57": {
          "question": SectionD.SECTION_D_QUESTION_57,
          "response": {
            SectionD.SECTION_D_QUESTION_57_OPTION_1: response57[1],
            SectionD.SECTION_D_QUESTION_57_OPTION_2: response57[2],
            SectionD.SECTION_D_QUESTION_57_OPTION_3: response57[3],
          }
        },
        "question_58": {
          "question": SectionD.SECTION_D_QUESTION_58,
          "response": _response58
        },
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return Screen33(formName: widget.formName);
        },
      ),
    );
  }
}
