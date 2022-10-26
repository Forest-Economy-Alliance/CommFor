import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/section_c.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/section_c/screen23.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:provider/provider.dart';

class Screen22 extends StatefulWidget {
  const Screen22({Key? key, required this.formName}) : super(key: key);
  final String formName;
  @override
  State<Screen22> createState() => _Screen22State();
}

class _Screen22State extends State<Screen22> {
  DatabaseReference? ref;
  TextEditingController question41Controller = TextEditingController();
  TextEditingController question42Controller = TextEditingController();
  TextEditingController question43Controller = TextEditingController();
  TextEditingController question44Controller = TextEditingController();
  String screenName = "screen_22";
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
                          SectionC.SECTION_C_SECTION_7,
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
                        const Text(SectionC.SECTION_C_QUESTION_41,
                            style: CustomStyle.questionTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question41Controller,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_42,
                            style: CustomStyle.questionTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question42Controller,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_43,
                            style: CustomStyle.questionTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question43Controller,
                            style: CustomStyle.answer,
                            textAlign: TextAlign.start,
                            decoration: CustomStyle.answerInputDecoration),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(SectionC.SECTION_C_QUESTION_44,
                            style: CustomStyle.questionTitle),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                            controller: question44Controller,
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
        .child("question_41")
        .child("response")
        .get();
    question41Controller.text =
        null == response1.value ? "" : response1.value.toString();
    final response2 = await ref!
        .child(screenName)
        .child("question_42")
        .child("response")
        .get();
    question42Controller.text =
        null == response2.value ? "" : response2.value.toString();
    final response3 = await ref!
        .child(screenName)
        .child("question_43")
        .child("response")
        .get();
    question43Controller.text =
        null == response3.value ? "" : response3.value.toString();
    final response4 = await ref!
        .child(screenName)
        .child("question_44")
        .child("response")
        .get();
    question44Controller.text =
        null == response4.value ? "" : response4.value.toString();
  }

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        "question_41": {
          "question": SectionC.SECTION_C_QUESTION_41,
          "response": question41Controller.text
        },
        "question_42": {
          "question": SectionC.SECTION_C_QUESTION_42,
          "response": question42Controller.text
        },
        "question_43": {
          "question": SectionC.SECTION_C_QUESTION_43,
          "response": question43Controller.text
        },
        "question_44": {
          "question": SectionC.SECTION_C_QUESTION_44,
          "response": question44Controller.text
        },
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return Screen23(formName: widget.formName);
        },
      ),
    );
  }
}
