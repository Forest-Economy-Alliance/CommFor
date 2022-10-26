import 'package:flutter/material.dart';
import 'package:ifri/constants/section_b.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_multi_select.dart';
import 'package:ifri/style/custom_option.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/section_b/screen3.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key, required this.formName}) : super(key: key);
  final String formName;
  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  DatabaseReference? ref;
  String screenName = "screen_2";
  List<String> _response3 = [];
  String _response4 = "";
  bool isLoading = true;

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
        .ref('forms/${userId!}/${widget.formName}/section_b');
    setData();
  }

  void setResponse3(List<String> value) async {
    _response3 = value;
  }

  void setResponse4(String value) async {
    _response4 = value;
  }

  @override
  Widget build(BuildContext context) {
    List<String> reportList = [
      'Community',
      'Private',
      'Government',
      'Other',
    ];
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
                  left: 10.0,
                  right: 10.0,
                  top: 5.0,
                  bottom: 5.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      child: Row(
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
                              SectionB.SECTION_B_SECTION_2,
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
                              const Text(SectionB.SECTION_B_QUESTION_3,
                                  style: CustomStyle.questionTitle),
                              const SizedBox(
                                height: 5,
                              ),
                              MultiSelectChip(
                                reportList: reportList,
                                onSelectionChanged: (selectedList) {
                                  setResponse3(selectedList);
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(SectionB.SECTION_B_QUESTION_4,
                                  style: CustomStyle.questionTitle),
                              const SizedBox(
                                height: 5,
                              ),
                              CustomOption.optionRadioButtons(
                                  const ['Yes', 'No', 'No Rights Defined'],
                                  true,
                                  _response4,
                                  setResponse4),
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
          ),
        ),
      );
    }
  }

  void setData() async {
    final res3 = await ref!
        .child(screenName)
        .child("question_3")
        .child("response")
        .get();

    final res4 = await ref!
        .child(screenName)
        .child("question_4")
        .child("response")
        .get();

    setState(() {
      // _response3 = null == res3.value ? "" : res3.value.toString();
      _response4 = null == res4.value ? "" : res4.value.toString();
      isLoading = false;
    });
  }

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        "question_3": {
          "question": SectionB.SECTION_B_QUESTION_3,
          "response": _response3
        },
        "question_4": {
          "question": SectionB.SECTION_B_QUESTION_4,
          "response": _response4
        }
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return Screen3(formName: widget.formName);
        },
      ),
    );
  }

  navigateToPreviousScreen(BuildContext context) {
    Navigator.of(context).pop();
  }
}
