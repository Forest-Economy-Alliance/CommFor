import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/constants.dart';
import 'package:ifri/constants/section_d.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ifri/ui/section_d/screen36.dart';

class Screen35 extends StatefulWidget {
  const Screen35({Key? key}) : super(key: key);

  @override
  State<Screen35> createState() => _Screen35State();
}

class _Screen35State extends State<Screen35> {
  DatabaseReference? ref;

  TextEditingController question62Controller1 = TextEditingController();
  TextEditingController question62Controller2 = TextEditingController();
  TextEditingController question62Controller3 = TextEditingController();
  TextEditingController question62Controller4 = TextEditingController();
  TextEditingController question62Controller5 = TextEditingController();
  TextEditingController question62Controller6 = TextEditingController();
  TextEditingController question62Controller7 = TextEditingController();
  TextEditingController question62Controller8 = TextEditingController();
  TextEditingController question62Controller9 = TextEditingController();
  TextEditingController question62Controller10 = TextEditingController();
  TextEditingController question62Controller11 = TextEditingController();
  TextEditingController question62Controller12 = TextEditingController();
  TextEditingController question62Controller13 = TextEditingController();
  TextEditingController question62Controller14 = TextEditingController();
  TextEditingController question62Controller15 = TextEditingController();
  TextEditingController question62Controller16 = TextEditingController();
  TextEditingController question62Controller17 = TextEditingController();
  TextEditingController question62Controller18 = TextEditingController();
  TextEditingController question62Controller19 = TextEditingController();
  TextEditingController question62Controller20 = TextEditingController();
  TextEditingController question62Controller21 = TextEditingController();
  TextEditingController question62Controller22 = TextEditingController();
  TextEditingController question62Controller23 = TextEditingController();
  TextEditingController question62Controller24 = TextEditingController();
  TextEditingController question62Controller25 = TextEditingController();

