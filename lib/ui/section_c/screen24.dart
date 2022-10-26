import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/section_c.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/section_c/screen25.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:provider/provider.dart';

class Screen24 extends StatefulWidget {
  const Screen24({Key? key, required this.formName}) : super(key: key);
  final String formName;
  @override
  State<Screen24> createState() => _Screen24State();
}

class _Screen24State extends State<Screen24> {
  DatabaseReference? ref;

  TextEditingController question46Controller1 = TextEditingController();
  TextEditingController question46Controller2 = TextEditingController();
  TextEditingController question46Controller3 = TextEditingController();
  TextEditingController question46Controller4 = TextEditingController();
  TextEditingController question46Controller5 = TextEditingController();
  TextEditingController question46Controller6 = TextEditingController();
  TextEditingController question46Controller7 = TextEditingController();
  TextEditingController question46Controller8 = TextEditingController();
  TextEditingController question46Controller9 = TextEditingController();
  TextEditingController question46Controller10 = TextEditingController();
  TextEditingController question46Controller11 = TextEditingController();
  TextEditingController question46Controller12 = TextEditingController();
  TextEditingController question46Controller13 = TextEditingController();
  TextEditingController question46Controller14 = TextEditingController();
  TextEditingController question46Controller15 = TextEditingController();
  TextEditingController question46Controller16 = TextEditingController();

  String screenName = "screen_24";
  late FirebaseAuthService authService;

  String? userId;

  @override
  void initState() {
    super.initState();
    authService = context.read<FirebaseAuthService>();

    initialize();
  }

