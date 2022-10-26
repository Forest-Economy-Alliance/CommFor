import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/section_c.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_option.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/section_c/screen28.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:provider/provider.dart';

class Screen27 extends StatefulWidget {
  const Screen27({Key? key, required this.formName}) : super(key: key);
  final String formName;
  @override
  State<Screen27> createState() => _Screen27State();
}

class _Screen27State extends State<Screen27> {
  DatabaseReference? ref;

  String screenName = "screen_27";
  late FirebaseAuthService authService;
  final List<String> _response = [];
  String? userId;

  @override
  void initState() {
    super.initState();
    authService = context.read<FirebaseAuthService>();
    for (var i = 0; i < 6; i++) {
      _response.add("");
    }
    initialize();
  }

  void initialize() async {
    userId = authService.user!.uid;

    ref = FirebaseDatabase.instance
        .ref('forms/${userId!}/${widget.formName}/section_c');
    setData();
  }

  void setResponse0(String value) async {
    _response[0] = value;
  }

  void setResponse1(String value) async {
    _response[1] = value;
  }

  void setResponse2(String value) async {
    _response[2] = value;
  }

  void setResponse3(String value) async {
    _response[3] = value;
  }

  void setResponse4(String value) async {
    _response[4] = value;
  }

  void setResponse5(String value) async {
    _response[5] = value;
  }

