import 'package:flutter/material.dart';
import 'package:ifri/constants/section_b.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_option.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/ui/section_b/screen11.dart';

class Screen10 extends StatelessWidget {
  const Screen10({Key? key}) : super(key: key);

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
                    children: const [
                      Text(SectionB.SECTION_B_QUESTION_12,
                          style: CustomStyle.questionTitle),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 250,
                  child: Row(children: [
                    const SizedBox(
                        width: 75,
                        child: Text("Timber", style: CustomStyle.answer)),
                    const SizedBox(width: 2),
                    const VerticalDivider(
                      color: Color(0xffD1D0BD),
                      thickness: 0.5,
                    ),
                    const SizedBox(width: 2),
                    Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("HH – Self consumption",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("HH – Market sale",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("Price per unit",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("Collection by other sites",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("Harvesting rights of other sites",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                      ],
                    )
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 250,
                  child: Row(children: [
                    const SizedBox(
                        width: 75,
                        child: Text("Fuelwood", style: CustomStyle.answer)),
                    const SizedBox(width: 2),
                    const VerticalDivider(
                      color: Color(0xffD1D0BD),
                      thickness: 0.5,
                    ),
                    const SizedBox(width: 2),
                    Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("HH – Self consumption",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("HH – Market sale",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("Price per unit",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("Collection by other sites",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("Harvesting rights of other sites",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                      ],
                    )
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 250,
                  child: Row(children: [
                    const SizedBox(
                        width: 75,
                        child: Text("Grazing", style: CustomStyle.answer)),
                    const SizedBox(width: 2),
                    const VerticalDivider(
                      color: Color(0xffD1D0BD),
                      thickness: 0.5,
                    ),
                    const SizedBox(width: 2),
                    Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("HH – Self consumption",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("HH – Market sale",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("Price per unit",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("Collection by other sites",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("Harvesting rights of other sites",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                      ],
                    )
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 250,
                  child: Row(children: [
                    const SizedBox(
                        width: 75,
                        child: Text("Seasonal Forest Products",
                            style: CustomStyle.answer)),
                    const SizedBox(width: 2),
                    const VerticalDivider(
                      color: Color(0xffD1D0BD),
                      thickness: 0.5,
                    ),
                    const SizedBox(width: 2),
                    Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("HH – Self consumption",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("HH – Market sale",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("Price per unit",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("Collection by other sites",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("Harvesting rights of other sites",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                      ],
                    )
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 250,
                  child: Row(children: [
                    const SizedBox(
                        width: 75,
                        child: Text("Wildlife", style: CustomStyle.answer)),
                    const SizedBox(width: 2),
                    const VerticalDivider(
                      color: Color(0xffD1D0BD),
                      thickness: 0.5,
                    ),
                    const SizedBox(width: 2),
                    Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("HH – Self consumption",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("HH – Market sale",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("Price per unit",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("Collection by other sites",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("Harvesting rights of other sites",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                      ],
                    )
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 250,
                  child: Row(children: [
                    const SizedBox(
                        width: 75,
                        child: Text("Other", style: CustomStyle.answer)),
                    const SizedBox(width: 2),
                    const VerticalDivider(
                      color: Color(0xffD1D0BD),
                      thickness: 0.5,
                    ),
                    const SizedBox(width: 2),
                    Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("HH – Self consumption",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("HH – Market sale",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("Price per unit",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("Collection by other sites",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 125,
                              height: 50,
                              child: Text("Harvesting rights of other sites",
                                  style: CustomStyle.answer),
                            ),
                            CustomOption.yesNoButton(),
                          ],
                        ),
                      ],
                    )
                  ]),
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
          return const Screen11();
        },
      ),
    );
  }
}
