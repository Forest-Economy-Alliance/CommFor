import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/section_d.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/section_d/screen32.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ifri/constants/constants.dart';

class Screen31 extends StatefulWidget {
  const Screen31({Key? key}) : super(key: key);

  @override
  State<Screen31> createState() => _Screen31State();
}

class _Screen31State extends State<Screen31> {
  DatabaseReference? ref;
  TextEditingController question1Controller = TextEditingController();
  TextEditingController question2Controller = TextEditingController();
  String screenName = "screen_31";
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
    ref = FirebaseDatabase.instance.ref('forms/${userId!}/1/section_d');
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
                      SectionD.SECTION_D_SECTION_2,
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
                    const Text(SectionD.SECTION_D_QUESTION_55,
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
                    const Text(SectionD.SECTION_D_QUESTION_56,
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
    final response1 = await ref!
        .child(screenName)
        .child("question_55")
        .child("response")
        .get();
    question1Controller.text =
        null == response1.value ? "" : response1.value.toString();
    final response2 = await ref!
        .child(screenName)
        .child("question_56")
        .child("response")
        .get();
    question2Controller.text =
        null == response2.value ? "" : response2.value.toString();
  }

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        "question_55": {
          "question": SectionD.SECTION_D_QUESTION_55,
          "response": question1Controller.text
        },
        "question_56": {
          "question": SectionD.SECTION_D_QUESTION_56,
          "response": question2Controller.text
        }
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const Screen32();
        },
      ),
    );
  }
}
