import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/constants.dart';
import 'package:ifri/constants/section_c.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_option.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/section_c/screen13.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screen12 extends StatefulWidget {
  const Screen12({Key? key}) : super(key: key);

  @override
  State<Screen12> createState() => _Screen12State();
}

class _Screen12State extends State<Screen12> {
  DatabaseReference? ref;
  TextEditingController question15Controller = TextEditingController();
  TextEditingController question16Controller = TextEditingController();
  TextEditingController question17Controller = TextEditingController();
  String screenName = "screen_12";
  SharedPreferences? _sharedPreferences;
  String? userId;
  String _response4 = "";
  bool isLoading = true;

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

  void setResponse4(String value) async {
    _response4 = value;
  }

  navigateToPreviousScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container();
    } else {
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
                        onTap: () => navigateToPreviousScreen(context),
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
                          SectionC.SECTION_C_SECTION_1,
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
                        const Text(SectionC.SECTION_C_QUESTION_15,
                            style: CustomStyle.questionTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question15Controller,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_16,
                            style: CustomStyle.questionTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question16Controller,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_17,
                            style: CustomStyle.questionTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question17Controller,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_18,
                            style: CustomStyle.questionTitle),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomOption.optionRadioButtons(const [
                          'Public transport (bus, train, others)',
                          'Private transport (bike, car, cycle, others)',
                          'Walk',
                        ], true, _response4, setResponse4),
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
                ],
              ),
            ),
          ),
        ),
      ));
    }
  }

  void setData() async {
    final response1 = await ref!
        .child(screenName)
        .child("question_15")
        .child("response")
        .get();
    question15Controller.text =
        null == response1.value ? "" : response1.value.toString();
    final response2 = await ref!
        .child(screenName)
        .child("question_16")
        .child("response")
        .get();
    question16Controller.text =
        null == response2.value ? "" : response2.value.toString();
    final response3 = await ref!
        .child(screenName)
        .child("question_17")
        .child("response")
        .get();
    question17Controller.text =
        null == response3.value ? "" : response3.value.toString();

    final res4 = await ref!
        .child(screenName)
        .child("question_18")
        .child("response")
        .get();

    setState(() {
      _response4 = null == res4.value ? "" : res4.value.toString();

      isLoading = false;
    });
  }

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        "question_15": {
          "question": SectionC.SECTION_C_QUESTION_15,
          "response": question15Controller.text
        },
        "question_16": {
          "question": SectionC.SECTION_C_QUESTION_16,
          "response": question16Controller.text
        },
        "question_17": {
          "question": SectionC.SECTION_C_QUESTION_17,
          "response": question17Controller.text
        },
        "question_18": {
          "question": SectionC.SECTION_C_QUESTION_18,
          "response": _response4
        },
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const Screen13();
        },
      ),
    );
  }
}
