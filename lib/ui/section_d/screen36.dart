import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/constants.dart';
import 'package:ifri/constants/section_d.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ifri/ui/section_d/screen37.dart';

class Screen36 extends StatefulWidget {
  const Screen36({Key? key}) : super(key: key);

  @override
  State<Screen36> createState() => _Screen36State();
}

class _Screen36State extends State<Screen36> {
  DatabaseReference? ref;

  TextEditingController question63Controller1 = TextEditingController();
  TextEditingController question63Controller2 = TextEditingController();
  TextEditingController question63Controller3 = TextEditingController();
  TextEditingController question63Controller4 = TextEditingController();
  TextEditingController question63Controller5 = TextEditingController();
  TextEditingController question63Controller6 = TextEditingController();
  TextEditingController question63Controller7 = TextEditingController();
  TextEditingController question63Controller8 = TextEditingController();
  TextEditingController question63Controller9 = TextEditingController();
  TextEditingController question63Controller10 = TextEditingController();
  TextEditingController question63Controller11 = TextEditingController();
  TextEditingController question63Controller12 = TextEditingController();
  TextEditingController question63Controller13 = TextEditingController();
  TextEditingController question63Controller14 = TextEditingController();
  TextEditingController question63Controller15 = TextEditingController();
  TextEditingController question63Controller16 = TextEditingController();

  String screenName = "screen_36";
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
                        SectionD.SECTION_D_SECTION_4,
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
                      const Text(SectionD.SECTION_D_QUESTION_63,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_63_POINT_1,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_63_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question63Controller1,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_63_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question63Controller2,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_63_PROPERTY_3,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question63Controller3,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_63_PROPERTY_4,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question63Controller4,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_63_POINT_2,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_63_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question63Controller5,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_63_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question63Controller6,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_63_PROPERTY_3,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question63Controller7,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_63_PROPERTY_4,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question63Controller8,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_63_POINT_3,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_63_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question63Controller9,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_63_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question63Controller10,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_63_PROPERTY_3,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question63Controller11,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_63_PROPERTY_4,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question63Controller12,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_63_POINT_4,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_63_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question63Controller13,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_63_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question63Controller14,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_63_PROPERTY_3,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question63Controller15,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_63_PROPERTY_4,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question63Controller16,
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
        .child("question_63")
        .child("response")
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value) {
          int p = -1;
          if (SectionD.SECTION_D_QUESTION_63_POINT_1 == key) {
            p = 0;
          } else if (SectionD.SECTION_D_QUESTION_63_POINT_2 == key) {
            p = 1;
          } else if (SectionD.SECTION_D_QUESTION_63_POINT_3 == key) {
            p = 2;
          } else if (SectionD.SECTION_D_QUESTION_63_POINT_4 == key) {
            p = 3;
          }
          Map<dynamic, dynamic> valuesRes = value as Map<dynamic, dynamic>;
          valuesRes.forEach((key1, value1) {
            int c = -1;
            if (SectionD.SECTION_D_QUESTION_63_PROPERTY_1 == key1) {
              c = 1;
            } else if (SectionD.SECTION_D_QUESTION_63_PROPERTY_2 == key1) {
              c = 2;
            } else if (SectionD.SECTION_D_QUESTION_63_PROPERTY_3 == key1) {
              c = 3;
            } else if (SectionD.SECTION_D_QUESTION_63_PROPERTY_4 == key1) {
              c = 4;
            }

            if (p > -1 && c > 0) {
              int position = (p * 4) + c;
              if (position == 1) {
                question63Controller1.text = value1;
              } else if (position == 2) {
                question63Controller2.text = value1;
              } else if (position == 3) {
                question63Controller3.text = value1;
              } else if (position == 4) {
                question63Controller4.text = value1;
              } else if (position == 5) {
                question63Controller5.text = value1;
              } else if (position == 6) {
                question63Controller6.text = value1;
              } else if (position == 7) {
                question63Controller7.text = value1;
              } else if (position == 8) {
                question63Controller8.text = value1;
              } else if (position == 9) {
                question63Controller9.text = value1;
              } else if (position == 10) {
                question63Controller10.text = value1;
              } else if (position == 11) {
                question63Controller11.text = value1;
              } else if (position == 12) {
                question63Controller12.text = value1;
              } else if (position == 13) {
                question63Controller13.text = value1;
              } else if (position == 14) {
                question63Controller14.text = value1;
              } else if (position == 15) {
                question63Controller15.text = value1;
              } else if (position == 16) {
                question63Controller16.text = value1;
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
        "question_63": {
          "question": SectionD.SECTION_D_QUESTION_63,
          "response": {
            SectionD.SECTION_D_QUESTION_63_POINT_1: {
              SectionD.SECTION_D_QUESTION_63_PROPERTY_1:
                  question63Controller1.text,
              SectionD.SECTION_D_QUESTION_63_PROPERTY_2:
                  question63Controller2.text,
              SectionD.SECTION_D_QUESTION_63_PROPERTY_3:
                  question63Controller3.text,
              SectionD.SECTION_D_QUESTION_63_PROPERTY_4:
                  question63Controller4.text,
            },
            SectionD.SECTION_D_QUESTION_63_POINT_2: {
              SectionD.SECTION_D_QUESTION_63_PROPERTY_1:
                  question63Controller5.text,
              SectionD.SECTION_D_QUESTION_63_PROPERTY_2:
                  question63Controller6.text,
              SectionD.SECTION_D_QUESTION_63_PROPERTY_3:
                  question63Controller7.text,
              SectionD.SECTION_D_QUESTION_63_PROPERTY_4:
                  question63Controller8.text,
            },
            SectionD.SECTION_D_QUESTION_63_POINT_3: {
              SectionD.SECTION_D_QUESTION_63_PROPERTY_1:
                  question63Controller9.text,
              SectionD.SECTION_D_QUESTION_63_PROPERTY_2:
                  question63Controller10.text,
              SectionD.SECTION_D_QUESTION_63_PROPERTY_3:
                  question63Controller11.text,
              SectionD.SECTION_D_QUESTION_63_PROPERTY_4:
                  question63Controller12.text,
            },
            SectionD.SECTION_D_QUESTION_63_POINT_4: {
              SectionD.SECTION_D_QUESTION_63_PROPERTY_1:
                  question63Controller13.text,
              SectionD.SECTION_D_QUESTION_63_PROPERTY_2:
                  question63Controller14.text,
              SectionD.SECTION_D_QUESTION_63_PROPERTY_3:
                  question63Controller15.text,
              SectionD.SECTION_D_QUESTION_63_PROPERTY_4:
                  question63Controller16.text,
            },
          }
        },
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const Screen37();
        },
      ),
    );
  }
}
