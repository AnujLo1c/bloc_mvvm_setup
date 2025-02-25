

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../Theme/r.dart';

class Utils {

  static toastMessage(String message){
    Fluttertoast.showToast(
      msg: message ,
      backgroundColor: R.colors.secondary,
      textColor: Colors.black,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,


    );
  }


  static toastMessageCenter(String message){
    Fluttertoast.showToast(
      msg: message ,
      backgroundColor: R.colors.secondary,
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_LONG,
      textColor: Colors.black,
    );
  }

  static snackBar(String title, String message){
    Get.snackbar(
      title,
      message ,
    );
  }
}