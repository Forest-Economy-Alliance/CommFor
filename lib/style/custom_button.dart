import 'package:flutter/material.dart';

class CustomButton {
  static Container nextButton = Container(
    width: 130,
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    padding:
        const EdgeInsets.only(bottom: 10.0, top: 10.0, left: 25.0, right: 25.0),
    decoration: BoxDecoration(
      color: const Color(0xffD1D0BD),
      border: Border.all(
        color: const Color(0xffD1D0BD),
        style: BorderStyle.solid,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: const Text(
      'Next',
      style: TextStyle(fontSize: 16, color: Color(0xFF12160F)),
      textAlign: TextAlign.center,
    ),
  );

  static Container submitButton = Container(
    width: 130,
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    padding:
        const EdgeInsets.only(bottom: 10.0, top: 10.0, left: 25.0, right: 25.0),
    decoration: BoxDecoration(
      color: const Color(0xffD1D0BD),
      border: Border.all(
        color: const Color(0xffD1D0BD),
        style: BorderStyle.solid,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: const Text(
      'Submit',
      style: TextStyle(fontSize: 16, color: Color(0xFF12160F)),
      textAlign: TextAlign.center,
    ),
  );

  static Container uploadPictureButton = Container(
    width: 150,
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    padding:
        const EdgeInsets.only(bottom: 10.0, top: 10.0, left: 25.0, right: 25.0),
    decoration: BoxDecoration(
      color: const Color(0xffD1D0BD),
      border: Border.all(
        color: const Color(0xffD1D0BD),
        style: BorderStyle.solid,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: const Text(
      'Upload Picture',
      style: TextStyle(fontSize: 12, color: Color(0xFF12160F)),
      textAlign: TextAlign.center,
    ),
  );

  static Container addMoreButton = Container(
    width: 150,
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    padding:
        const EdgeInsets.only(bottom: 12.0, top: 12.0, left: 30.0, right: 30.0),
    decoration: BoxDecoration(
      color: const Color(0xffD1D0BD),
      border: Border.all(
        color: const Color(0xffD1D0BD),
        style: BorderStyle.solid,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: const Text(
      'Add More',
      style: TextStyle(fontSize: 16, color: Color(0xFF12160F)),
      textAlign: TextAlign.center,
    ),
  );

  static Container custom(String s) => Container(
        width: 200,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        padding: const EdgeInsets.only(
            bottom: 12.0, top: 12.0, left: 30.0, right: 30.0),
        decoration: BoxDecoration(
          color: const Color(0xffD1D0BD),
          border: Border.all(
            color: const Color(0xffD1D0BD),
            style: BorderStyle.solid,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          s,
          style: const TextStyle(fontSize: 16, color: Color(0xFF12160F)),
          textAlign: TextAlign.center,
        ),
      );
}
