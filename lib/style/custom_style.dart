import 'package:flutter/material.dart';

class CustomStyle {
  static const TextStyle screenTitle = TextStyle(
      fontFamily: 'HelveticaNeue', fontSize: 18, color: Color(0xffD1D0BD));

  static const TextStyle questionTitle = TextStyle(
      fontFamily: 'HelveticaNeue', fontSize: 16, color: Color(0xffD1D0BD));

  static const TextStyle answer = TextStyle(
      fontFamily: 'HelveticaNeue', fontSize: 16, color: Color(0xffD1D0BD));

  static const TextStyle form = TextStyle(
      fontFamily: 'HelveticaNeue', fontSize: 15, color: Color(0xffD1D0BD));

  static const TextStyle optionYesNo = TextStyle(
      fontFamily: 'HelveticaNeue', fontSize: 14, color: Color(0xffD1D0BD));

  static const InputDecoration answerInputDecoration = InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffD1D0BD), width: 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffD1D0BD), width: 1.0),
    ),
    contentPadding:
        EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
  );
}
