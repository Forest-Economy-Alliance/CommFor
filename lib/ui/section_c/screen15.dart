import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/constants.dart';
import 'package:ifri/constants/section_c.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ifri/ui/section_c/screen16.dart';

class Screen15 extends StatefulWidget {
  const Screen15({Key? key}) : super(key: key);

  @override
  State<Screen15> createState() => _Screen15State();
}

class _Screen15State extends State<Screen15> {
  DatabaseReference? ref;
  TextEditingController question22aController = TextEditingController();
  TextEditingController question22bController = TextEditingController();
  TextEditingController question23Controller = TextEditingController();
  TextEditingController question24aController = TextEditingController();
  TextEditingController question24bController = TextEditingController();
  TextEditingController question24cController = TextEditingController();
  TextEditingController question24dController = TextEditingController();

  String screenName = "screen_15";
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
                      const Text(SectionC.SECTION_C_QUESTION_22,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("(1) Men", style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question22aController,
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
                          controller: question22bController,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_23,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question23Controller,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_24,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("(1) Inward",
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question24aController,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("(2) Outward",
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question24bController,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("(3) Both", style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question24cController,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("(4) No migration",
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question24dController,
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
        .child("question_23")
        .child("response")
        .get();
    question23Controller.text =
        null == response1.value ? "" : response1.value.toString();
    final response2 = await ref!
        .child(screenName)
        .child("question_24")
        .child("1")
        .child("response")
        .get();
    question24aController.text =
        null == response2.value ? "" : response2.value.toString();

    final response3 = await ref!
        .child(screenName)
        .child("question_24")
        .child("2")
        .child("response")
        .get();
    question24bController.text =
        null == response3.value ? "" : response3.value.toString();

    final response4 = await ref!
        .child(screenName)
        .child("question_24")
        .child("3")
        .child("response")
        .get();
    question24cController.text =
        null == response4.value ? "" : response4.value.toString();

    final response5 = await ref!
        .child(screenName)
        .child("question_24")
        .child("4")
        .child("response")
        .get();
    question24dController.text =
        null == response5.value ? "" : response5.value.toString();

    final response6 = await ref!
        .child(screenName)
        .child("question_22")
        .child("1")
        .child("response")
        .get();
    question22aController.text =
        null == response6.value ? "" : response6.value.toString();

    final response7 = await ref!
        .child(screenName)
        .child("question_22")
        .child("2")
        .child("response")
        .get();
    question22bController.text =
        null == response7.value ? "" : response7.value.toString();
  }

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        "question_22": {
          "question": SectionC.SECTION_C_QUESTION_22,
          "1": {"title": "(1) Men", "response": question22aController.text},
          "2": {"title": "(2) Women", "response": question22bController.text}
        },
        "question_23": {
          "question": SectionC.SECTION_C_QUESTION_23,
          "response": question23Controller.text
        },
        "question_24": {
          "question": SectionC.SECTION_C_QUESTION_24,
          "1": {"title": "(1) Inward", "response": question24aController.text},
          "2": {"title": "(2) Outward", "response": question24bController.text},
          "3": {"title": "(3) Both ", "response": question24cController.text},
          "4": {
            "title": "(4) No migration ",
            "response": question24dController.text
          }
        }
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const Screen16();
        },
      ),
    );
  }
}