  @override
  Widget build(BuildContext context) {
    List<String> reportList = [
      'Almost all members',
      'More than half',
      'About one-third',
      'Very few',
      'None'
    ];
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
                        const Text(SectionC.SECTION_C_QUESTION_50,
                            style: CustomStyle.questionTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          width: double.infinity,
                          child: Text(SectionC.SECTION_C_QUESTION_50_POINT_1,
                              style: TextStyle(
                                  fontFamily: 'HelveticaNeue',
                                  fontSize: 22,
                                  color: Color(0xffD1D0BD),
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: const SizedBox(
                              height: 20,
                              width: 250,
                              child: Divider(color: Color(0xffD1D0BD))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          width: double.infinity,
                          child: Text(SectionC.SECTION_C_QUESTION_50_PROPERTY_1,
                              style: TextStyle(
                                  fontFamily: 'HelveticaNeue',
                                  fontSize: 18,
                                  color: Color(0xffD1D0BD),
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: const SizedBox(
                              height: 20,
                              width: 150,
                              child: Divider(color: Color(0xffD1D0BD))),
                        ),
                        CustomOption.optionRadioButtons(
                            reportList, true, _response[0], setResponse0),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          width: double.infinity,
                          child: Text(SectionC.SECTION_C_QUESTION_50_PROPERTY_2,
                              style: TextStyle(
                                  fontFamily: 'HelveticaNeue',
                                  fontSize: 18,
                                  color: Color(0xffD1D0BD),
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: const SizedBox(
                              height: 20,
                              width: 150,
                              child: Divider(color: Color(0xffD1D0BD))),
                        ),
                        CustomOption.optionRadioButtons(
                            reportList, true, _response[1], setResponse1),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          width: double.infinity,
                          child: Text(SectionC.SECTION_C_QUESTION_50_PROPERTY_3,
                              style: TextStyle(
                                  fontFamily: 'HelveticaNeue',
                                  fontSize: 18,
                                  color: Color(0xffD1D0BD),
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: const SizedBox(
                              height: 20,
                              width: 150,
                              child: Divider(color: Color(0xffD1D0BD))),
                        ),
                        CustomOption.optionRadioButtons(
                            reportList, true, _response[2], setResponse2),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          width: double.infinity,
                          child: Text(SectionC.SECTION_C_QUESTION_50_POINT_2,
                              style: TextStyle(
                                  fontFamily: 'HelveticaNeue',
                                  fontSize: 22,
                                  color: Color(0xffD1D0BD),
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: const SizedBox(
                              height: 20,
                              width: 250,
                              child: Divider(color: Color(0xffD1D0BD))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          width: double.infinity,
                          child: Text(SectionC.SECTION_C_QUESTION_50_PROPERTY_1,
                              style: TextStyle(
                                  fontFamily: 'HelveticaNeue',
                                  fontSize: 18,
                                  color: Color(0xffD1D0BD),
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: const SizedBox(
                              height: 20,
                              width: 150,
                              child: Divider(color: Color(0xffD1D0BD))),
                        ),
                        CustomOption.optionRadioButtons(
                            reportList, true, _response[3], setResponse3),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          width: double.infinity,
                          child: Text(SectionC.SECTION_C_QUESTION_50_PROPERTY_2,
                              style: TextStyle(
                                  fontFamily: 'HelveticaNeue',
                                  fontSize: 18,
                                  color: Color(0xffD1D0BD),
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: const SizedBox(
                              height: 20,
                              width: 150,
                              child: Divider(color: Color(0xffD1D0BD))),
                        ),
                        CustomOption.optionRadioButtons(
                            reportList, true, _response[4], setResponse4),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          width: double.infinity,
                          child: Text(SectionC.SECTION_C_QUESTION_50_PROPERTY_3,
                              style: TextStyle(
                                  fontFamily: 'HelveticaNeue',
                                  fontSize: 18,
                                  color: Color(0xffD1D0BD),
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: const SizedBox(
                              height: 20,
                              width: 150,
                              child: Divider(color: Color(0xffD1D0BD))),
                        ),
                        CustomOption.optionRadioButtons(
                            reportList, true, _response[5], setResponse5),
                        const SizedBox(
                          height: 20,
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
        .child("question_50")
        .child("response")
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        // Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        // values.forEach((key, value) {
        //   int p = -1;
        //   if (SectionC.SECTION_C_QUESTION_50_POINT_1 == key) {
        //     p = 0;
        //   } else if (SectionC.SECTION_C_QUESTION_50_POINT_2 == key) {
        //     p = 1;
        //   }
        //   Map<dynamic, dynamic> valuesRes = value as Map<dynamic, dynamic>;
        //   valuesRes.forEach((key1, value1) {
        //     int c = -1;
        //     if (SectionC.SECTION_C_QUESTION_50_PROPERTY_1 == key1) {
        //       c = 1;
        //     } else if (SectionC.SECTION_C_QUESTION_50_PROPERTY_2 == key1) {
        //       c = 2;
        //     } else if (SectionC.SECTION_C_QUESTION_50_PROPERTY_3 == key1) {
        //       c = 3;
        //     }

        //     if (p > -1 && c > 0) {
        //       int position = (p * 3) + c;
        //       if (position == 1) {
        //         question50Controller1.text = value1;
        //       } else if (position == 2) {
        //         question50Controller2.text = value1;
        //       } else if (position == 3) {
        //         question50Controller3.text = value1;
        //       } else if (position == 4) {
        //         question50Controller4.text = value1;
        //       } else if (position == 5) {
        //         question50Controller5.text = value1;
        //       } else if (position == 6) {
        //         question50Controller6.text = value1;
        //       }
        //     }
        //   });
        // });
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
            // SectionC.SECTION_C_QUESTION_50_POINT_1: {
            //   SectionC.SECTION_C_QUESTION_50_PROPERTY_1:
            //       question50Controller1.text,
            //   SectionC.SECTION_C_QUESTION_50_PROPERTY_2:
            //       question50Controller2.text,
            //   SectionC.SECTION_C_QUESTION_50_PROPERTY_3:
            //       question50Controller3.text
            // },
            // SectionC.SECTION_C_QUESTION_50_POINT_2: {
            //   SectionC.SECTION_C_QUESTION_50_PROPERTY_1:
            //       question50Controller4.text,
            //   SectionC.SECTION_C_QUESTION_50_PROPERTY_2:
            //       question50Controller5.text,
            //   SectionC.SECTION_C_QUESTION_50_PROPERTY_3:
            //       question50Controller6.text
            // },
          }
        },
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return Screen28(formName: widget.formName);
        },
      ),
    );
  }
}