  void initialize() async {
    userId = authService.user!.uid;
    ref = FirebaseDatabase.instance
        .ref('forms/${userId!}/${widget.formName}/section_c');
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
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(SectionC.SECTION_C_QUESTION_46,
                            style: CustomStyle.questionTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_46_POINT_1,
                            style: CustomStyle.questionBoldTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_46_PROPERTY_1,
                            style: CustomStyle.optionYesNo),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question46Controller1,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_46_PROPERTY_2,
                            style: CustomStyle.optionYesNo),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question46Controller2,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_46_POINT_2,
                            style: CustomStyle.questionBoldTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_46_PROPERTY_1,
                            style: CustomStyle.optionYesNo),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question46Controller3,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_46_PROPERTY_2,
                            style: CustomStyle.optionYesNo),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question46Controller4,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_46_POINT_3,
                            style: CustomStyle.questionBoldTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_46_PROPERTY_1,
                            style: CustomStyle.optionYesNo),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question46Controller5,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_46_PROPERTY_2,
                            style: CustomStyle.optionYesNo),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question46Controller6,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_46_POINT_4,
                            style: CustomStyle.questionBoldTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_46_PROPERTY_1,
                            style: CustomStyle.optionYesNo),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question46Controller7,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_46_PROPERTY_2,
                            style: CustomStyle.optionYesNo),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question46Controller8,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_46_POINT_5,
                            style: CustomStyle.questionBoldTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_46_PROPERTY_1,
                            style: CustomStyle.optionYesNo),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question46Controller9,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_46_PROPERTY_2,
                            style: CustomStyle.optionYesNo),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question46Controller10,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_46_POINT_6,
                            style: CustomStyle.questionBoldTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_46_PROPERTY_1,
                            style: CustomStyle.optionYesNo),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question46Controller11,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_46_PROPERTY_2,
                            style: CustomStyle.optionYesNo),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question46Controller12,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_46_POINT_7,
                            style: CustomStyle.questionBoldTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_46_PROPERTY_1,
                            style: CustomStyle.optionYesNo),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question46Controller13,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_46_PROPERTY_2,
                            style: CustomStyle.optionYesNo),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question46Controller14,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_46_POINT_8,
                            style: CustomStyle.questionBoldTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_46_PROPERTY_1,
                            style: CustomStyle.optionYesNo),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question46Controller15,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_46_PROPERTY_2,
                            style: CustomStyle.optionYesNo),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question46Controller16,
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
      ),
    );
  }

  void setData() async {
    ref!
        .child(screenName)
        .child("question_46")
        .child("response")
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value) {
          int p = -1;
          if (SectionC.SECTION_C_QUESTION_46_POINT_1 == key) {
            p = 0;
          } else if (SectionC.SECTION_C_QUESTION_46_POINT_2 == key) {
            p = 1;
          } else if (SectionC.SECTION_C_QUESTION_46_POINT_3 == key) {
            p = 2;
          } else if (SectionC.SECTION_C_QUESTION_46_POINT_4 == key) {
            p = 3;
          } else if (SectionC.SECTION_C_QUESTION_46_POINT_5 == key) {
            p = 4;
          } else if (SectionC.SECTION_C_QUESTION_46_POINT_6 == key) {
            p = 5;
          } else if (SectionC.SECTION_C_QUESTION_46_POINT_7 == key) {
            p = 6;
          } else if (SectionC.SECTION_C_QUESTION_46_POINT_8 == key) {
            p = 7;
          }
          Map<dynamic, dynamic> valuesRes = value as Map<dynamic, dynamic>;
          valuesRes.forEach((key1, value1) {
            int c = -1;
            if (SectionC.SECTION_C_QUESTION_46_PROPERTY_1 == key1) {
              c = 1;
            } else if (SectionC.SECTION_C_QUESTION_46_PROPERTY_2 == key1) {
              c = 2;
            }

            if (p > -1 && c > 0) {
              int position = (p * 2) + c;
              if (position == 1) {
                question46Controller1.text = value1;
              } else if (position == 2) {
                question46Controller2.text = value1;
              } else if (position == 3) {
                question46Controller3.text = value1;
              } else if (position == 4) {
                question46Controller4.text = value1;
              } else if (position == 5) {
                question46Controller5.text = value1;
              } else if (position == 6) {
                question46Controller6.text = value1;
              } else if (position == 7) {
                question46Controller7.text = value1;
              } else if (position == 8) {
                question46Controller8.text = value1;
              } else if (position == 9) {
                question46Controller9.text = value1;
              } else if (position == 10) {
                question46Controller10.text = value1;
              } else if (position == 11) {
                question46Controller11.text = value1;
              } else if (position == 12) {
                question46Controller12.text = value1;
              } else if (position == 13) {
                question46Controller13.text = value1;
              } else if (position == 14) {
                question46Controller14.text = value1;
              } else if (position == 15) {
                question46Controller15.text = value1;
              } else if (position == 16) {
                question46Controller16.text = value1;
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
        "question_46": {
          "question": SectionC.SECTION_C_QUESTION_46,
          "response": {
            SectionC.SECTION_C_QUESTION_46_POINT_1: {
              SectionC.SECTION_C_QUESTION_46_PROPERTY_1:
                  question46Controller1.text,
              SectionC.SECTION_C_QUESTION_46_PROPERTY_2:
                  question46Controller2.text
            },
            SectionC.SECTION_C_QUESTION_46_POINT_2: {
              SectionC.SECTION_C_QUESTION_46_PROPERTY_1:
                  question46Controller3.text,
              SectionC.SECTION_C_QUESTION_46_PROPERTY_2:
                  question46Controller4.text
            },
            SectionC.SECTION_C_QUESTION_46_POINT_3: {
              SectionC.SECTION_C_QUESTION_46_PROPERTY_1:
                  question46Controller5.text,
              SectionC.SECTION_C_QUESTION_46_PROPERTY_2:
                  question46Controller6.text
            },
            SectionC.SECTION_C_QUESTION_46_POINT_4: {
              SectionC.SECTION_C_QUESTION_46_PROPERTY_1:
                  question46Controller7.text,
              SectionC.SECTION_C_QUESTION_46_PROPERTY_2:
                  question46Controller8.text
            },
            SectionC.SECTION_C_QUESTION_46_POINT_5: {
              SectionC.SECTION_C_QUESTION_46_PROPERTY_1:
                  question46Controller9.text,
              SectionC.SECTION_C_QUESTION_46_PROPERTY_2:
                  question46Controller10.text
            },
            SectionC.SECTION_C_QUESTION_46_POINT_6: {
              SectionC.SECTION_C_QUESTION_46_PROPERTY_1:
                  question46Controller11.text,
              SectionC.SECTION_C_QUESTION_46_PROPERTY_2:
                  question46Controller12.text
            },
            SectionC.SECTION_C_QUESTION_46_POINT_7: {
              SectionC.SECTION_C_QUESTION_46_PROPERTY_1:
                  question46Controller13.text,
              SectionC.SECTION_C_QUESTION_46_PROPERTY_2:
                  question46Controller14.text
            },
            SectionC.SECTION_C_QUESTION_46_POINT_8: {
              SectionC.SECTION_C_QUESTION_46_PROPERTY_1:
                  question46Controller15.text,
              SectionC.SECTION_C_QUESTION_46_PROPERTY_2:
                  question46Controller16.text
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
          return Screen25(formName: widget.formName);
        },
      ),
    );
  }
}
