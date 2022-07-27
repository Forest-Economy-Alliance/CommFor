import 'package:flutter/material.dart';
import 'package:ifri/constants/section_b.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_option.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/section_b/screen11.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ifri/constants/constants.dart';

class Screen10 extends StatefulWidget {
  const Screen10({Key? key}) : super(key: key);

  @override
  State<Screen10> createState() => _Screen10State();
}

class _Screen10State extends State<Screen10> {
  DatabaseReference? ref;
  String screenName = "screen_10";
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
                          SectionB.SECTION_B_SECTION_5,
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
                        Text(SectionB.SECTION_B_QUESTION_12,
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
                    height: 250,
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
                                height: 50,
                                child: Text("HH – Self consumption",
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
                                height: 50,
                                child: Text("HH – Market sale",
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
                                height: 50,
                                child: Text("Price per unit",
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
                                height: 50,
                                child: Text("Collection by other sites",
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
                                height: 50,
                                child: Text("Harvesting rights of other sites",
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
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 250,
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
                                height: 50,
                                child: Text("HH – Self consumption",
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
                                height: 50,
                                child: Text("HH – Market sale",
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
                                height: 50,
                                child: Text("Price per unit",
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
                                height: 50,
                                child: Text("Collection by other sites",
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
                                height: 50,
                                child: Text("Harvesting rights of other sites",
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
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 250,
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
                                height: 50,
                                child: Text("HH – Self consumption",
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
                                height: 50,
                                child: Text("HH – Market sale",
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
                                height: 50,
                                child: Text("Price per unit",
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
                                height: 50,
                                child: Text("Collection by other sites",
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
                                height: 50,
                                child: Text("Harvesting rights of other sites",
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
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 250,
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
                                height: 50,
                                child: Text("HH – Self consumption",
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
                                height: 50,
                                child: Text("HH – Market sale",
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
                                height: 50,
                                child: Text("Price per unit",
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
                                height: 50,
                                child: Text("Collection by other sites",
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
                                height: 50,
                                child: Text("Harvesting rights of other sites",
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
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 250,
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
                                height: 50,
                                child: Text("HH – Self consumption",
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
                                height: 50,
                                child: Text("HH – Market sale",
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
                                height: 50,
                                child: Text("Price per unit",
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
                                height: 50,
                                child: Text("Collection by other sites",
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
                                height: 50,
                                child: Text("Harvesting rights of other sites",
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
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 250,
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
                                height: 50,
                                child: Text("HH – Self consumption",
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
                                height: 50,
                                child: Text("HH – Market sale",
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
                                height: 50,
                                child: Text("Price per unit",
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
                                height: 50,
                                child: Text("Collection by other sites",
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
                                height: 50,
                                child: Text("Harvesting rights of other sites",
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
          return const Screen11();
        },
      ),
    );
  }

  void setData() async {
    ref!
        .child(screenName)
        .child("question_12")
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
            } else if ("price" == key1) {
              c = 3;
            } else if ("collection" == key1) {
              c = 4;
            } else if ("harvesting" == key1) {
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
        "question_12": {
          "question": SectionB.SECTION_B_QUESTION_12,
          "response": {
            "timber": {
              "self_consumption": response[1],
              "market_sale": response[2],
              "price": response[3],
              "collection": response[4],
              "harvesting": response[5]
            },
            "fuelwood": {
              "self_consumption": response[6],
              "market_sale": response[7],
              "price": response[8],
              "collection": response[9],
              "harvesting": response[10]
            },
            "grazing": {
              "self_consumption": response[11],
              "market_sale": response[12],
              "price": response[13],
              "collection": response[14],
              "harvesting": response[15]
            },
            "seasonal_forest_products": {
              "self_consumption": response[16],
              "market_sale": response[17],
              "price": response[18],
              "collection": response[19],
              "harvesting": response[20]
            },
            "wildlife": {
              "self_consumption": response[21],
              "market_sale": response[22],
              "price": response[23],
              "collection": response[24],
              "harvesting": response[25]
            },
            "other": {
              "self_consumption": response[26],
              "market_sale": response[27],
              "price": response[28],
              "collection": response[29],
              "harvesting": response[30]
            }
          }
        },
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }
}
