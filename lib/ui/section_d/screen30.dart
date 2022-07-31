import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/constants.dart';
import 'package:ifri/constants/section_d.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ifri/ui/section_d/screen31.dart';

class Screen30 extends StatefulWidget {
  const Screen30({Key? key}) : super(key: key);

  @override
  State<Screen30> createState() => _Screen30State();
}

class _Screen30State extends State<Screen30> {
  DatabaseReference? ref;

  TextEditingController question54Controller1 = TextEditingController();
  TextEditingController question54Controller2 = TextEditingController();
  TextEditingController question54Controller3 = TextEditingController();
  TextEditingController question54Controller4 = TextEditingController();
  TextEditingController question54Controller5 = TextEditingController();
  TextEditingController question54Controller6 = TextEditingController();
  TextEditingController question54Controller7 = TextEditingController();
  TextEditingController question54Controller8 = TextEditingController();
  TextEditingController question54Controller9 = TextEditingController();
  TextEditingController question54Controller10 = TextEditingController();
  TextEditingController question54Controller11 = TextEditingController();
  TextEditingController question54Controller12 = TextEditingController();
  TextEditingController question54Controller13 = TextEditingController();
  TextEditingController question54Controller14 = TextEditingController();
  TextEditingController question54Controller15 = TextEditingController();
  TextEditingController question54Controller16 = TextEditingController();
  TextEditingController question54Controller17 = TextEditingController();
  TextEditingController question54Controller18 = TextEditingController();
  TextEditingController question54Controller19 = TextEditingController();
  TextEditingController question54Controller20 = TextEditingController();
  TextEditingController question54Controller21 = TextEditingController();
  TextEditingController question54Controller22 = TextEditingController();

