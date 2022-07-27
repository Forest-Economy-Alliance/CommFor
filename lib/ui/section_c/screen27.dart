import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/constants.dart';
import 'package:ifri/constants/section_c.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ifri/ui/section_c/screen28.dart';

class Screen27 extends StatefulWidget {
  const Screen27({Key? key}) : super(key: key);

  @override
  State<Screen27> createState() => _Screen27State();
}

class _Screen27State extends State<Screen27> {
  DatabaseReference? ref;

  TextEditingController question50Controller1 = TextEditingController();
  TextEditingController question50Controller2 = TextEditingController();
  TextEditingController question50Controller3 = TextEditingController();
  TextEditingController question50Controller4 = TextEditingController();
  TextEditingController question50Controller5 = TextEditingController();
  TextEditingController question50Controller6 = TextEditingController();

  String screenName = "screen_27";
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
                        SectionC.SECTION_C_SECTION_9,
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
                      const Text(SectionC.SECTION_C_QUESTION_50,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_50_POINT_1,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_50_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question50Controller1,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_50_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question50Controller2,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_50_PROPERTY_3,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question50Controller3,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_50_POINT_2,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_50_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question50Controller4,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_50_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question50Controller5,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_50_PROPERTY_3,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question50Controller6,
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
        .child("question_50")
        .child("response")
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value) {
          int p = -1;
          if (SectionC.SECTION_C_QUESTION_50_POINT_1 == key) {
            p = 0;
          } else if (SectionC.SECTION_C_QUESTION_50_POINT_2 == key) {
            p = 1;
          }
          Map<dynamic, dynamic> valuesRes = value as Map<dynamic, dynamic>;
          valuesRes.forEach((key1, value1) {
            int c = -1;
            if (SectionC.SECTION_C_QUESTION_50_PROPERTY_1 == key1) {
              c = 1;
            } else if (SectionC.SECTION_C_QUESTION_50_PROPERTY_2 == key1) {
              c = 2;
            } else if (SectionC.SECTION_C_QUESTION_50_PROPERTY_3 == key1) {
              c = 3;
            }

            if (p > -1 && c > 0) {
              int position = (p * 3) + c;
              if (position == 1) {
                question50Controller1.text = value1;
              } else if (position == 2) {
                question50Controller2.text = value1;
              } else if (position == 3) {
                question50Controller3.text = value1;
              } else if (position == 4) {
                question50Controller4.text = value1;
              } else if (position == 5) {
                question50Controller5.text = value1;
              } else if (position == 6) {
                question50Controller6.text = value1;
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
        "question_50": {
          "question": SectionC.SECTION_C_QUESTION_50,
          "response": {
            SectionC.SECTION_C_QUESTION_50_POINT_1: {
              SectionC.SECTION_C_QUESTION_50_PROPERTY_1:
                  question50Controller1.text,
              SectionC.SECTION_C_QUESTION_50_PROPERTY_2:
                  question50Controller2.text,
              SectionC.SECTION_C_QUESTION_50_PROPERTY_3:
                  question50Controller3.text
            },
            SectionC.SECTION_C_QUESTION_50_POINT_2: {
              SectionC.SECTION_C_QUESTION_50_PROPERTY_1:
                  question50Controller4.text,
              SectionC.SECTION_C_QUESTION_50_PROPERTY_2:
                  question50Controller5.text,
              SectionC.SECTION_C_QUESTION_50_PROPERTY_3:
                  question50Controller6.text
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
          return const Screen28();
        },
      ),
    );
  }
}
