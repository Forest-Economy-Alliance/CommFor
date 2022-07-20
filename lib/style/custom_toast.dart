import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static void showToast(String label) {
    Fluttertoast.showToast(
        msg: label,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black12,
        textColor: Colors.white,
        fontSize: 14.0);
  }
}
