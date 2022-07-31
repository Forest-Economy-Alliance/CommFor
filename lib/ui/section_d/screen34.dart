import 'package:flutter/material.dart';
import 'package:ifri/constants/section_d.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_option.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ifri/constants/constants.dart';
import 'package:ifri/ui/section_d/screen35.dart';

class Screen34 extends StatefulWidget {
  const Screen34({Key? key}) : super(key: key);

  @override
  State<Screen34> createState() => _Screen34State();
}

class _Screen34State extends State<Screen34> {
  DatabaseReference? ref;
  String screenName = "screen_34";
  String _response = "";
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
    ref = FirebaseDatabase.instance.ref('forms/${userId!}/1/section_d');
    setData();
  }

  void setResponse(String value) async {
    _response = value;
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container();
    } else {
      return SafeArea(
          child: Scaffold(
        body: ColoredBox(
          color: const Color(0xFF12160F),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              top: 5.0,
              bottom: 5.0,
            ),
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
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const SizedBox(
                        height: 20,
                        width: 300,
                        child: Divider(
                          color: Color(0xffD1D0BD),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(SectionD.SECTION_D_QUESTION_61,
                              style: CustomStyle.questionTitle),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomOption.optionRadioButtons(const [
                            'No rules exist',
                            'No one complies with the rules',
                            'Few users comply with the rules',
                            'About half the users comply with the rules',
                            'Most users comply with the rules',
                            'Almost all users fully comply with the rules.',
                          ], true, _response, setResponse),
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
                      height: 150,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ));
    }
  }

  void setData() async {
    final res3 = await ref!
        .child(screenName)
        .child("question_61")
        .child("response")
        .get();

    setState(() {
      _response = null == res3.value ? "" : res3.value.toString();
      isLoading = false;
    });
  }

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        "question_61": {
          "question": SectionD.SECTION_D_QUESTION_61,
          "response": _response
        }
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const Screen35();
        },
      ),
    );
  }

  navigateToPreviousScreen(BuildContext context) {
    Navigator.of(context).pop();
  }
}
