import 'package:flutter/material.dart';
import 'package:ifri/constants/section_c.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_option.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/section_b/screen11.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ifri/constants/constants.dart';
import 'package:ifri/ui/section_c/screen21.dart';

class Screen20 extends StatefulWidget {
  const Screen20({Key? key}) : super(key: key);

  @override
  State<Screen20> createState() => _Screen20State();
}

class _Screen20State extends State<Screen20> {
  DatabaseReference? ref;
  String screenName = "screen_20";
  bool isLoading = true;
  Map<int, String> response = {};
  SharedPreferences? _sharedPreferences;
  String? userId;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  void initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    userId = _sharedPreferences!.getString(Constants.USER_ID);
    ref = FirebaseDatabase.instance.ref('forms/${userId!}/1/section_c');
    setData();
  }

  void setResponse(int position, String value) async {
    response[position] = value;
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container();
    } else {
      return SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
          child: ColoredBox(
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
                          SectionC.SECTION_C_SECTION_6,
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
                      children: const [
                        Text(SectionC.SECTION_C_QUESTION_39,
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
                      height: 600,
                      child: Row(children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  width: 200,
                                  height: 60,
                                  child: Text(
                                      SectionC.SECTION_C_QUESTION_39_OPTION_1,
                                      style: CustomStyle.answer),
                                ),
                                CustomOption.yesNoButtons(
                                    1, response[1], setResponse),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 200,
                                  height: 75,
                                  child: Text(
                                      SectionC.SECTION_C_QUESTION_39_OPTION_2,
                                      style: CustomStyle.answer),
                                ),
                                CustomOption.yesNoButtons(
                                    2, response[2], setResponse),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 200,
                                  height: 60,
                                  child: Text(
                                      SectionC.SECTION_C_QUESTION_39_OPTION_3,
                                      style: CustomStyle.answer),
                                ),
                                CustomOption.yesNoButtons(
                                    3, response[3], setResponse),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 200,
                                  height: 75,
                                  child: Text(
                                      SectionC.SECTION_C_QUESTION_39_OPTION_4,
                                      style: CustomStyle.answer),
                                ),
                                CustomOption.yesNoButtons(
                                    4, response[4], setResponse),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 200,
                                  height: 75,
                                  child: Text(
                                      SectionC.SECTION_C_QUESTION_39_OPTION_5,
                                      style: CustomStyle.answer),
                                ),
                                CustomOption.yesNoButtons(
                                    5, response[5], setResponse),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 200,
                                  height: 60,
                                  child: Text(
                                      SectionC.SECTION_C_QUESTION_39_OPTION_6,
                                      style: CustomStyle.answer),
                                ),
                                CustomOption.yesNoButtons(
                                    6, response[6], setResponse),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 200,
                                  height: 60,
                                  child: Text(
                                      SectionC.SECTION_C_QUESTION_39_OPTION_7,
                                      style: CustomStyle.answer),
                                ),
                                CustomOption.yesNoButtons(
                                    7, response[7], setResponse),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 200,
                                  height: 75,
                                  child: Text(
                                      SectionC.SECTION_C_QUESTION_39_OPTION_8,
                                      style: CustomStyle.answer),
                                ),
                                CustomOption.yesNoButtons(
                                    8, response[8], setResponse),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 200,
                                  height: 30,
                                  child: Text(
                                      SectionC.SECTION_C_QUESTION_39_OPTION_9,
                                      style: CustomStyle.answer),
                                ),
                                CustomOption.yesNoButtons(
                                    9, response[9], setResponse),
                              ],
                            ),
                          ],
                        )
                      ]),
                    ),
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
            ),
          ),
        ),
      ));
    }
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const Screen21();
        },
      ),
    );
  }

  void setData() async {
    ref!
        .child(screenName)
        .child("question_39")
        .child("response")
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value) {
          print(key);
          int p = -1;
          if (SectionC.SECTION_C_QUESTION_39_OPTION_1 == key) {
            p = 1;
          } else if (SectionC.SECTION_C_QUESTION_39_OPTION_2 == key) {
            p = 2;
          } else if (SectionC.SECTION_C_QUESTION_39_OPTION_3 == key) {
            p = 3;
          } else if (SectionC.SECTION_C_QUESTION_39_OPTION_4 == key) {
            p = 4;
          } else if (SectionC.SECTION_C_QUESTION_39_OPTION_5 == key) {
            p = 5;
          } else if (SectionC.SECTION_C_QUESTION_39_OPTION_6 == key) {
            p = 6;
          } else if (SectionC.SECTION_C_QUESTION_39_OPTION_7 == key) {
            p = 7;
          } else if (SectionC.SECTION_C_QUESTION_39_OPTION_8 == key) {
            p = 8;
          } else if (SectionC.SECTION_C_QUESTION_39_OPTION_9 == key) {
            p = 9;
          }
          if (p > -1) {
            response[p] = value;
          }
        });
      } else {
        print('No data available');
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  navigateToPreviousScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        "question_39": {
          "question": SectionC.SECTION_C_QUESTION_39,
          "response": {
            SectionC.SECTION_C_QUESTION_39_OPTION_1: response[1],
            SectionC.SECTION_C_QUESTION_39_OPTION_2: response[2],
            SectionC.SECTION_C_QUESTION_39_OPTION_3: response[3],
            SectionC.SECTION_C_QUESTION_39_OPTION_4: response[4],
            SectionC.SECTION_C_QUESTION_39_OPTION_5: response[5],
            SectionC.SECTION_C_QUESTION_39_OPTION_6: response[6],
            SectionC.SECTION_C_QUESTION_39_OPTION_7: response[7],
            SectionC.SECTION_C_QUESTION_39_OPTION_8: response[8],
            SectionC.SECTION_C_QUESTION_39_OPTION_9: response[9],
          }
        },
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }
}
