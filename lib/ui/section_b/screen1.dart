import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/section_b.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/section_b/screen2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  DatabaseReference ref = FirebaseDatabase.instance.ref('forms/3/1/section_b');
  TextEditingController question1Controller = TextEditingController();
  TextEditingController question2Controller = TextEditingController();
  String screenName = "screen_1";

  @override
  void initState() {
    super.initState();
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
                      SectionB.SECTION_B_SECTION_1,
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
                    const Text(SectionB.SECTION_B_QUESTION_1,
                        style: CustomStyle.questionTitle),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                        controller: question1Controller,
                        style: CustomStyle.answer,
                        textAlign: TextAlign.start,
                        decoration: CustomStyle.answerInputDecoration),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(SectionB.SECTION_B_QUESTION_2,
                        style: CustomStyle.questionTitle),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                        controller: question2Controller,
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
    ));
  }

  void setData() async {
    final response1 =
        await ref.child(screenName).child("question_1").child("response").get();
    question1Controller.text =
        null == response1.value ? "" : response1.value.toString();
    final response2 =
        await ref.child(screenName).child("question_2").child("response").get();
    question2Controller.text =
        null == response2.value ? "" : response2.value.toString();
  }

  void syncData(BuildContext context) async {
    await ref.update({
      screenName: {
        "question_1": {
          "question": SectionB.SECTION_B_QUESTION_1,
          "response": question1Controller.text
        },
        "question_2": {
          "question": SectionB.SECTION_B_QUESTION_2,
          "response": question2Controller.text
        }
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const Screen2();
        },
      ),
    );
  }
}
