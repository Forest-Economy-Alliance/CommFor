import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/section_c.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/section_c/screen19.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:provider/provider.dart';

class Screen18 extends StatefulWidget {
  const Screen18({Key? key, required this.formName}) : super(key: key);
  final String formName;
  @override
  State<Screen18> createState() => _Screen18State();
}

class _Screen18State extends State<Screen18> {
  DatabaseReference? ref;
  TextEditingController question29Controller = TextEditingController();
  TextEditingController question30Controller = TextEditingController();
  TextEditingController question31Controller = TextEditingController();
  TextEditingController question32Controller = TextEditingController();
  TextEditingController question33Controller = TextEditingController();
  TextEditingController question34Controller = TextEditingController();
  TextEditingController question35Controller = TextEditingController();
  String screenName = "screen_18";
  late FirebaseAuthService authService;

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
                        SectionC.SECTION_C_SECTION_5,
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
                      const Text(SectionC.SECTION_C_QUESTION_29,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question29Controller,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_30,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question30Controller,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_31,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question31Controller,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_32,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question32Controller,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_33,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question33Controller,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_34,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question34Controller,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(SectionC.SECTION_C_QUESTION_35,
                          style: CustomStyle.questionTitle),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                          controller: question35Controller,
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
        .child("question_29")
        .child("response")
        .get();
    question29Controller.text =
        null == response1.value ? "" : response1.value.toString();
    final response2 = await ref!
        .child(screenName)
        .child("question_30")
        .child("response")
        .get();
    question30Controller.text =
        null == response2.value ? "" : response2.value.toString();
    final response3 = await ref!
        .child(screenName)
        .child("question_31")
        .child("response")
        .get();
    question31Controller.text =
        null == response3.value ? "" : response3.value.toString();
    final response4 = await ref!
        .child(screenName)
        .child("question_32")
        .child("response")
        .get();
    question32Controller.text =
        null == response4.value ? "" : response4.value.toString();
    final response5 = await ref!
        .child(screenName)
        .child("question_33")
        .child("response")
        .get();
    question33Controller.text =
        null == response5.value ? "" : response5.value.toString();
    final response6 = await ref!
        .child(screenName)
        .child("question_34")
        .child("response")
        .get();
    question34Controller.text =
        null == response6.value ? "" : response6.value.toString();
    final response7 = await ref!
        .child(screenName)
        .child("question_35")
        .child("response")
        .get();
    question35Controller.text =
        null == response7.value ? "" : response7.value.toString();
  }

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        "question_29": {
          "question": SectionC.SECTION_C_QUESTION_29,
          "response": question29Controller.text
        },
        "question_30": {
          "question": SectionC.SECTION_C_QUESTION_30,
          "response": question30Controller.text
        },
        "question_31": {
          "question": SectionC.SECTION_C_QUESTION_31,
          "response": question31Controller.text
        },
        "question_32": {
          "question": SectionC.SECTION_C_QUESTION_32,
          "response": question32Controller.text
        },
        "question_33": {
          "question": SectionC.SECTION_C_QUESTION_33,
          "response": question33Controller.text
        },
        "question_34": {
          "question": SectionC.SECTION_C_QUESTION_34,
          "response": question34Controller.text
        },
        "question_35": {
          "question": SectionC.SECTION_C_QUESTION_35,
          "response": question35Controller.text
        },
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return Screen19(formName: widget.formName);
        },
      ),
    );
  }
}
