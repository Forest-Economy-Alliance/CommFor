import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/section_d.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/section_d/screen33.dart';
import 'package:provider/provider.dart';

class Screen32 extends StatefulWidget {
  const Screen32({Key? key, required this.formName}) : super(key: key);
  final String formName;
  @override
  State<Screen32> createState() => _Screen32State();
}

class _Screen32State extends State<Screen32> {
  DatabaseReference? ref;
  String screenName = "screen_35";
  bool isLoading = true;
  final String _response60_1 = "";
  final String _response60_2 = "";
  final String _response60_3 = "";
  final String _response60_4 = "";
  final String _response60_5 = "";

  TextEditingController question60Controller1 = TextEditingController();
  TextEditingController question60Controller2 = TextEditingController();
  TextEditingController question60Controller3 = TextEditingController();
  TextEditingController question60Controller4 = TextEditingController();
  TextEditingController question60Controller5 = TextEditingController();
  TextEditingController question60Controller6 = TextEditingController();
  TextEditingController question60Controller7 = TextEditingController();
  TextEditingController question60Controller8 = TextEditingController();
  TextEditingController question60Controller9 = TextEditingController();
  TextEditingController question60Controller10 = TextEditingController();
  TextEditingController question60Controller11 = TextEditingController();
  TextEditingController question60Controller12 = TextEditingController();
  TextEditingController question60Controller13 = TextEditingController();
  TextEditingController question60Controller14 = TextEditingController();
  TextEditingController question60Controller15 = TextEditingController();
  TextEditingController question60Controller16 = TextEditingController();
  TextEditingController question60Controller17 = TextEditingController();
  TextEditingController question60Controller18 = TextEditingController();
  TextEditingController question60Controller19 = TextEditingController();
  TextEditingController question60Controller20 = TextEditingController();

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
                            SectionD.SECTION_D_SECTION_3,
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
                              const Text(
                                SectionD.SECTION_D_QUESTION_60,
                                style: CustomStyle.questionTitle,
                              ),
                              space,
                              // 1st Row
                              const Text(SectionD.SECTION_D_QUESTION_60_POINT_1,
                                  style: CustomStyle.questionBoldTitle),
                              space,
                              const Text(
                                  SectionD.SECTION_D_QUESTION_60_PROPERTY_1,
                                  style: CustomStyle.optionYesNo),
                              space,
                              TextField(
                                  controller: question60Controller1,
                                  style: CustomStyle.answer,
                                  textAlign: TextAlign.start,
                                  decoration:
                                      CustomStyle.answerInputDecoration),
                              space,
                              const Text(
                                  SectionD.SECTION_D_QUESTION_60_PROPERTY_2,
                                  style: CustomStyle.optionYesNo),
                              space,
                              TextField(
                                  controller: question60Controller2,
                                  style: CustomStyle.answer,
                                  textAlign: TextAlign.start,
                                  decoration:
                                      CustomStyle.answerInputDecoration),
                              space,
                              const Text(
                                  SectionD.SECTION_D_QUESTION_60_PROPERTY_3,
                                  style: CustomStyle.optionYesNo),
                              space,
                              TextField(
                                  controller: question60Controller3,
                                  style: CustomStyle.answer,
                                  textAlign: TextAlign.start,
                                  decoration:
                                      CustomStyle.answerInputDecoration),
                              space,
                              // 1st Row End
                              // 2nd Row
                              const Text(SectionD.SECTION_D_QUESTION_60_POINT_2,
                                  style: CustomStyle.questionBoldTitle),
                              space,
                              const Text(
                                  SectionD.SECTION_D_QUESTION_60_PROPERTY_1,
                                  style: CustomStyle.optionYesNo),
                              space,
                              TextField(
                                  controller: question60Controller5,
                                  style: CustomStyle.answer,
                                  textAlign: TextAlign.start,
                                  decoration:
                                      CustomStyle.answerInputDecoration),
                              space,
                              const Text(
                                  SectionD.SECTION_D_QUESTION_60_PROPERTY_2,
                                  style: CustomStyle.optionYesNo),
                              space,
                              TextField(
                                  controller: question60Controller6,
                                  style: CustomStyle.answer,
                                  textAlign: TextAlign.start,
                                  decoration:
                                      CustomStyle.answerInputDecoration),
                              space,
                              const Text(
                                  SectionD.SECTION_D_QUESTION_60_PROPERTY_3,
                                  style: CustomStyle.optionYesNo),
                              space,
                              TextField(
                                  controller: question60Controller7,
                                  style: CustomStyle.answer,
                                  textAlign: TextAlign.start,
                                  decoration:
                                      CustomStyle.answerInputDecoration),
                              space,
                              // 3rd Row
                              const Text(
                                  SectionD
                                      .SECTION_D_QUESTION_60_POINT_3, // Only these change
                                  style: CustomStyle.questionBoldTitle),
                              space,
                              const Text(
                                  SectionD.SECTION_D_QUESTION_60_PROPERTY_1,
                                  style: CustomStyle.optionYesNo),
                              space,
                              TextField(
                                  controller:
                                      question60Controller9, // Only these change
                                  style: CustomStyle.answer,
                                  textAlign: TextAlign.start,
                                  decoration:
                                      CustomStyle.answerInputDecoration),
                              space,
                              const Text(
                                  SectionD.SECTION_D_QUESTION_60_PROPERTY_2,
                                  style: CustomStyle.optionYesNo),
                              space,
                              TextField(
                                  controller:
                                      question60Controller10, // Only these change
                                  style: CustomStyle.answer,
                                  textAlign: TextAlign.start,
                                  decoration:
                                      CustomStyle.answerInputDecoration),
                              space,
                              const Text(
                                  SectionD.SECTION_D_QUESTION_60_PROPERTY_3,
                                  style: CustomStyle.optionYesNo),
                              space,
                              TextField(
                                  controller:
                                      question60Controller11, // Only these change
                                  style: CustomStyle.answer,
                                  textAlign: TextAlign.start,
                                  decoration:
                                      CustomStyle.answerInputDecoration),
                              space,
                              // 3rd Row End
                              const Text(SectionD.SECTION_D_QUESTION_60_POINT_4,
                                  style: CustomStyle.questionBoldTitle),
                              space,
                              const Text(
                                  SectionD.SECTION_D_QUESTION_60_PROPERTY_1,
                                  style: CustomStyle.optionYesNo),
                              space,
                              TextField(
                                  controller: question60Controller13,
                                  style: CustomStyle.answer,
                                  textAlign: TextAlign.start,
                                  decoration:
                                      CustomStyle.answerInputDecoration),
                              space,
                              const Text(
                                  SectionD.SECTION_D_QUESTION_60_PROPERTY_2,
                                  style: CustomStyle.optionYesNo),
                              space,
                              TextField(
                                  controller: question60Controller14,
                                  style: CustomStyle.answer,
                                  textAlign: TextAlign.start,
                                  decoration:
                                      CustomStyle.answerInputDecoration),
                              space,
                              const Text(
                                  SectionD.SECTION_D_QUESTION_60_PROPERTY_3,
                                  style: CustomStyle.optionYesNo),
                              space,
                              TextField(
                                  controller: question60Controller15,
                                  style: CustomStyle.answer,
                                  textAlign: TextAlign.start,
                                  decoration:
                                      CustomStyle.answerInputDecoration),
                              space,
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () => syncData(context),
                              splashColor: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(2),
                              child: CustomButton.nextButton,
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

