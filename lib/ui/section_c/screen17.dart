import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/constants.dart';
import 'package:ifri/constants/section_c.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ifri/ui/section_c/screen18.dart';

class Screen17 extends StatefulWidget {
  const Screen17({Key? key}) : super(key: key);

  @override
  State<Screen17> createState() => _Screen17State();
}

class _Screen17State extends State<Screen17> {
  DatabaseReference? ref;
  TextEditingController question27aController = TextEditingController();
  TextEditingController question27bController = TextEditingController();
  TextEditingController question27cController = TextEditingController();
  TextEditingController question27dController = TextEditingController();
  TextEditingController question27eController = TextEditingController();
  TextEditingController question28aController = TextEditingController();
  TextEditingController question28bController = TextEditingController();
  TextEditingController question28cController = TextEditingController();
  TextEditingController question28dController = TextEditingController();
  TextEditingController question28eController = TextEditingController();

  String screenName = "screen_17";
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
                        SectionC.SECTION_C_SECTION_4,
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
                      const Text(SectionC.SECTION_C_QUESTION_27,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_27_OPTION_1,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question27aController,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_27_OPTION_2,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question27bController,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_27_OPTION_3,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question27cController,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_27_OPTION_4,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question27dController,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_27_OPTION_5,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question27eController,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_28,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_28_OPTION_1,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question28aController,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_28_OPTION_2,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question28bController,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_28_OPTION_3,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question28cController,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_28_OPTION_4,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question28dController,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_28_OPTION_5,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question28eController,
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
        .child("question_27")
        .child("1")
        .child("response")
        .get();
    question27aController.text =
        null == response1.value ? "" : response1.value.toString();

    final response2 = await ref!
        .child(screenName)
        .child("question_27")
        .child("2")
        .child("response")
        .get();
    question27bController.text =
        null == response2.value ? "" : response2.value.toString();

    final response3 = await ref!
        .child(screenName)
        .child("question_27")
        .child("3")
        .child("response")
        .get();
    question27cController.text =
        null == response3.value ? "" : response3.value.toString();

    final response4 = await ref!
        .child(screenName)
        .child("question_27")
        .child("4")
        .child("response")
        .get();
    question27dController.text =
        null == response4.value ? "" : response4.value.toString();

    final response5 = await ref!
        .child(screenName)
        .child("question_27")
        .child("5")
        .child("response")
        .get();
    question27eController.text =
        null == response5.value ? "" : response5.value.toString();

    final response6 = await ref!
        .child(screenName)
        .child("question_28")
        .child("1")
        .child("response")
        .get();
    question28aController.text =
        null == response6.value ? "" : response6.value.toString();

    final response7 = await ref!
        .child(screenName)
        .child("question_28")
        .child("2")
        .child("response")
        .get();
    question28bController.text =
        null == response7.value ? "" : response7.value.toString();

    final response8 = await ref!
        .child(screenName)
        .child("question_28")
        .child("3")
        .child("response")
        .get();
    question28cController.text =
        null == response8.value ? "" : response8.value.toString();

    final response9 = await ref!
        .child(screenName)
        .child("question_28")
        .child("4")
        .child("response")
        .get();
    question28dController.text =
        null == response9.value ? "" : response9.value.toString();

    final response10 = await ref!
        .child(screenName)
        .child("question_28")
        .child("5")
        .child("response")
        .get();
    question28eController.text =
        null == response10.value ? "" : response10.value.toString();
  }

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        "question_27": {
          "question": SectionC.SECTION_C_QUESTION_27,
          "1": {
            "title": SectionC.SECTION_C_QUESTION_27_OPTION_1,
            "response": question27aController.text
          },
          "2": {
            "title": SectionC.SECTION_C_QUESTION_27_OPTION_2,
            "response": question27bController.text
          },
          "3": {
            "title": SectionC.SECTION_C_QUESTION_27_OPTION_3,
            "response": question27cController.text
          },
          "4": {
            "title": SectionC.SECTION_C_QUESTION_27_OPTION_4,
            "response": question27dController.text
          },
          "5": {
            "title": SectionC.SECTION_C_QUESTION_27_OPTION_5,
            "response": question27eController.text
          },
        },
        "question_28": {
          "question": SectionC.SECTION_C_QUESTION_28,
          "1": {
            "title": SectionC.SECTION_C_QUESTION_28_OPTION_1,
            "response": question28aController.text
          },
          "2": {
            "title": SectionC.SECTION_C_QUESTION_28_OPTION_2,
            "response": question28bController.text
          },
          "3": {
            "title": SectionC.SECTION_C_QUESTION_28_OPTION_3,
            "response": question28cController.text
          },
          "4": {
            "title": SectionC.SECTION_C_QUESTION_28_OPTION_4,
            "response": question28dController.text
          },
          "5": {
            "title": SectionC.SECTION_C_QUESTION_28_OPTION_5,
            "response": question28eController.text
          },
        },
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const Screen18();
        },
      ),
    );
  }
}
