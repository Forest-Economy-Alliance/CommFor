import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/section_d.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_option.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/home/home_page.dart';
import 'package:provider/provider.dart';

// Q 64 65
class Screen36 extends StatefulWidget {
  const Screen36({Key? key, required this.formName}) : super(key: key);
  final String formName;
  @override
  State<Screen36> createState() => _Screen36State();
}

class _Screen36State extends State<Screen36> {
  DatabaseReference? ref;
  String screenName = "screen_36";
  bool isLoading = true;
  String response64B = '';
  String response65 = '';
  String response66 = '';
  String response67 = '';
  TextEditingController question64Controller1 = TextEditingController();
  TextEditingController question64Controller2 = TextEditingController();

  String? userId;

  late FirebaseAuthService authService;

  @override
  void initState() {
    super.initState();
    authService = context.read<FirebaseAuthService>();

    initialize();
  }

  void initialize() async {
    userId = authService.user!.uid;

    ref = FirebaseDatabase.instance
        .ref('forms/${userId!}/${widget.formName}/section_d');
    setData();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container();
    } else {
      const space = SizedBox(
        height: 20,
      );
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
                          onTap: () => {navigateToPreviousScreen(context)},
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
                            SectionD.SECTION_D_SECTION_4,
                            style: CustomStyle.screenTitle,
                          ),
                        ),
                        Container(),
                      ],
                    ),
                    Column(
                      children: [
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
                              const Text(SectionD.SECTION_D_QUESTION_64_A,
                                  style: CustomStyle.questionTitle),
                              space,
                              const Text("Men",
                                  style: CustomStyle.questionBoldTitle),
                              space,
                              TextField(
                                  controller: question64Controller1,
                                  style: CustomStyle.answer,
                                  textAlign: TextAlign.start,
                                  decoration:
                                      CustomStyle.answerInputDecoration),
                              space,
                              const Text("Women",
                                  style: CustomStyle.questionBoldTitle),
                              space,
                              TextField(
                                  controller: question64Controller2,
                                  style: CustomStyle.answer,
                                  textAlign: TextAlign.start,
                                  decoration:
                                      CustomStyle.answerInputDecoration),
                              space,
                              space,
                              const Text(
                                SectionD.SECTION_D_QUESTION_64_B,
                                style: CustomStyle.questionTitle,
                              ),
                              space,
                              CustomOption.optionRadioButtons(
                                ['Male', 'Female'],
                                false,
                                'Male',
                                setResponse64b,
                              ),
                              space,
                              space,
                              const Text(
                                SectionD.SECTION_D_QUESTION_65,
                                style: CustomStyle.questionTitle,
                              ),
                              space,
                              CustomOption.optionRadioButtons(
                                ['Yes', 'No'],
                                false,
                                'Yes',
                                setResponse65,
                              ),
                              space,
                              space,
                              const Text(
                                SectionD.SECTION_D_QUESTION_66,
                                style: CustomStyle.questionTitle,
                              ),
                              CustomOption.optionRadioButtons(
                                [
                                  'Once a day',
                                  'Multiple times in a week',
                                  'Once a week',
                                  'Once in two weeks',
                                  'Once in a month',
                                  'Once in three months',
                                  'Once in six months',
                                  'Once in a year',
                                  'Never'
                                ],
                                true,
                                'Once a day',
                                setResponse66,
                              ),
                              const Text(
                                SectionD.SECTION_D_QUESTION_67,
                                style: CustomStyle.questionTitle,
                              ),
                              space,
                              CustomOption.optionRadioButtons(
                                [
                                  '<10 percent participate',
                                  '10-30 percent participate',
                                  '30-50 percent participate',
                                  '>50 percent participate'
                                ],
                                true,
                                '<10 percent participate',
                                setResponse67,
                              ),
                            ],
                          ),
                        ),
                        space,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () => syncData(context),
                              splashColor: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(2),
                              child: CustomButton.submitButton,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  void setResponse64b(String val) {
    setState(() {
      response64B = val;
    });
  }

  void setResponse65(String val) {
    setState(() {
      response65 = val;
    });
  }

  void setResponse66(String val) {
    setState(() {
      response66 = val;
    });
  }

  void setResponse67(String val) {
    setState(() {
      response67 = val;
    });
  }

  navigateToPreviousScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  void setData() async {
    var res = await ref!
        .child(screenName)
        .child("question_64_A")
        .child("response")
        .get();
    if (res.exists) {
      final values = res.value! as Map<dynamic, dynamic>;
      question64Controller1.text = values["Men"];
      question64Controller2.text = values["Women"];
    }
    res = await ref!
        .child(screenName)
        .child('question_64_B')
        .child("response")
        .get();
    if (res.exists) {
      setResponse64b(res.value! as String);
    }
    setState(() {
      isLoading = false;
    });
  }

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        "question_64_A": {
          "question": SectionD.SECTION_D_QUESTION_64_A,
          "response": {
            "Men": question64Controller1.text.trim(),
            "Women": question64Controller2.text.trim(),
          }
        },
        "question_64_B": {
          "question": SectionD.SECTION_D_QUESTION_64_B,
          "response": response64B
        }
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const HomePage();
        },
      ),
    );
  }
}
