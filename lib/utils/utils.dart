import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
  static flutterToast(String msg){
    Fluttertoast.showToast(msg: msg,toastLength: Toast.LENGTH_LONG,
    backgroundColor: Colors.black,textColor: Colors.white);
  }
}