import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/constants.dart';
import 'package:ifri/constants/section_c.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ifri/ui/section_c/screen24.dart';

class Screen23 extends StatefulWidget {
  const Screen23({Key? key}) : super(key: key);

  @override
  State<Screen23> createState() => _Screen23State();
}

class _Screen23State extends State<Screen23> {
  DatabaseReference? ref;

  TextEditingController question45aController = TextEditingController();
  TextEditingController question45bController = TextEditingController();
  TextEditingController question45cController = TextEditingController();
  TextEditingController question45dController = TextEditingController();
  TextEditingController question45eController = TextEditingController();

  String screenName = "screen_23";
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
                        SectionC.SECTION_C_SECTION_8,
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
                      const Text(SectionC.SECTION_C_QUESTION_45,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("(1) Irrigation ponds (number)",
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question45aController,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("(2) Wells (number)",
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question45bController,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("(3) Canal irrigation (hectares)",
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question45cController,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("(4) Perennial streams (number)",
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question45dController,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("(5) Community buildings (number)",
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question45eController,
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
    final response2 = await ref!
        .child(screenName)
        .child("question_45")
        .child("1")
        .child("response")
        .get();
    question45aController.text =
        null == response2.value ? "" : response2.value.toString();

    final response3 = await ref!
        .child(screenName)
        .child("question_45")
        .child("2")
        .child("response")
        .get();
    question45bController.text =
        null == response3.value ? "" : response3.value.toString();

    final response4 = await ref!
        .child(screenName)
        .child("question_45")
        .child("3")
        .child("response")
        .get();
    question45cController.text =
        null == response4.value ? "" : response4.value.toString();

    final response5 = await ref!
        .child(screenName)
        .child("question_45")
        .child("4")
        .child("response")
        .get();
    question45dController.text =
        null == response5.value ? "" : response5.value.toString();

    final response6 = await ref!
        .child(screenName)
        .child("question_45")
        .child("5")
        .child("response")
        .get();
    question45eController.text =
        null == response6.value ? "" : response6.value.toString();
  }

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        "question_45": {
          "question": SectionC.SECTION_C_QUESTION_20,
          "1": {
            "title": "(1) Irrigation ponds (number)",
            "response": question45aController.text
          },
          "2": {
            "title": "(2) Wells (number)",
            "response": question45bController.text
          },
          "3": {
            "title": "(3) Canal irrigation (hectares)",
            "response": question45cController.text
          },
          "4": {
            "title": "(4) Perennial streams (number)",
            "response": question45dController.text
          },
          "5": {
            "title": "(5) Community buildings (number)",
            "response": question45eController.text
          }
        }
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const Screen24();
        },
      ),
    );
  }
}
