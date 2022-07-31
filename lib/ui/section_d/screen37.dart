import 'package:flutter/material.dart';
import 'package:ifri/constants/section_d.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_option.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ifri/constants/constants.dart';
import 'package:ifri/ui/section_d/screen38.dart';

class Screen37 extends StatefulWidget {
  const Screen37({Key? key}) : super(key: key);

  @override
  State<Screen37> createState() => _Screen37State();
}

class _Screen37State extends State<Screen37> {
  DatabaseReference? ref;
  String screenName = "screen_37";
  bool isLoading = true;
  Map<int, String> response = {};
  String response2 = "";
  SharedPreferences? _sharedPreferences;
  String? userId;
  TextEditingController question1Controller = TextEditingController();
  TextEditingController question2Controller = TextEditingController();

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

  void setResponse(int position, String value) async {
    response[position] = value;
  }

  void setResponse2(String value) async {
    response2 = value;
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
                          SectionD.SECTION_D_SECTION_4,
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
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(SectionD.SECTION_D_QUESTION_64,
                      style: CustomStyle.questionTitle),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(SectionD.SECTION_D_QUESTION_64_PROPERTY_1,
                      style: CustomStyle.optionYesNo),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                      controller: question1Controller,
                      style: CustomStyle.answer,
                      textAlign: TextAlign.start,
                      decoration: CustomStyle.answerInputDecoration),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(SectionD.SECTION_D_QUESTION_64_PROPERTY_2,
                      style: CustomStyle.optionYesNo),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                      controller: question2Controller,
                      style: CustomStyle.answer,
                      textAlign: TextAlign.start,
                      decoration: CustomStyle.answerInputDecoration),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(SectionD.SECTION_D_QUESTION_65,
                      style: CustomStyle.questionTitle),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomOption.optionRadioButtons(const [
                    'Male',
                    'Female',
                  ], true, response2, setResponse2),
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
                    height: 250,
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
          return const Screen38();
        },
      ),
    );
  }

  void setData() async {
    ref!
        .child(screenName)
        .child("question_64")
        .child("response")
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value) {
          print(key);
          int p = -1;
          if (SectionD.SECTION_D_QUESTION_64_PROPERTY_1 == key) {
            p = 1;
          } else if (SectionD.SECTION_D_QUESTION_64_PROPERTY_2 == key) {
            p = 2;
          }
          if (p == 1) {
            question1Controller.text = value;
          } else if (p == 2) {
            question2Controller.text = value;
          }
        });
      } else {
        print('No data available');
      }
    });

    final res3 = await ref!
        .child(screenName)
        .child("question_65")
        .child("response")
        .get();

    setState(() {
      response2 = null == res3.value ? "" : res3.value.toString();
      isLoading = false;
    });
  }

  navigateToPreviousScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        "question_64": {
          "question": SectionD.SECTION_D_QUESTION_64,
          "response": {
            SectionD.SECTION_D_QUESTION_64_PROPERTY_1: question1Controller.text,
            SectionD.SECTION_D_QUESTION_64_PROPERTY_2: question2Controller.text,
          }
        },
        "question_65": {
          "question": SectionD.SECTION_D_QUESTION_65,
          "response": response2
        },
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }
}
