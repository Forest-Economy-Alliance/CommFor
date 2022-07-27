import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/constants.dart';
import 'package:ifri/constants/section_c.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ifri/ui/section_c/screen14.dart';

class Screen13 extends StatefulWidget {
  const Screen13({Key? key}) : super(key: key);

  @override
  State<Screen13> createState() => _Screen13State();
}

class _Screen13State extends State<Screen13> {
  DatabaseReference? ref;
  TextEditingController question19Controller = TextEditingController();
  TextEditingController question20aController = TextEditingController();
  TextEditingController question20bController = TextEditingController();
  TextEditingController question20cController = TextEditingController();

  String screenName = "screen_13";
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
    ref = FirebaseDatabase.instance.ref('forms/${userId!}/1/section_c');
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
                        SectionC.SECTION_C_SECTION_2,
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
                      const Text(SectionC.SECTION_C_QUESTION_19,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question19Controller,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_20,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("(1) Men ", style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question20aController,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("(2) Women", style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question20bController,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("(3) Children (<14 years)",
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question20cController,
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
    final response1 = await ref!
        .child(screenName)
        .child("question_19")
        .child("response")
        .get();
    question19Controller.text =
        null == response1.value ? "" : response1.value.toString();
    final response2 = await ref!
        .child(screenName)
        .child("question_20")
        .child("1")
        .child("response")
        .get();
    question20aController.text =
        null == response2.value ? "" : response2.value.toString();

    final response3 = await ref!
        .child(screenName)
        .child("question_20")
        .child("2")
        .child("response")
        .get();
    question20bController.text =
        null == response3.value ? "" : response3.value.toString();

    final response4 = await ref!
        .child(screenName)
        .child("question_20")
        .child("3")
        .child("response")
        .get();
    question20cController.text =
        null == response4.value ? "" : response4.value.toString();
  }

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        "question_19": {
          "question": SectionC.SECTION_C_QUESTION_19,
          "response": question19Controller.text
        },
        "question_20": {
          "question": SectionC.SECTION_C_QUESTION_20,
          "1": {"title": "(1) Men", "response": question20aController.text},
          "2": {"title": "(2) Women", "response": question20bController.text},
          "3": {
            "title": "(3) Children (<14 years)",
            "response": question20cController.text
          }
        }
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const Screen14();
        },
      ),
    );
  }
}
