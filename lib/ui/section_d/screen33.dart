import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/section_d.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_option.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/section_d/screen34.dart';
import 'package:provider/provider.dart';

// Q 66 67
class Screen33 extends StatefulWidget {
  const Screen33({Key? key, required this.formName}) : super(key: key);
  final String formName;
  @override
  State<Screen33> createState() => _Screen33State();
}

class _Screen33State extends State<Screen33> {
  DatabaseReference? ref;
  String screenName = "screen_33";
  bool isLoading = true;
  final String _response61 = "";

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
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
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
                                // The
                                // Questions
                                // Will be here
                                const Text(SectionD.SECTION_D_QUESTION_61,
                                    style: CustomStyle.questionTitle),
                                CustomOption.optionRadioButtons([
                                  'No rules exist',
                                  'No one complies with the rules',
                                  'Few users comply with the rules',
                                  'About half the users comply with the rules',
                                  'Most users comply with the rules',
                                  'Almost all users fully comply with the rules'
                                ], true, _response61, setResponse61),
                                const SizedBox(
                                  height: 10,
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
        ),
      );
    }
  }

  void setResponse(String val) {
    setState(() {});
  }

  void setResponse61(String value) async {
    // _response61 = value;
  }

  navigateToPreviousScreen(BuildContext context) {
    Navigator.of(context).pop();
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
          return Screen34(formName: widget.formName);
        },
      ),
    );
  }
}
