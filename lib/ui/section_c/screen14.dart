import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/section_c.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/section_c/screen15.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:provider/provider.dart';

class Screen14 extends StatefulWidget {
  const Screen14({Key? key, required this.formName}) : super(key: key);
  final String formName;
  @override
  State<Screen14> createState() => _Screen14State();
}

class _Screen14State extends State<Screen14> {
  DatabaseReference? ref;

  TextEditingController question21aController = TextEditingController();
  TextEditingController question21bController = TextEditingController();
  TextEditingController question21cController = TextEditingController();
  TextEditingController question21dController = TextEditingController();
  TextEditingController question21eController = TextEditingController();
  TextEditingController question21fController = TextEditingController();
  TextEditingController question21gController = TextEditingController();
  TextEditingController question21hController = TextEditingController();
  TextEditingController question21iController = TextEditingController();

  String screenName = "screen_14";
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
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(SectionC.SECTION_C_QUESTION_21,
                            style: CustomStyle.questionTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_21_OPTION_1,
                            style: CustomStyle.questionTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question21aController,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_21_OPTION_2,
                            style: CustomStyle.questionTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question21bController,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_21_OPTION_3,
                            style: CustomStyle.questionTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question21cController,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_21_OPTION_4,
                            style: CustomStyle.questionTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question21dController,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_21_OPTION_5,
                            style: CustomStyle.questionTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question21eController,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_21_OPTION_6,
                            style: CustomStyle.questionTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question21fController,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_21_OPTION_7,
                            style: CustomStyle.questionTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question21gController,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_21_OPTION_8,
                            style: CustomStyle.questionTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question21hController,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_21_OPTION_9,
                            style: CustomStyle.questionTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question21iController,
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
      ),
    );
  }

  void setData() async {
    final response1 = await ref!
        .child(screenName)
        .child("question_21")
        .child("1")
        .child("response")
        .get();
    question21aController.text =
        null == response1.value ? "" : response1.value.toString();

    final response2 = await ref!
        .child(screenName)
        .child("question_21")
        .child("2")
        .child("response")
        .get();
    question21bController.text =
        null == response2.value ? "" : response2.value.toString();

    final response3 = await ref!
        .child(screenName)
        .child("question_21")
        .child("3")
        .child("response")
        .get();
    question21cController.text =
        null == response3.value ? "" : response3.value.toString();

    final response4 = await ref!
        .child(screenName)
        .child("question_21")
        .child("4")
        .child("response")
        .get();
    question21dController.text =
        null == response4.value ? "" : response4.value.toString();

    final response5 = await ref!
        .child(screenName)
        .child("question_21")
        .child("5")
        .child("response")
        .get();
    question21eController.text =
        null == response5.value ? "" : response5.value.toString();

    final response6 = await ref!
        .child(screenName)
        .child("question_21")
        .child("6")
        .child("response")
        .get();
    question21fController.text =
        null == response6.value ? "" : response6.value.toString();

    final response7 = await ref!
        .child(screenName)
        .child("question_21")
        .child("7")
        .child("response")
        .get();
    question21gController.text =
        null == response7.value ? "" : response7.value.toString();

    final response8 = await ref!
        .child(screenName)
        .child("question_21")
        .child("8")
        .child("response")
        .get();
    question21hController.text =
        null == response8.value ? "" : response8.value.toString();

    final response9 = await ref!
        .child(screenName)
        .child("question_21")
        .child("9")
        .child("response")
        .get();
    question21iController.text =
        null == response9.value ? "" : response9.value.toString();
  }

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        "question_21": {
          "question": SectionC.SECTION_C_QUESTION_21,
          "1": {
            "title": SectionC.SECTION_C_QUESTION_21_OPTION_1,
            "response": question21aController.text
          },
          "2": {
            "title": SectionC.SECTION_C_QUESTION_21_OPTION_2,
            "response": question21bController.text
          },
          "3": {
            "title": SectionC.SECTION_C_QUESTION_21_OPTION_3,
            "response": question21cController.text
          },
          "4": {
            "title": SectionC.SECTION_C_QUESTION_21_OPTION_4,
            "response": question21dController.text
          },
          "5": {
            "title": SectionC.SECTION_C_QUESTION_21_OPTION_5,
            "response": question21eController.text
          },
          "6": {
            "title": SectionC.SECTION_C_QUESTION_21_OPTION_6,
            "response": question21fController.text
          },
          "7": {
            "title": SectionC.SECTION_C_QUESTION_21_OPTION_7,
            "response": question21gController.text
          },
          "8": {
            "title": SectionC.SECTION_C_QUESTION_21_OPTION_8,
            "response": question21hController.text
          },
          "9": {
            "title": SectionC.SECTION_C_QUESTION_21_OPTION_9,
            "response": question21iController.text
          }
        }
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return Screen15(formName: widget.formName);
        },
      ),
    );
  }
}
