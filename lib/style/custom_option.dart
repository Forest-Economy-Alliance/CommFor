import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:ifri/style/custom_style.dart';

class CustomOption {
  static CustomRadioButton optionRadioButton(
      List<String> labels, bool isVertical) {
    return CustomRadioButton(
      elevation: 0,
      absoluteZeroSpacing: false,
      radioButtonValue: (value) {},
      buttonLables: labels,
      buttonValues: labels,
      enableShape: true,
      horizontal: isVertical,
      buttonTextStyle: const ButtonTextStyle(
          selectedColor: Color(0xFF12160F),
          unSelectedColor: Color(0xffD1D0BD),
          textStyle: CustomStyle.answer),
      unSelectedColor: const Color(0xFF12160F),
      selectedColor: const Color(0xffD1D0BD),
      unSelectedBorderColor: Colors.transparent,
      selectedBorderColor: Colors.transparent,
    );
  }

  static CustomRadioButton yesNoButton() {
    return CustomRadioButton(
      elevation: 0,
      absoluteZeroSpacing: false,
      radioButtonValue: (value) {},
      buttonLables: const ['Yes', 'No'],
      buttonValues: const ['Yes', 'No'],
      enableShape: true,
      horizontal: false,
      width: 60,
      buttonTextStyle: const ButtonTextStyle(
          selectedColor: Color(0xFF12160F),
          unSelectedColor: Color(0xffD1D0BD),
          textStyle: CustomStyle.answer),
      unSelectedColor: const Color(0xFF12160F),
      selectedColor: const Color(0xffD1D0BD),
      unSelectedBorderColor: Colors.transparent,
      selectedBorderColor: Colors.transparent,
    );
  }
}
