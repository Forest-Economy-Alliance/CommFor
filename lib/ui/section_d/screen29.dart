import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/section_d.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_option.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/section_d/screen30.dart';
import 'package:provider/provider.dart';

class Screen29 extends StatefulWidget {
  const Screen29({Key? key, required this.formName}) : super(key: key);
  final String formName;
  @override
  State<Screen29> createState() => _Screen29State();
}

class _Screen29State extends State<Screen29> {
  DatabaseReference? ref;
  String screenName = "screen_29";
  String _response0 = "";
  String _response1 = "";
  String _response2 = "";
  String _response3 = "";
  String _response4 = "";
  String _response5 = "";
  String _response6 = "";
  String _response7 = "";
  String _response8 = "";
  final String _response9 = "";
  final String _response10 = "";
  final String _response11 = "";

  bool isLoading = true;

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
        .ref('forms/${userId!}/${widget.formName}/section_d');
    setData();
  }

  void setResponse0(String value) async {
    _response0 = value;
  }

  void setResponse1(String value) async {
    _response1 = value;
  }

  void setResponse2(String value) async {
    _response2 = value;
  }

  void setResponse3(String value) async {
    _response3 = value;
  }

  void setResponse4(String value) async {
    _response4 = value;
  }

  void setResponse5(String value) async {
    _response5 = value;
  }

  void setResponse6(String value) async {
    _response6 = value;
  }

  void setResponse7(String value) async {
    _response7 = value;
  }

  void setResponse8(String value) async {
    _response8 = value;
  }

  void setResponse9(String value) async {
    _response8 = value;
  }

  void setResponse10(String value) async {
    _response8 = value;
  }

  void setResponse11(String value) async {
    _response8 = value;
  }

  @override
  Widget build(BuildContext context) {
    List<String> reportList = [
      SectionD.SECTION_D_QUESTION_55_PROPERTY_1,
      SectionD.SECTION_D_QUESTION_55_PROPERTY_2,
    ];
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
                  left: 10.0,
                  right: 10.0,
                  top: 5.0,
                  bottom: 5.0,
                ),
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
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: const SizedBox(
                            height: 20,
                            width: 300,
                            child: Divider(
                              color: Color(0xffD1D0BD),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(SectionD.SECTION_D_QUESTION_54,
                                  style: CustomStyle.questionTitle),
                              const SizedBox(
                                height: 5,
                              ),
                              CustomOption.optionRadioButtons(const [
                                'Private management',
                                'Community management – Formal',
                                'Community management – Informal',
                                'Government management',
                                'Co-management – Community and Government',
                                'Co-management – Community and NGO',
                                'Co-management – Community and Private company',
                                'Others',
                              ], true, _response0, setResponse0),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
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
                              const Text(SectionD.SECTION_D_QUESTION_55,
                                  style: CustomStyle.questionTitle),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(SectionD.SECTION_D_QUESTION_55_POINT_1,
                                  style: CustomStyle.questionBoldTitle),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomOption.optionRadioButtons(
                                  reportList, true, _response1, setResponse1),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(SectionD.SECTION_D_QUESTION_55_POINT_2,
                                  style: CustomStyle.questionBoldTitle),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomOption.optionRadioButtons(
                                  reportList, true, _response2, setResponse2),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(SectionD.SECTION_D_QUESTION_55_POINT_3,
                                  style: CustomStyle.questionBoldTitle),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomOption.optionRadioButtons(
                                  reportList, true, _response3, setResponse3),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(SectionD.SECTION_D_QUESTION_55_POINT_4,
                                  style: CustomStyle.questionBoldTitle),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomOption.optionRadioButtons(
                                  reportList, true, _response4, setResponse4),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(SectionD.SECTION_D_QUESTION_55_POINT_5,
                                  style: CustomStyle.questionBoldTitle),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomOption.optionRadioButtons(
                                  reportList, true, _response5, setResponse5),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(SectionD.SECTION_D_QUESTION_55_POINT_6,
                                  style: CustomStyle.questionBoldTitle),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomOption.optionRadioButtons(
                                  reportList, true, _response6, setResponse6),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(SectionD.SECTION_D_QUESTION_55_POINT_7,
                                  style: CustomStyle.questionBoldTitle),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomOption.optionRadioButtons(
                                  reportList, true, _response7, setResponse7),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(SectionD.SECTION_D_QUESTION_55_POINT_8,
                                  style: CustomStyle.questionBoldTitle),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomOption.optionRadioButtons(
                                  reportList, true, _response8, setResponse8),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(SectionD.SECTION_D_QUESTION_55_POINT_9,
                                  style: CustomStyle.questionBoldTitle),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomOption.optionRadioButtons(
                                  reportList, true, _response9, setResponse9),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                  SectionD.SECTION_D_QUESTION_55_POINT_10,
                                  style: CustomStyle.questionBoldTitle),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomOption.optionRadioButtons(
                                  reportList, true, _response10, setResponse10),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                  SectionD.SECTION_D_QUESTION_55_POINT_11,
                                  style: CustomStyle.questionBoldTitle),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomOption.optionRadioButtons(
                                  reportList, true, _response11, setResponse11),
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
                          height: 150,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  void setData() async {
    final res3 = await ref!
        .child(screenName)
        .child("question_54")
        .child("response")
        .get();

    ref!
        .child(screenName)
        .child("question_55")
        .child("response")
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        // Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        // values.forEach((key, value) {
        //   int p = -1;
        //   if (SectionD.SECTION_D_QUESTION_55_POINT_1 == key) {
        //     p = 0;
        //   } else if (SectionD.SECTION_D_QUESTION_55_POINT_2 == key) {
        //     p = 1;
        //   } else if (SectionD.SECTION_D_QUESTION_55_POINT_3 == key) {
        //     p = 2;
        //   } else if (SectionD.SECTION_D_QUESTION_55_POINT_4 == key) {
        //     p = 3;
        //   } else if (SectionD.SECTION_D_QUESTION_55_POINT_5 == key) {
        //     p = 4;
        //   } else if (SectionD.SECTION_D_QUESTION_55_POINT_6 == key) {
        //     p = 5;
        //   } else if (SectionD.SECTION_D_QUESTION_55_POINT_7 == key) {
        //     p = 6;
        //   } else if (SectionD.SECTION_D_QUESTION_55_POINT_8 == key) {
        //     p = 7;
        //   } else if (SectionD.SECTION_D_QUESTION_55_POINT_9 == key) {
        //     p = 8;
        //   } else if (SectionD.SECTION_D_QUESTION_55_POINT_10 == key) {
        //     p = 9;
        //   } else if (SectionD.SECTION_D_QUESTION_55_POINT_11 == key) {
        //     p = 11;
        //   }
        //   Map<dynamic, dynamic> valuesRes = value as Map<dynamic, dynamic>;
        //   valuesRes.forEach((key1, value1) {
        //     int c = -1;
        //     if (SectionD.SECTION_D_QUESTION_55_PROPERTY_1 == key1) {
        //       c = 1;
        //     } else if (SectionD.SECTION_D_QUESTION_55_PROPERTY_2 == key1) {
        //       c = 2;
        //     }

        //     if (p > -1 && c > 0) {
        //       int position = (p * 2) + c;
        //       if (position == 1) {
        //         question55Controller1.text = value1;
        //       } else if (position == 2) {
        //         question55Controller2.text = value1;
        //       } else if (position == 3) {
        //         question55Controller3.text = value1;
        //       } else if (position == 4) {
        //         question55Controller4.text = value1;
        //       } else if (position == 5) {
        //         question55Controller5.text = value1;
        //       } else if (position == 6) {
        //         question55Controller6.text = value1;
        //       } else if (position == 7) {
        //         question55Controller7.text = value1;
        //       } else if (position == 8) {
        //         question55Controller8.text = value1;
        //       } else if (position == 9) {
        //         question55Controller9.text = value1;
        //       } else if (position == 10) {
        //         question55Controller10.text = value1;
        //       } else if (position == 11) {
        //         question55Controller11.text = value1;
        //       } else if (position == 12) {
        //         question55Controller12.text = value1;
        //       } else if (position == 13) {
        //         question55Controller13.text = value1;
        //       } else if (position == 14) {
        //         question55Controller14.text = value1;
        //       } else if (position == 15) {
        //         question55Controller15.text = value1;
        //       } else if (position == 16) {
        //         question55Controller16.text = value1;
        //       } else if (position == 17) {
        //         question55Controller17.text = value1;
        //       } else if (position == 18) {
        //         question55Controller18.text = value1;
        //       } else if (position == 19) {
        //         question55Controller19.text = value1;
        //       } else if (position == 20) {
        //         question55Controller20.text = value1;
        //       } else if (position == 21) {
        //         question55Controller21.text = value1;
        //       } else if (position == 22) {
        //         question55Controller22.text = value1;
        //       }
        //     }
        //   });
        // });
      } else {
        print('No data available');
      }
    });
    setState(() {
      _response0 = null == res3.value ? "" : res3.value.toString();
      isLoading = false;
    });
  }

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        "question_54": {
          "question": SectionD.SECTION_D_QUESTION_54,
          "response": _response0
        },
        "question_55": {
          "question": SectionD.SECTION_D_QUESTION_55,
          "response": {
            //   SectionD.SECTION_D_QUESTION_55_POINT_1: {
            //     SectionD.SECTION_D_QUESTION_55_PROPERTY_1:
            //         question55Controller1.text,
            //     SectionD.SECTION_D_QUESTION_55_PROPERTY_2:
            //         question55Controller2.text
            //   },
            //   SectionD.SECTION_D_QUESTION_55_POINT_2: {
            //     SectionD.SECTION_D_QUESTION_55_PROPERTY_1:
            //         question55Controller3.text,
            //     SectionD.SECTION_D_QUESTION_55_PROPERTY_2:
            //         question55Controller4.text
            //   },
            //   SectionD.SECTION_D_QUESTION_55_POINT_3: {
            //     SectionD.SECTION_D_QUESTION_55_PROPERTY_1:
            //         question55Controller5.text,
            //     SectionD.SECTION_D_QUESTION_55_PROPERTY_2:
            //         question55Controller6.text
            //   },
            //   SectionD.SECTION_D_QUESTION_55_POINT_4: {
            //     SectionD.SECTION_D_QUESTION_55_PROPERTY_1:
            //         question55Controller7.text,
            //     SectionD.SECTION_D_QUESTION_55_PROPERTY_2:
            //         question55Controller8.text
            //   },
            //   SectionD.SECTION_D_QUESTION_55_POINT_5: {
            //     SectionD.SECTION_D_QUESTION_55_PROPERTY_1:
            //         question55Controller9.text,
            //     SectionD.SECTION_D_QUESTION_55_PROPERTY_2:
            //         question55Controller10.text
            //   },
            //   SectionD.SECTION_D_QUESTION_55_POINT_6: {
            //     SectionD.SECTION_D_QUESTION_55_PROPERTY_1:
            //         question55Controller11.text,
            //     SectionD.SECTION_D_QUESTION_55_PROPERTY_2:
            //         question55Controller12.text
            //   },
            //   SectionD.SECTION_D_QUESTION_55_POINT_7: {
            //     SectionD.SECTION_D_QUESTION_55_PROPERTY_1:
            //         question55Controller13.text,
            //     SectionD.SECTION_D_QUESTION_55_PROPERTY_2:
            //         question55Controller14.text
            //   },
            //   SectionD.SECTION_D_QUESTION_55_POINT_8: {
            //     SectionD.SECTION_D_QUESTION_55_PROPERTY_1:
            //         question55Controller15.text,
            //     SectionD.SECTION_D_QUESTION_55_PROPERTY_2:
            //         question55Controller16.text
            //   }
          }
        },
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return Screen30(formName: widget.formName);
        },
      ),
    );
  }

  navigateToPreviousScreen(BuildContext context) {
    Navigator.of(context).pop();
  }
}