  void setResponse(String val) {
    setState(() {});
  }

  navigateToPreviousScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  void setResponse60_1(String value) async {
    // _response61 = value;
  }
  void setResponse60_2(String value) async {
    // _response61 = value;
  }
  void setResponse60_3(String value) async {
    // _response61 = value;
  }
  void setResponse60_4(String value) async {
    // _response61 = value;
  }
  void setResponse60_5(String value) async {
    // _response61 = value;
  }

  void setData() async {
    // Set the data at the starting
    // var res = await ref!
    //     .child(screenName)
    //     .child("question_64_A")
    //     .child("response")
    //     .get();
    // if (res.exists) {
    //   final values = res.value! as Map<dynamic, dynamic>;
    //   question64Controller1.text = values["Men"];
    //   question64Controller2.text = values["Women"];
    // }
    // res = await ref!
    //     .child(screenName)
    //     .child('question_64_B')
    //     .child("response")
    //     .get();
    // if (res.exists) {
    //   setResponse(res.value! as String);
    // }
    setState(() {
      isLoading = false;
    });
  }

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        // Set questions that run on submit button
        //
        // "question_64_A": {
        //   "question": SectionD.SECTION_D_QUESTION_64_A,
        //   "response": {
        //     "Men": question64Controller1.text.trim(),
        //     "Women": question64Controller2.text.trim(),
        //   }
        // },
        // "question_64_B": {
        //   "question": SectionD.SECTION_D_QUESTION_64_B,
        //   "response": response64B
        // }
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return Screen33(formName: widget.formName);
        },
      ),
    );
  }
}
