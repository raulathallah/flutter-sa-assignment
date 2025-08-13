import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void customToast(String msg) {
  Fluttertoast.showToast(
    msg: "Profile saved!",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black87,
    textColor: Colors.white,
    fontSize: 14.0,
  );
}
