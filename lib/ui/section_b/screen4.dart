import 'package:flutter/material.dart';
import 'package:ifri/constants/section_b.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_option.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/section_b/screen5.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ifri/constants/constants.dart';

class Screen4 extends StatefulWidget {
  const Screen4({Key? key}) : super(key: key);

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  DatabaseReference? ref;
  String screenName = "screen_4";
  bool isLoading = true;
  Map<int, String> response = {};
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
    ref = FirebaseDatabase.instance.ref('forms/${userId!}/1/section_b');
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
                        Text(SectionB.SECTION_B_QUESTION_6,
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
                    height: 85,
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
                                child:
                                    Text("Access", style: CustomStyle.answer),
                              ),
                              CustomOption.yesNoButtons(
                                  1, response[1], setResponse),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 125,
                                child: Text("Sell", style: CustomStyle.answer),
                              ),
                              CustomOption.yesNoButtons(
                                  2, response[2], setResponse),
                            ],
                          ),
                        ],
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 85,
                    child: Row(children: [
                      const SizedBox(
                          width: 75,
                          child: Text("Fuelwood", style: CustomStyle.answer)),
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
                                child:
                                    Text("Access", style: CustomStyle.answer),
                              ),
                              CustomOption.yesNoButtons(
                                  3, response[3], setResponse),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 125,
                                child: Text("Sell", style: CustomStyle.answer),
                              ),
                              CustomOption.yesNoButtons(
                                  4, response[4], setResponse),
                            ],
                          ),
                        ],
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 85,
                    child: Row(children: [
                      const SizedBox(
                          width: 75,
                          child: Text("Grazing", style: CustomStyle.answer)),
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
                                child:
                                    Text("Access", style: CustomStyle.answer),
                              ),
                              CustomOption.yesNoButtons(
                                  5, response[5], setResponse),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 125,
                                child: Text("Sell", style: CustomStyle.answer),
                              ),
                              CustomOption.yesNoButtons(
                                  6, response[6], setResponse),
                            ],
                          ),
                        ],
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 85,
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
                                child:
                                    Text("Access", style: CustomStyle.answer),
                              ),
                              CustomOption.yesNoButtons(
                                  7, response[7], setResponse),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 125,
                                child: Text("Sell", style: CustomStyle.answer),
                              ),
                              CustomOption.yesNoButtons(
                                  8, response[8], setResponse),
                            ],
                          ),
                        ],
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 85,
                    child: Row(children: [
                      const SizedBox(
                          width: 75,
                          child: Text("Wildlife", style: CustomStyle.answer)),
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
                                child:
                                    Text("Access", style: CustomStyle.answer),
                              ),
                              CustomOption.yesNoButtons(
                                  9, response[9], setResponse),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 125,
                                child: Text("Sell", style: CustomStyle.answer),
                              ),
                              CustomOption.yesNoButtons(
                                  10, response[10], setResponse),
                            ],
                          ),
                        ],
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 85,
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
                                child:
                                    Text("Access", style: CustomStyle.answer),
                              ),
                              CustomOption.yesNoButtons(
                                  11, response[11], setResponse),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 125,
                                child: Text("Sell", style: CustomStyle.answer),
                              ),
                              CustomOption.yesNoButtons(
                                  12, response[12], setResponse),
                            ],
                          ),
                        ],
                      )
                    ]),
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
      ));
    }
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const Screen5();
        },
      ),
    );
  }

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        "question_6": {
          "question": SectionB.SECTION_B_QUESTION_6,
          "response": {
            "timber": {"access": response[1], "sell": response[2]},
            "fuelwood": {"access": response[3], "sell": response[4]},
            "grazing": {"access": response[5], "sell": response[6]},
            "seasonal_forest_products": {
              "access": response[7],
              "sell": response[8]
            },
            "wildlife": {"access": response[9], "sell": response[10]},
            "other": {"access": response[11], "sell": response[12]},
          }
        },
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }

  navigateToPreviousScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  void setData() async {
    ref!
        .child(screenName)
        .child("question_6")
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
            if ("access" == key1) {
              c = 1;
            } else if ("sell" == key1) {
              c = 2;
            }
            print(key1);
            if (p > -1 && c > 0) {
              response[(p * 2) + c] = value1;
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