  String screenName = "screen_30";
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
    ref = FirebaseDatabase.instance.ref('forms/${userId!}/1/section_d');
    setData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ColoredBox(
        color: const Color(0xFF12160F),
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
                      onTap: () => {},
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
                        SectionD.SECTION_D_SECTION_1,
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
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(SectionD.SECTION_D_QUESTION_54,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_POINT_1,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question54Controller1,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question54Controller2,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_POINT_2,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question54Controller3,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question54Controller4,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_POINT_3,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question54Controller5,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question54Controller6,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_POINT_4,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question54Controller7,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question54Controller8,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_POINT_5,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question54Controller9,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question54Controller10,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_POINT_6,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question54Controller11,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question54Controller12,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_POINT_7,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question54Controller13,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question54Controller14,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_POINT_8,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question54Controller15,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question54Controller16,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_POINT_9,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question54Controller17,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question54Controller18,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_POINT_10,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question54Controller19,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question54Controller20,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_POINT_11,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question54Controller21,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_54_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question54Controller22,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
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
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  void setData() async {
    ref!
        .child(screenName)
        .child("question_54")
        .child("response")
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value) {
          int p = -1;
          if (SectionD.SECTION_D_QUESTION_54_POINT_1 == key) {
            p = 0;
          } else if (SectionD.SECTION_D_QUESTION_54_POINT_2 == key) {
            p = 1;
          } else if (SectionD.SECTION_D_QUESTION_54_POINT_3 == key) {
            p = 2;
          } else if (SectionD.SECTION_D_QUESTION_54_POINT_4 == key) {
            p = 3;
          } else if (SectionD.SECTION_D_QUESTION_54_POINT_5 == key) {
            p = 4;
          } else if (SectionD.SECTION_D_QUESTION_54_POINT_6 == key) {
            p = 5;
          } else if (SectionD.SECTION_D_QUESTION_54_POINT_7 == key) {
            p = 6;
          } else if (SectionD.SECTION_D_QUESTION_54_POINT_8 == key) {
            p = 7;
          } else if (SectionD.SECTION_D_QUESTION_54_POINT_9 == key) {
            p = 8;
          } else if (SectionD.SECTION_D_QUESTION_54_POINT_10 == key) {
            p = 9;
          } else if (SectionD.SECTION_D_QUESTION_54_POINT_11 == key) {
            p = 10;
          }
          Map<dynamic, dynamic> valuesRes = value as Map<dynamic, dynamic>;
          valuesRes.forEach((key1, value1) {
            int c = -1;
            if (SectionD.SECTION_D_QUESTION_54_PROPERTY_1 == key1) {
              c = 1;
            } else if (SectionD.SECTION_D_QUESTION_54_PROPERTY_2 == key1) {
              c = 2;
            }

            if (p > -1 && c > 0) {
              int position = (p * 2) + c;
              if (position == 1) {
                question54Controller1.text = value1;
              } else if (position == 2) {
                question54Controller2.text = value1;
              } else if (position == 3) {
                question54Controller3.text = value1;
              } else if (position == 4) {
                question54Controller4.text = value1;
              } else if (position == 5) {
                question54Controller5.text = value1;
              } else if (position == 6) {
                question54Controller6.text = value1;
              } else if (position == 7) {
                question54Controller7.text = value1;
              } else if (position == 8) {
                question54Controller8.text = value1;
              } else if (position == 9) {
                question54Controller9.text = value1;
              } else if (position == 10) {
                question54Controller10.text = value1;
              } else if (position == 11) {
                question54Controller11.text = value1;
              } else if (position == 12) {
                question54Controller12.text = value1;
              } else if (position == 13) {
                question54Controller13.text = value1;
              } else if (position == 14) {
                question54Controller14.text = value1;
              } else if (position == 15) {
                question54Controller15.text = value1;
              } else if (position == 16) {
                question54Controller16.text = value1;
              } else if (position == 17) {
                question54Controller17.text = value1;
              } else if (position == 18) {
                question54Controller18.text = value1;
              } else if (position == 19) {
                question54Controller19.text = value1;
              } else if (position == 20) {
                question54Controller20.text = value1;
              } else if (position == 21) {
                question54Controller21.text = value1;
              } else if (position == 22) {
                question54Controller22.text = value1;
              }
            }
          });
        });
      } else {
        print('No data available');
      }
    });
  }

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        "question_54": {
          "question": SectionD.SECTION_D_QUESTION_54,
          "response": {
            SectionD.SECTION_D_QUESTION_54_POINT_1: {
              SectionD.SECTION_D_QUESTION_54_PROPERTY_1:
                  question54Controller1.text,
              SectionD.SECTION_D_QUESTION_54_PROPERTY_2:
                  question54Controller2.text
            },
            SectionD.SECTION_D_QUESTION_54_POINT_2: {
              SectionD.SECTION_D_QUESTION_54_PROPERTY_1:
                  question54Controller3.text,
              SectionD.SECTION_D_QUESTION_54_PROPERTY_2:
                  question54Controller4.text
            },
            SectionD.SECTION_D_QUESTION_54_POINT_3: {
              SectionD.SECTION_D_QUESTION_54_PROPERTY_1:
                  question54Controller5.text,
              SectionD.SECTION_D_QUESTION_54_PROPERTY_2:
                  question54Controller6.text
            },
            SectionD.SECTION_D_QUESTION_54_POINT_4: {
              SectionD.SECTION_D_QUESTION_54_PROPERTY_1:
                  question54Controller7.text,
              SectionD.SECTION_D_QUESTION_54_PROPERTY_2:
                  question54Controller8.text
            },
            SectionD.SECTION_D_QUESTION_54_POINT_5: {
              SectionD.SECTION_D_QUESTION_54_PROPERTY_1:
                  question54Controller9.text,
              SectionD.SECTION_D_QUESTION_54_PROPERTY_2:
                  question54Controller10.text
            },
            SectionD.SECTION_D_QUESTION_54_POINT_6: {
              SectionD.SECTION_D_QUESTION_54_PROPERTY_1:
                  question54Controller11.text,
              SectionD.SECTION_D_QUESTION_54_PROPERTY_2:
                  question54Controller12.text
            },
            SectionD.SECTION_D_QUESTION_54_POINT_7: {
              SectionD.SECTION_D_QUESTION_54_PROPERTY_1:
                  question54Controller13.text,
              SectionD.SECTION_D_QUESTION_54_PROPERTY_2:
                  question54Controller14.text
            },
            SectionD.SECTION_D_QUESTION_54_POINT_8: {
              SectionD.SECTION_D_QUESTION_54_PROPERTY_1:
                  question54Controller15.text,
              SectionD.SECTION_D_QUESTION_54_PROPERTY_2:
                  question54Controller16.text
            },
            SectionD.SECTION_D_QUESTION_54_POINT_9: {
              SectionD.SECTION_D_QUESTION_54_PROPERTY_1:
                  question54Controller17.text,
              SectionD.SECTION_D_QUESTION_54_PROPERTY_2:
                  question54Controller18.text
            },
            SectionD.SECTION_D_QUESTION_54_POINT_10: {
              SectionD.SECTION_D_QUESTION_54_PROPERTY_1:
                  question54Controller19.text,
              SectionD.SECTION_D_QUESTION_54_PROPERTY_2:
                  question54Controller20.text
            },
            SectionD.SECTION_D_QUESTION_54_POINT_11: {
              SectionD.SECTION_D_QUESTION_54_PROPERTY_1:
                  question54Controller21.text,
              SectionD.SECTION_D_QUESTION_54_PROPERTY_2:
                  question54Controller22.text
            }
          }
        },
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const Screen31();
        },
      ),
    );
  }
}
