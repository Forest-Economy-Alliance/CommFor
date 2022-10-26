import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/section_c.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_multi_select.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:ifri/ui/section_c/screen21.dart';
import 'package:provider/provider.dart';

class Screen20 extends StatefulWidget {
  const Screen20({Key? key, required this.formName}) : super(key: key);
  final String formName;
  @override
  State<Screen20> createState() => _Screen20State();
}

class _Screen20State extends State<Screen20> {
  DatabaseReference? ref;
  TextEditingController question22aController = TextEditingController();
  TextEditingController question22bController = TextEditingController();
  TextEditingController question23Controller = TextEditingController();
  List<String> _response = [];
  String screenName = "screen_20";
  bool isLoading = true;
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

  void setResponse(List<String> value) async {
    _response = value;
  }

  @override
  Widget build(BuildContext context) {
    List<String> reportList = [
      SectionC.SECTION_C_QUESTION_39_OPTION_1,
      SectionC.SECTION_C_QUESTION_39_OPTION_2,
      SectionC.SECTION_C_QUESTION_39_OPTION_3,
      SectionC.SECTION_C_QUESTION_39_OPTION_4,
      SectionC.SECTION_C_QUESTION_39_OPTION_5,
      SectionC.SECTION_C_QUESTION_39_OPTION_6,
      SectionC.SECTION_C_QUESTION_39_OPTION_7,
      SectionC.SECTION_C_QUESTION_39_OPTION_8,
      SectionC.SECTION_C_QUESTION_39_OPTION_9,
    ];
    if (isLoading) {
      return Container();
    } else {
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
                            SectionC.SECTION_C_SECTION_6,
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
                          const Text(SectionC.SECTION_C_QUESTION_39,
                              style: CustomStyle.questionTitle),
                          const SizedBox(
                            height: 20,
                          ),
                          MultiSelectChip(
                            reportList: reportList,
                            onSelectionChanged: (selectedList) {
                              setResponse(selectedList);
                            },
                          ),
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
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return Screen21(formName: widget.formName);
        },
      ),
    );
  }

  void setData() async {
    ref!
        .child(screenName)
        .child("question_39")
        .child("response")
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
      } else {
        print('No data available');
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  navigateToPreviousScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        "question_39": {
          "question": SectionC.SECTION_C_QUESTION_39,
          "response": {}
        },
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }
}
