import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/constants.dart';
import 'package:ifri/constants/section_d.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ifri/ui/section_d/screen34.dart';

class Screen33 extends StatefulWidget {
  const Screen33({Key? key}) : super(key: key);

  @override
  State<Screen33> createState() => _Screen33State();
}

class _Screen33State extends State<Screen33> {
  DatabaseReference? ref;

  TextEditingController question60Controller1 = TextEditingController();
  TextEditingController question60Controller2 = TextEditingController();
  TextEditingController question60Controller3 = TextEditingController();
  TextEditingController question60Controller4 = TextEditingController();
  TextEditingController question60Controller5 = TextEditingController();
  TextEditingController question60Controller6 = TextEditingController();
  TextEditingController question60Controller7 = TextEditingController();
  TextEditingController question60Controller8 = TextEditingController();
  TextEditingController question60Controller9 = TextEditingController();
  TextEditingController question60Controller10 = TextEditingController();
  TextEditingController question60Controller11 = TextEditingController();
  TextEditingController question60Controller12 = TextEditingController();

  String screenName = "screen_33";
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
                      const Text(SectionD.SECTION_D_QUESTION_60,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_60_POINT_1,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_60_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question60Controller1,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_60_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question60Controller2,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_60_PROPERTY_3,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question60Controller3,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_60_POINT_2,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_60_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question60Controller4,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_60_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question60Controller5,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_60_PROPERTY_3,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question60Controller6,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_60_POINT_3,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_60_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question60Controller7,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_60_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question60Controller8,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_60_PROPERTY_3,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question60Controller9,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_60_POINT_4,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_60_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question60Controller10,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_60_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question60Controller11,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_60_PROPERTY_3,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question60Controller12,
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
        .child("question_60")
        .child("response")
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value) {
          int p = -1;
          if (SectionD.SECTION_D_QUESTION_60_POINT_1 == key) {
            p = 0;
          } else if (SectionD.SECTION_D_QUESTION_60_POINT_2 == key) {
            p = 1;
          } else if (SectionD.SECTION_D_QUESTION_60_POINT_3 == key) {
            p = 2;
          } else if (SectionD.SECTION_D_QUESTION_60_POINT_4 == key) {
            p = 3;
          }
          Map<dynamic, dynamic> valuesRes = value as Map<dynamic, dynamic>;
          valuesRes.forEach((key1, value1) {
            int c = -1;
            if (SectionD.SECTION_D_QUESTION_60_PROPERTY_1 == key1) {
              c = 1;
            } else if (SectionD.SECTION_D_QUESTION_60_PROPERTY_2 == key1) {
              c = 2;
            } else if (SectionD.SECTION_D_QUESTION_60_PROPERTY_3 == key1) {
              c = 3;
            }

            if (p > -1 && c > 0) {
              int position = (p * 3) + c;
              if (position == 1) {
                question60Controller1.text = value1;
              } else if (position == 2) {
                question60Controller2.text = value1;
              } else if (position == 3) {
                question60Controller3.text = value1;
              } else if (position == 4) {
                question60Controller4.text = value1;
              } else if (position == 5) {
                question60Controller5.text = value1;
              } else if (position == 6) {
                question60Controller6.text = value1;
              } else if (position == 7) {
                question60Controller7.text = value1;
              } else if (position == 8) {
                question60Controller8.text = value1;
              } else if (position == 9) {
                question60Controller9.text = value1;
              } else if (position == 10) {
                question60Controller10.text = value1;
              } else if (position == 11) {
                question60Controller11.text = value1;
              } else if (position == 12) {
                question60Controller12.text = value1;
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
        "question_60": {
          "question": SectionD.SECTION_D_QUESTION_60,
          "response": {
            SectionD.SECTION_D_QUESTION_60_POINT_1: {
              SectionD.SECTION_D_QUESTION_60_PROPERTY_1:
                  question60Controller1.text,
              SectionD.SECTION_D_QUESTION_60_PROPERTY_2:
                  question60Controller2.text,
              SectionD.SECTION_D_QUESTION_60_PROPERTY_3:
                  question60Controller3.text
            },
            SectionD.SECTION_D_QUESTION_60_POINT_2: {
              SectionD.SECTION_D_QUESTION_60_PROPERTY_1:
                  question60Controller4.text,
              SectionD.SECTION_D_QUESTION_60_PROPERTY_2:
                  question60Controller5.text,
              SectionD.SECTION_D_QUESTION_60_PROPERTY_3:
                  question60Controller6.text
            },
            SectionD.SECTION_D_QUESTION_60_POINT_3: {
              SectionD.SECTION_D_QUESTION_60_PROPERTY_1:
                  question60Controller7.text,
              SectionD.SECTION_D_QUESTION_60_PROPERTY_2:
                  question60Controller8.text,
              SectionD.SECTION_D_QUESTION_60_PROPERTY_3:
                  question60Controller9.text
            },
            SectionD.SECTION_D_QUESTION_60_POINT_4: {
              SectionD.SECTION_D_QUESTION_60_PROPERTY_1:
                  question60Controller10.text,
              SectionD.SECTION_D_QUESTION_60_PROPERTY_2:
                  question60Controller11.text,
              SectionD.SECTION_D_QUESTION_60_PROPERTY_3:
                  question60Controller12.text
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
          return const Screen34();
        },
      ),
    );
  }
}
