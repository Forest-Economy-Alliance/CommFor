import 'package:flutter/material.dart';
import 'package:ifri/constants/section_b.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_option.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/section_b/screen8.dart';

class Screen7 extends StatelessWidget {
  const Screen7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        SectionB.SECTION_B_SECTION_4,
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
                          const Text(SectionB.SECTION_B_QUESTION_9,
                              style: CustomStyle.questionTitle),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Local Name", style: CustomStyle.form),
                          const SizedBox(
                            height: 15,
                          ),
                          const TextField(
                              style: CustomStyle.form,
                              textAlign: TextAlign.start,
                              decoration: CustomStyle.answerInputDecoration),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Bot. Name", style: CustomStyle.form),
                          const SizedBox(
                            height: 15,
                          ),
                          const TextField(
                              style: CustomStyle.form,
                              textAlign: TextAlign.start,
                              decoration: CustomStyle.answerInputDecoration),
                          const SizedBox(
                            height: 15,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    child: Text("Self-Consumption",
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButton(),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    child: Text("Market Sale",
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButton(),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () => navigateToNextScreen(context),
                            splashColor: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(2),
                            child: CustomButton.uploadPictureButton),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () => navigateToNextScreen(context),
                            splashColor: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(2),
                            child: CustomButton.nextButton),
                      ],
                    ),
                    const SizedBox(
                      height: 200,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const Screen8();
        },
      ),
    );
  }
}
