import 'package:flutter/material.dart';
import 'package:ifri/constants/section_b.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_option.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/home/home_page.dart';
import 'package:ifri/ui/section_b/screen1.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ifri/constants/constants.dart';

class Screen11 extends StatefulWidget {
  const Screen11({Key? key}) : super(key: key);

  @override
  State<Screen11> createState() => _Screen11State();
}

class _Screen11State extends State<Screen11> {
  DatabaseReference? ref;
  String screenName = "screen_11";
  String _response13 = "", _response14 = "";
  bool isLoading = true;
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
    ref = FirebaseDatabase.instance.ref('forms/${userId!}/1/section_b');
    setData();
  }

  void setResponse13(String value) async {
    _response13 = value;
  }

  void setResponse14(String value) async {
    _response14 = value;
  }

  navigateToPreviousScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  void setData() async {
    final res3 = await ref!
        .child(screenName)
        .child("question_13")
        .child("response")
        .get();

    final res4 = await ref!
        .child(screenName)
        .child("question_14")
        .child("response")
        .get();

    setState(() {
      _response13 = null == res3.value ? "" : res3.value.toString();
      _response14 = null == res4.value ? "" : res4.value.toString();
      isLoading = false;
    });
  }

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        "question_13": {
          "question": SectionB.SECTION_B_QUESTION_13,
          "response": _response13
        },
        "question_14": {
          "question": SectionB.SECTION_B_QUESTION_14,
          "response": _response14
        }
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container();
    } else {
      return SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
          child: ColoredBox(
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
                          SectionB.SECTION_B_SECTION_5,
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
                            const Text(SectionB.SECTION_B_QUESTION_13,
                                style: CustomStyle.questionTitle),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomOption.optionRadioButtons(const [
                              'Yes',
                              'No',
                            ], true, _response13, setResponse13),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(SectionB.SECTION_B_QUESTION_14,
                                style: CustomStyle.questionTitle),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomOption.optionRadioButtons(const ['Yes', 'No'],
                                true, _response14, setResponse14),
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
                              child: CustomButton.submitButton),
                        ],
                      ),
                      const SizedBox(
                        height: 300,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ));
    }
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
