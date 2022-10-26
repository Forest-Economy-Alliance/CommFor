import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/section_d.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_option.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/section_d/screen35.dart';
import 'package:provider/provider.dart';

// Q 66 67
class Screen34 extends StatefulWidget {
  const Screen34({Key? key, required this.formName}) : super(key: key);
  final String formName;
  @override
  State<Screen34> createState() => _Screen34State();
}

class _Screen34State extends State<Screen34> {
  DatabaseReference? ref;
  String screenName = "screen_34";
  bool isLoading = true;
  String _response62_1_1 = "";
  String _response62_1_2 = "";
  String _response62_1_3 = "";
  String _response62_1_4 = "";
  String _response62_1_5 = "";
  final String _response62_2_1 = "";
  final String _response62_2_2 = "";
  final String _response62_2_3 = "";
  final String _response62_2_4 = "";
  final String _response62_2_5 = "";
  final String _response62_3_1 = "";
  final String _response62_3_2 = "";
  final String _response62_3_3 = "";
  final String _response62_3_4 = "";
  final String _response62_3_5 = "";
  final String _response62_4_1 = "";
  final String _response62_4_2 = "";
  final String _response62_4_3 = "";
  final String _response62_4_4 = "";
  final String _response62_4_5 = "";

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
                                  SectionD.SECTION_D_QUESTION_62,
                                  style: CustomStyle.questionTitle,
                                ),
                                space,
                                // 1st Row
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_POINT_1,
                                    style: CustomStyle.questionBoldTitle),
                                space,
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_PROPERTY_1,
                                    style: CustomStyle.optionYesNo),
                                CustomOption.optionRadioButtons(const [
                                  'Yes',
                                  'No',
                                ], true, _response62_1_1, setResponse62_1_1),
                                space,
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_PROPERTY_2,
                                    style: CustomStyle.optionYesNo),
                                CustomOption.optionRadioButtons(const [
                                  'Yes',
                                  'No',
                                ], true, _response62_1_2, setResponse62_1_2),
                                space,
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_PROPERTY_3,
                                    style: CustomStyle.optionYesNo),
                                CustomOption.optionRadioButtons(const [
                                  'Yes',
                                  'No',
                                ], true, _response62_1_3, setResponse62_1_3),
                                space,
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_PROPERTY_4,
                                    style: CustomStyle.optionYesNo),
                                CustomOption.optionRadioButtons(const [
                                  'Yes',
                                  'No',
                                ], true, _response62_1_4, setResponse62_1_4),
                                space,
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_PROPERTY_5,
                                    style: CustomStyle.questionTitle),
                                CustomOption.optionRadioButtons(const [
                                  '<10%',
                                  '10-30%',
                                  '30-50%',
                                  '>50%',
                                ], true, _response62_1_5, setResponse62_1_5),
                                space,
                                // 1st Row
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_POINT_2,
                                    style: CustomStyle.questionBoldTitle),
                                space,
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_PROPERTY_1,
                                    style: CustomStyle.optionYesNo),
                                CustomOption.optionRadioButtons(const [
                                  'Yes',
                                  'No',
                                ], true, _response62_1_1, setResponse62_1_1),
                                space,
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_PROPERTY_2,
                                    style: CustomStyle.optionYesNo),
                                CustomOption.optionRadioButtons(const [
                                  'Yes',
                                  'No',
                                ], true, _response62_1_2, setResponse62_1_2),
                                space,
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_PROPERTY_3,
                                    style: CustomStyle.optionYesNo),
                                CustomOption.optionRadioButtons(const [
                                  'Yes',
                                  'No',
                                ], true, _response62_1_3, setResponse62_1_3),
                                space,
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_PROPERTY_4,
                                    style: CustomStyle.optionYesNo),
                                CustomOption.optionRadioButtons(const [
                                  'Yes',
                                  'No',
                                ], true, _response62_1_4, setResponse62_1_4),
                                space,
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_PROPERTY_5,
                                    style: CustomStyle.questionTitle),
                                CustomOption.optionRadioButtons(const [
                                  '<10%',
                                  '10-30%',
                                  '30-50%',
                                  '>50%',
                                ], true, _response62_1_5, setResponse62_1_5),
                                space,
                                // 1st Row
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_POINT_3,
                                    style: CustomStyle.questionBoldTitle),
                                space,
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_PROPERTY_1,
                                    style: CustomStyle.optionYesNo),
                                CustomOption.optionRadioButtons(const [
                                  'Yes',
                                  'No',
                                ], true, _response62_1_1, setResponse62_1_1),
                                space,
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_PROPERTY_2,
                                    style: CustomStyle.optionYesNo),
                                CustomOption.optionRadioButtons(const [
                                  'Yes',
                                  'No',
                                ], true, _response62_1_2, setResponse62_1_2),
                                space,
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_PROPERTY_3,
                                    style: CustomStyle.optionYesNo),
                                CustomOption.optionRadioButtons(const [
                                  'Yes',
                                  'No',
                                ], true, _response62_1_3, setResponse62_1_3),
                                space,
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_PROPERTY_4,
                                    style: CustomStyle.optionYesNo),
                                CustomOption.optionRadioButtons(const [
                                  'Yes',
                                  'No',
                                ], true, _response62_1_4, setResponse62_1_4),
                                space,
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_PROPERTY_5,
                                    style: CustomStyle.questionTitle),
                                CustomOption.optionRadioButtons(const [
                                  '<10%',
                                  '10-30%',
                                  '30-50%',
                                  '>50%',
                                ], true, _response62_1_5, setResponse62_1_5),
                                space,
                                // 1st Row
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_POINT_4,
                                    style: CustomStyle.questionBoldTitle),
                                space,
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_PROPERTY_1,
                                    style: CustomStyle.optionYesNo),
                                CustomOption.optionRadioButtons(const [
                                  'Yes',
                                  'No',
                                ], true, _response62_1_1, setResponse62_1_1),
                                space,
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_PROPERTY_2,
                                    style: CustomStyle.optionYesNo),
                                CustomOption.optionRadioButtons(const [
                                  'Yes',
                                  'No',
                                ], true, _response62_1_2, setResponse62_1_2),
                                space,
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_PROPERTY_3,
                                    style: CustomStyle.optionYesNo),
                                CustomOption.optionRadioButtons(const [
                                  'Yes',
                                  'No',
                                ], true, _response62_1_3, setResponse62_1_3),
                                space,
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_PROPERTY_4,
                                    style: CustomStyle.optionYesNo),
                                CustomOption.optionRadioButtons(const [
                                  'Yes',
                                  'No',
                                ], true, _response62_1_4, setResponse62_1_4),
                                space,
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_PROPERTY_5,
                                    style: CustomStyle.questionTitle),
                                CustomOption.optionRadioButtons(const [
                                  '<10%',
                                  '10-30%',
                                  '30-50%',
                                  '>50%',
                                ], true, _response62_1_5, setResponse62_1_5),
                                space,
                                // 1st Row
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_POINT_5,
                                    style: CustomStyle.questionBoldTitle),
                                space,
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_PROPERTY_1,
                                    style: CustomStyle.optionYesNo),
                                CustomOption.optionRadioButtons(const [
                                  'Yes',
                                  'No',
                                ], true, _response62_1_1, setResponse62_1_1),
                                space,
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_PROPERTY_2,
                                    style: CustomStyle.optionYesNo),
                                CustomOption.optionRadioButtons(const [
                                  'Yes',
                                  'No',
                                ], true, _response62_1_2, setResponse62_1_2),
                                space,
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_PROPERTY_3,
                                    style: CustomStyle.optionYesNo),
                                CustomOption.optionRadioButtons(const [
                                  'Yes',
                                  'No',
                                ], true, _response62_1_3, setResponse62_1_3),
                                space,
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_PROPERTY_4,
                                    style: CustomStyle.optionYesNo),
                                CustomOption.optionRadioButtons(const [
                                  'Yes',
                                  'No',
                                ], true, _response62_1_4, setResponse62_1_4),
                                space,
                                const Text(
                                    SectionD.SECTION_D_QUESTION_62_PROPERTY_5,
                                    style: CustomStyle.questionTitle),
                                CustomOption.optionRadioButtons(const [
                                  '<10%',
                                  '10-30%',
                                  '30-50%',
                                  '>50%',
                                ], true, _response62_1_5, setResponse62_1_5),
                                space,
                                // 1st Row End
                                // 2nd Row
                              ]),
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

  void setResponse62_1_1(String value) async {
    _response62_1_1 = value;
  }

  void setResponse62_1_2(String value) async {
    _response62_1_2 = value;
  }

  void setResponse62_1_3(String value) async {
    _response62_1_3 = value;
  }

  void setResponse62_1_4(String value) async {
    _response62_1_4 = value;
  }

  void setResponse62_1_5(String value) async {
    _response62_1_5 = value;
  }

  void setResponse62_2(String value) async {
    // _response61 = value;
  }
  void setResponse62_3(String value) async {
    // _response61 = value;
  }
  void setResponse62_4(String value) async {
    // _response61 = value;
  }
  void setResponse62_5(String value) async {
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
          return Screen35(formName: widget.formName);
        },
      ),
    );
  }
}
