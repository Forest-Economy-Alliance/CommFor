import 'package:flutter/material.dart';
import 'package:ifri/constants/section_b.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_option.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/section_b/screen4.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key? key, required this.formName}) : super(key: key);
  final String formName;
  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  DatabaseReference? ref;
  String screenName = "screen_3";
  bool isLoading = true;
  Map<int, String> response = {};
  String? userId;

  late FirebaseAuthService authService;

  @override
  void initState() {
    super.initState();
    authService = context.read<FirebaseAuthService>();
    initialize();
  }

  void initialize() async {
    userId = authService.user!.uid;

    ref = FirebaseDatabase.instance
        .ref('forms/${userId!}/${widget.formName}/section_b');
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      child: Row(
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
                              SectionB.SECTION_B_SECTION_2,
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
                          Text(SectionB.SECTION_B_QUESTION_5,
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
                      height: 175,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(children: [
                          const SizedBox(
                              width: 75,
                              child: Text("Timber", style: CustomStyle.answer)),
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
                                    child: Text("Self Consumption",
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
                                    child: Text("Market Sale",
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
                                    child: Text("Management",
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
                                    child: Text("Exclusion",
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      4, response[4], setResponse),
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
                      height: 175,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(children: [
                          const SizedBox(
                              width: 75,
                              child:
                                  Text("Fuelwood", style: CustomStyle.answer)),
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
                                    child: Text("Self Consumption",
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      5, response[5], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    child: Text("Market Sale",
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
                                    child: Text("Management",
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
                                    child: Text("Exclusion",
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      8, response[8], setResponse),
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
                      height: 175,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(children: [
                          const SizedBox(
                              width: 75,
                              child:
                                  Text("Grazing", style: CustomStyle.answer)),
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
                                    child: Text("Self Consumption",
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
                                    child: Text("Market Sale",
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      10, response[10], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    child: Text("Management",
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
                                    child: Text("Exclusion",
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      12, response[12], setResponse),
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
                      height: 175,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(children: [
                          const SizedBox(
                              width: 75,
                              child: Text("Seasonal Forest Products",
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
                                    child: Text("Self Consumption",
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
                                    child: Text("Market Sale",
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
                                    child: Text("Management",
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      15, response[15], setResponse),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    child: Text("Exclusion",
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      16, response[16], setResponse),
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
                      height: 175,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(children: [
                          const SizedBox(
                              width: 75,
                              child:
                                  Text("Wildlife", style: CustomStyle.answer)),
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
                                    child: Text("Self Consumption",
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
                                    child: Text("Market Sale",
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
                                    child: Text("Management",
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
                                    child: Text("Exclusion",
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
                      height: 175,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(children: [
                          const SizedBox(
                              width: 75,
                              child: Text("Other", style: CustomStyle.answer)),
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
                                    child: Text("Self Consumption",
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
                                    child: Text("Market Sale",
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
                                    child: Text("Management",
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
                                    child: Text("Exclusion",
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtons(
                                      24, response[24], setResponse),
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

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        "question_5": {
          "question": SectionB.SECTION_B_QUESTION_5,
          "response": {
            "timber": {
              "self_consumption": response[1],
              "market_sale": response[2],
              "management": response[3],
              "exclusion": response[4]
            },
            "fuelwood": {
              "self_consumption": response[5],
              "market_sale": response[6],
              "management": response[7],
              "exclusion": response[8]
            },
            "grazing": {
              "self_consumption": response[9],
              "market_sale": response[10],
              "management": response[11],
              "exclusion": response[12]
            },
            "seasonal_forest_products": {
              "self_consumption": response[13],
              "market_sale": response[14],
              "management": response[15],
              "exclusion": response[16]
            },
            "wildlife": {
              "self_consumption": response[17],
              "market_sale": response[18],
              "management": response[19],
              "exclusion": response[20]
            },
            "other": {
              "self_consumption": response[21],
              "market_sale": response[22],
              "management": response[23],
              "exclusion": response[24]
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
          return Screen4(formName: widget.formName);
        },
      ),
    );
  }

  navigateToPreviousScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  void setData() async {
    ref!
        .child(screenName)
        .child("question_5")
        .child("response")
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value) {
          print(key);
          int p = -1;
          if ("timber" == key) {
            p = 0;
          } else if ("fuelwood" == key) {
            p = 1;
          } else if ("grazing" == key) {
            p = 2;
          } else if ("seasonal_forest_products" == key) {
            p = 3;
          } else if ("wildlife" == key) {
            p = 4;
          } else if ("other" == key) {
            p = 5;
          }
          Map<dynamic, dynamic> valuesRes = value as Map<dynamic, dynamic>;
          valuesRes.forEach((key1, value1) {
            int c = -1;
            if ("self_consumption" == key1) {
              c = 1;
            } else if ("market_sale" == key1) {
              c = 2;
            } else if ("management" == key1) {
              c = 3;
            } else if ("exclusion" == key1) {
              c = 4;
            }
            print(key1);
            if (p > -1 && c > 0) {
              response[(p * 4) + c] = value1;
            }
          });
        });
      } else {
        print('No data available.1');
      }
      setState(() {
        isLoading = false;
      });
    });
  }
}