  String screenName = "screen_35";
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
                        SectionD.SECTION_D_SECTION_3,
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
                      const Text(SectionD.SECTION_D_QUESTION_62,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_POINT_1,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question62Controller1,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question62Controller2,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_PROPERTY_3,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question62Controller3,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_PROPERTY_4,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question62Controller4,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_PROPERTY_5,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question62Controller5,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_POINT_2,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question62Controller6,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question62Controller7,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_PROPERTY_3,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question62Controller8,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_PROPERTY_4,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question62Controller9,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_PROPERTY_5,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question62Controller10,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_POINT_3,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question62Controller11,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question62Controller12,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_PROPERTY_3,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question62Controller13,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_PROPERTY_4,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question62Controller14,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_PROPERTY_5,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question62Controller15,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_POINT_4,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question62Controller16,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question62Controller17,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_PROPERTY_3,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question62Controller18,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_PROPERTY_4,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question62Controller19,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_PROPERTY_5,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question62Controller20,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_POINT_5,
                          style: CustomStyle.questionBoldTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_PROPERTY_1,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question62Controller21,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_PROPERTY_2,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question62Controller22,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_PROPERTY_3,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question62Controller23,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_PROPERTY_4,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question62Controller24,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionD.SECTION_D_QUESTION_62_PROPERTY_5,
                          style: CustomStyle.optionYesNo),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question62Controller25,
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
        .child("question_62")
        .child("response")
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value) {
          int p = -1;
          if (SectionD.SECTION_D_QUESTION_62_POINT_1 == key) {
            p = 0;
          } else if (SectionD.SECTION_D_QUESTION_62_POINT_2 == key) {
            p = 1;
          } else if (SectionD.SECTION_D_QUESTION_62_POINT_3 == key) {
            p = 2;
          } else if (SectionD.SECTION_D_QUESTION_62_POINT_4 == key) {
            p = 3;
          } else if (SectionD.SECTION_D_QUESTION_62_POINT_5 == key) {
            p = 4;
          }
          Map<dynamic, dynamic> valuesRes = value as Map<dynamic, dynamic>;
          valuesRes.forEach((key1, value1) {
            int c = -1;
            if (SectionD.SECTION_D_QUESTION_62_PROPERTY_1 == key1) {
              c = 1;
            } else if (SectionD.SECTION_D_QUESTION_62_PROPERTY_2 == key1) {
              c = 2;
            } else if (SectionD.SECTION_D_QUESTION_62_PROPERTY_3 == key1) {
              c = 3;
            } else if (SectionD.SECTION_D_QUESTION_62_PROPERTY_4 == key1) {
              c = 4;
            } else if (SectionD.SECTION_D_QUESTION_62_PROPERTY_5_SHORT ==
                key1) {
              c = 5;
            }

            if (p > -1 && c > 0) {
              int position = (p * 5) + c;
              if (position == 1) {
                question62Controller1.text = value1;
              } else if (position == 2) {
                question62Controller2.text = value1;
              } else if (position == 3) {
                question62Controller3.text = value1;
              } else if (position == 4) {
                question62Controller4.text = value1;
              } else if (position == 5) {
                question62Controller5.text = value1;
              } else if (position == 6) {
                question62Controller6.text = value1;
              } else if (position == 7) {
                question62Controller7.text = value1;
              } else if (position == 8) {
                question62Controller8.text = value1;
              } else if (position == 9) {
                question62Controller9.text = value1;
              } else if (position == 10) {
                question62Controller10.text = value1;
              } else if (position == 11) {
                question62Controller11.text = value1;
              } else if (position == 12) {
                question62Controller12.text = value1;
              } else if (position == 13) {
                question62Controller13.text = value1;
              } else if (position == 14) {
                question62Controller14.text = value1;
              } else if (position == 15) {
                question62Controller15.text = value1;
              } else if (position == 16) {
                question62Controller16.text = value1;
              } else if (position == 17) {
                question62Controller17.text = value1;
              } else if (position == 18) {
                question62Controller18.text = value1;
              } else if (position == 19) {
                question62Controller19.text = value1;
              } else if (position == 20) {
                question62Controller20.text = value1;
              } else if (position == 21) {
                question62Controller21.text = value1;
              } else if (position == 22) {
                question62Controller22.text = value1;
              } else if (position == 23) {
                question62Controller23.text = value1;
              } else if (position == 24) {
                question62Controller24.text = value1;
              } else if (position == 25) {
                question62Controller25.text = value1;
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
        "question_62": {
          "question": SectionD.SECTION_D_QUESTION_62,
          "response": {
            SectionD.SECTION_D_QUESTION_62_POINT_1: {
              SectionD.SECTION_D_QUESTION_62_PROPERTY_1:
                  question62Controller1.text,
              SectionD.SECTION_D_QUESTION_62_PROPERTY_2:
                  question62Controller2.text,
              SectionD.SECTION_D_QUESTION_62_PROPERTY_3:
                  question62Controller3.text,
              SectionD.SECTION_D_QUESTION_62_PROPERTY_4:
                  question62Controller4.text,
              SectionD.SECTION_D_QUESTION_62_PROPERTY_5_SHORT:
                  question62Controller5.text
            },
            SectionD.SECTION_D_QUESTION_62_POINT_2: {
              SectionD.SECTION_D_QUESTION_62_PROPERTY_1:
                  question62Controller6.text,
              SectionD.SECTION_D_QUESTION_62_PROPERTY_2:
                  question62Controller7.text,
              SectionD.SECTION_D_QUESTION_62_PROPERTY_3:
                  question62Controller8.text,
              SectionD.SECTION_D_QUESTION_62_PROPERTY_4:
                  question62Controller9.text,
              SectionD.SECTION_D_QUESTION_62_PROPERTY_5_SHORT:
                  question62Controller10.text
            },
            SectionD.SECTION_D_QUESTION_62_POINT_3: {
              SectionD.SECTION_D_QUESTION_62_PROPERTY_1:
                  question62Controller11.text,
              SectionD.SECTION_D_QUESTION_62_PROPERTY_2:
                  question62Controller12.text,
              SectionD.SECTION_D_QUESTION_62_PROPERTY_3:
                  question62Controller13.text,
              SectionD.SECTION_D_QUESTION_62_PROPERTY_4:
                  question62Controller14.text,
              SectionD.SECTION_D_QUESTION_62_PROPERTY_5_SHORT:
                  question62Controller15.text
            },
            SectionD.SECTION_D_QUESTION_62_POINT_4: {
              SectionD.SECTION_D_QUESTION_62_PROPERTY_1:
                  question62Controller16.text,
              SectionD.SECTION_D_QUESTION_62_PROPERTY_2:
                  question62Controller17.text,
              SectionD.SECTION_D_QUESTION_62_PROPERTY_3:
                  question62Controller18.text,
              SectionD.SECTION_D_QUESTION_62_PROPERTY_4:
                  question62Controller19.text,
              SectionD.SECTION_D_QUESTION_62_PROPERTY_5_SHORT:
                  question62Controller20.text
            },
            SectionD.SECTION_D_QUESTION_62_POINT_5: {
              SectionD.SECTION_D_QUESTION_62_PROPERTY_1:
                  question62Controller21.text,
              SectionD.SECTION_D_QUESTION_62_PROPERTY_2:
                  question62Controller22.text,
              SectionD.SECTION_D_QUESTION_62_PROPERTY_3:
                  question62Controller23.text,
              SectionD.SECTION_D_QUESTION_62_PROPERTY_4:
                  question62Controller24.text,
              SectionD.SECTION_D_QUESTION_62_PROPERTY_5_SHORT:
                  question62Controller25.text
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
          return const Screen36();
        },
      ),
    );
  }
}
