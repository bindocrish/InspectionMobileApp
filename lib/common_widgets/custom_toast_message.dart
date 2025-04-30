import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToaster {
  static Future successToasterMsg(String message) async {

    return Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor:  Colors.yellow,
        fontSize: 16.0);
  }

  static Future errorToasterMessage(String message) async {

    return Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor:  Colors.red,

        textColor: Colors.black,
        fontSize: 16.0);
  }
}


