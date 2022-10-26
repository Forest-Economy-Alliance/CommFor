import 'package:flutter/material.dart';
import 'package:ifri/constants/section_c.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_option.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ifri/ui/section_c/screen22.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:provider/provider.dart';

class Screen21 extends StatefulWidget {
  const Screen21({Key? key, required this.formName}) : super(key: key);
  final String formName;
  @override
  State<Screen21> createState() => _Screen21State();
}

class _Screen21State extends State<Screen21> {
  DatabaseReference? ref;
  String screenName = "screen_21";
  bool isLoading = true;
  Map<int, String> response = {};
  late FirebaseAuthService authService;
  TextEditingController question40Controller = TextEditingController();
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
                            width: 25,
                            height: 25,
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
                          Text(SectionC.SECTION_C_QUESTION_40,
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
                    SizedBox(
                      height: 230,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(children: [
                          const SizedBox(
                              width: 90,
                              child: Text(SectionC.SECTION_C_QUESTION_40_LEFT_1,
                                  style: CustomStyle.answer)),
                          const SizedBox(width: 2),
                          const VerticalDivider(
                            color: Color(0xffD1D0BD),
                            thickness: 0.5,
                          ),
                          const SizedBox(width: 2),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_1,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      1, response[1], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_2,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      2, response[2], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_3,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      3, response[3], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_4,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      4, response[4], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_5,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      5, response[5], setResponse),
                                ],
                              ),
                            ],
                          )
                        ]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 230,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(children: [
                          const SizedBox(
                              width: 90,
                              child: Text(SectionC.SECTION_C_QUESTION_40_LEFT_2,
                                  style: CustomStyle.answer)),
                          const SizedBox(width: 2),
                          const VerticalDivider(
                            color: Color(0xffD1D0BD),
                            thickness: 0.5,
                          ),
                          const SizedBox(width: 2),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_1,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      6, response[6], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_2,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      7, response[7], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_3,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      8, response[8], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_4,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      9, response[9], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_5,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      10, response[10], setResponse),
                                ],
                              ),
                            ],
                          )
                        ]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 230,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(children: [
                          const SizedBox(
                              width: 90,
                              child: Text(SectionC.SECTION_C_QUESTION_40_LEFT_3,
                                  style: CustomStyle.answer)),
                          const SizedBox(width: 2),
                          const VerticalDivider(
                            color: Color(0xffD1D0BD),
                            thickness: 0.5,
                          ),
                          const SizedBox(width: 2),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_1,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      11, response[11], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_2,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      12, response[12], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_3,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      13, response[13], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_4,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      14, response[14], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_5,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      15, response[15], setResponse),
                                ],
                              ),
                            ],
                          )
                        ]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 230,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          const SizedBox(
                              width: 90,
                              child: Text(SectionC.SECTION_C_QUESTION_40_LEFT_4,
                                  style: CustomStyle.answer)),
                          const SizedBox(width: 2),
                          const VerticalDivider(
                            color: Color(0xffD1D0BD),
                            thickness: 0.5,
                          ),
                          const SizedBox(width: 2),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_1,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      16, response[16], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_2,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      17, response[17], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_3,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      18, response[18], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_4,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      19, response[19], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_5,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      20, response[20], setResponse),
                                ],
                              ),
                            ],
                          )
                        ]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 230,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(children: [
                          const SizedBox(
                              width: 90,
                              child: Text(SectionC.SECTION_C_QUESTION_40_LEFT_5,
                                  style: CustomStyle.answer)),
                          const SizedBox(width: 2),
                          const VerticalDivider(
                            color: Color(0xffD1D0BD),
                            thickness: 0.5,
                          ),
                          const SizedBox(width: 2),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_1,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      21, response[21], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_2,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      22, response[22], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_3,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      23, response[23], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_4,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      24, response[24], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_5,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      25, response[25], setResponse),
                                ],
                              ),
                            ],
                          )
                        ]),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 230,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(children: [
                          SizedBox(
                              width: 90,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                      SectionC.SECTION_C_QUESTION_40_LEFT_6,
                                      style: CustomStyle.answer),
                                  SizedBox(
                                    height: 40,
                                    child: TextField(
                                      controller: question40Controller,
                                      style: CustomStyle.answer,
                                      textAlign: TextAlign.start,
                                      decoration:
                                          CustomStyle.answerInputDecoration,
                                    ),
                                  )
                                ],
                              )),
                          const SizedBox(width: 2),
                          const VerticalDivider(
                            color: Color(0xffD1D0BD),
                            thickness: 0.5,
                          ),
                          const SizedBox(width: 2),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_1,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      26, response[26], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_2,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      27, response[27], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_3,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      28, response[28], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_4,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      29, response[29], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    height: 25,
                                    child: Text(
                                        SectionC.SECTION_C_QUESTION_40_RIGHT_5,
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      30, response[30], setResponse),
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
        ),
      );
    }
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return Screen22(formName: widget.formName);
        },
      ),
    );
  }

  void setData() async {
    ref!
        .child(screenName)
        .child("question_40")
        .child("response")
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value) {
          print(key);
          int p = -1;
          if (SectionC.SECTION_C_QUESTION_40_LEFT_1 == key) {
            p = 0;
          } else if (SectionC.SECTION_C_QUESTION_40_LEFT_2 == key) {
            p = 1;
          } else if (SectionC.SECTION_C_QUESTION_40_LEFT_3 == key) {
            p = 2;
          } else if (SectionC.SECTION_C_QUESTION_40_LEFT_4 == key) {
            p = 3;
          } else if (SectionC.SECTION_C_QUESTION_40_LEFT_5 == key) {
            p = 4;
          } else if (SectionC.SECTION_C_QUESTION_40_LEFT_6 == key) {
            p = 5;
          }
          Map<dynamic, dynamic> valuesRes = value as Map<dynamic, dynamic>;
          valuesRes.forEach((key1, value1) {
            int c = -1;
            if (SectionC.SECTION_C_QUESTION_40_RIGHT_1 == key1) {
              c = 1;
            } else if (SectionC.SECTION_C_QUESTION_40_RIGHT_2 == key1) {
              c = 2;
            } else if (SectionC.SECTION_C_QUESTION_40_RIGHT_3 == key1) {
              c = 3;
            } else if (SectionC.SECTION_C_QUESTION_40_RIGHT_4 == key1) {
              c = 4;
            } else if (SectionC.SECTION_C_QUESTION_40_RIGHT_5 == key1) {
              c = 5;
            }
            print(key1);
            if (p > -1 && c > 0) {
              response[(p * 5) + c] = value1;
            }
          });
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
        "question_40": {
          "question": SectionC.SECTION_C_QUESTION_40,
          "response": {
            SectionC.SECTION_C_QUESTION_40_LEFT_1: {
              SectionC.SECTION_C_QUESTION_40_RIGHT_1: response[1],
              SectionC.SECTION_C_QUESTION_40_RIGHT_2: response[2],
              SectionC.SECTION_C_QUESTION_40_RIGHT_3: response[3],
              SectionC.SECTION_C_QUESTION_40_RIGHT_4: response[4],
              SectionC.SECTION_C_QUESTION_40_RIGHT_5: response[5]
            },
            SectionC.SECTION_C_QUESTION_40_LEFT_2: {
              SectionC.SECTION_C_QUESTION_40_RIGHT_1: response[6],
              SectionC.SECTION_C_QUESTION_40_RIGHT_2: response[7],
              SectionC.SECTION_C_QUESTION_40_RIGHT_3: response[8],
              SectionC.SECTION_C_QUESTION_40_RIGHT_4: response[9],
              SectionC.SECTION_C_QUESTION_40_RIGHT_5: response[10]
            },
            SectionC.SECTION_C_QUESTION_40_LEFT_3: {
              SectionC.SECTION_C_QUESTION_40_RIGHT_1: response[11],
              SectionC.SECTION_C_QUESTION_40_RIGHT_2: response[12],
              SectionC.SECTION_C_QUESTION_40_RIGHT_3: response[13],
              SectionC.SECTION_C_QUESTION_40_RIGHT_4: response[14],
              SectionC.SECTION_C_QUESTION_40_RIGHT_5: response[15]
            },
            SectionC.SECTION_C_QUESTION_40_LEFT_4: {
              SectionC.SECTION_C_QUESTION_40_RIGHT_1: response[16],
              SectionC.SECTION_C_QUESTION_40_RIGHT_2: response[17],
              SectionC.SECTION_C_QUESTION_40_RIGHT_3: response[18],
              SectionC.SECTION_C_QUESTION_40_RIGHT_4: response[19],
              SectionC.SECTION_C_QUESTION_40_RIGHT_5: response[20]
            },
            SectionC.SECTION_C_QUESTION_40_LEFT_5: {
              SectionC.SECTION_C_QUESTION_40_RIGHT_1: response[21],
              SectionC.SECTION_C_QUESTION_40_RIGHT_2: response[22],
              SectionC.SECTION_C_QUESTION_40_RIGHT_3: response[23],
              SectionC.SECTION_C_QUESTION_40_RIGHT_4: response[24],
              SectionC.SECTION_C_QUESTION_40_RIGHT_5: response[25]
            },
            SectionC.SECTION_C_QUESTION_40_LEFT_6: {
              SectionC.SECTION_C_QUESTION_40_RIGHT_1: response[26],
              SectionC.SECTION_C_QUESTION_40_RIGHT_2: response[27],
              SectionC.SECTION_C_QUESTION_40_RIGHT_3: response[28],
              SectionC.SECTION_C_QUESTION_40_RIGHT_4: response[29],
              SectionC.SECTION_C_QUESTION_40_RIGHT_5: response[30]
            },
          }
        },
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }
}
