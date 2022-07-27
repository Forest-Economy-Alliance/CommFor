import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/constants.dart';
import 'package:ifri/constants/section_c.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/section_c/screen13.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ifri/ui/section_c/screen17.dart';

class Screen16 extends StatefulWidget {
  const Screen16({Key? key}) : super(key: key);

  @override
  State<Screen16> createState() => _Screen16State();
}

class _Screen16State extends State<Screen16> {
  DatabaseReference? ref;
  TextEditingController question25Controller = TextEditingController();
  TextEditingController question26Controller = TextEditingController();
  TextEditingController question17Controller = TextEditingController();
  String screenName = "screen_16";
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
                      SectionC.SECTION_C_SECTION_3,
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
                    const Text(SectionC.SECTION_C_QUESTION_25,
                        style: CustomStyle.questionTitle),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                        controller: question25Controller,
                        style: CustomStyle.answer,
                        textAlign: TextAlign.start,
                        decoration: CustomStyle.answerInputDecoration),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(SectionC.SECTION_C_QUESTION_26,
                        style: CustomStyle.questionTitle),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                        controller: question26Controller,
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
        .child("question_25")
        .child("response")
        .get();
    question25Controller.text =
        null == response1.value ? "" : response1.value.toString();
    final response2 = await ref!
        .child(screenName)
        .child("question_26")
        .child("response")
        .get();
    question26Controller.text =
        null == response2.value ? "" : response2.value.toString();
  }

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        "question_25": {
          "question": SectionC.SECTION_C_QUESTION_25,
          "response": question25Controller.text
        },
        "question_26": {
          "question": SectionC.SECTION_C_QUESTION_26,
          "response": question26Controller.text
        }
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const Screen17();
        },
      ),
    );
  }
}
