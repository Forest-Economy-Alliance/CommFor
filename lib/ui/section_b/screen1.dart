import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/section_b.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/section_b/screen2.dart';
import 'package:provider/provider.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key, required this.formName}) : super(key: key);
  final String formName;

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  DatabaseReference? ref;
  TextEditingController question1Controller = TextEditingController();
  List<TextEditingController> question2Controller = [];
  List<Container> textFields = [];
  String screenName = "screen_1";
  String? userId;

  late FirebaseAuthService authService;

  @override
  void initState() {
    super.initState();
    authService = context.read<FirebaseAuthService>();
    initialize();
    question2Controller.add(TextEditingController());
    textFields.add(_buildTextField());
  }

  void initialize() async {
    // User should be logged in
    userId = authService.user!.uid;
    ref = FirebaseDatabase.instance
        .ref('forms/${userId!}/${widget.formName}/section_b');
    setData();
  }

  Container _buildTextField() {
    // return a container with textfield and a button to add another textfireld
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
                controller: question2Controller.last,
                style: CustomStyle.answer,
                textAlign: TextAlign.start,
                decoration: CustomStyle.answerInputDecoration),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                question2Controller.add(TextEditingController());
                textFields.add(_buildTextField());
              });
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
    // return TextField(
    //     controller: question2Controller,
    //     style: CustomStyle.answer,
    //     textAlign: TextAlign.start,
    //     decoration: CustomStyle.answerInputDecoration);
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF12160F),
        body: Container(
          height: MediaQuery.of(context).size.height,
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
                      onTap: () {
                        Navigator.pop(context);
                      },
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
                      ListView(
                        shrinkWrap: true,
                        children: textFields,
                      )
                      // TextField(
                      //     controller: question2Controller,
                      //     style: CustomStyle.answer,
                      //     textAlign: TextAlign.start,
                      //     decoration: CustomStyle.answerInputDecoration),
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
    );
  }

  void setData() async {
    final response1 = await ref!
        .child(screenName)
        .child("question_1")
        .child("response")
        .get();
    question1Controller.text =
        null == response1.value ? "" : response1.value.toString();
    final response2 = await ref!
        .child(screenName)
        .child("question_2")
        .child("response")
        .get();
    question2Controller[0].text =
        null == response2.value ? "" : response2.value.toString();
    // question2Controller.text =
    //     null == response2.value ? "" : response2.value.toString();
  }

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        "question_1": {
          "question": SectionB.SECTION_B_QUESTION_1,
          "response": question1Controller.text
        },
        "question_2": {
          "question": SectionB.SECTION_B_QUESTION_2,
          "response": question2Controller[0].text
        }
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return Screen2(formName: widget.formName);
        },
      ),
    );
  }
}
