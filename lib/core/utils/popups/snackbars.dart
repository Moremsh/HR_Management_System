import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SnackBars{

  SnackbarController successSnack(String message , String title){
    return  Get.snackbar(
      padding: EdgeInsets.all(10),
      title,
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white70,
    );
  }

  SnackbarController errorSnack(String message , String title){
    return Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  SnackbarController warningSnack(String message , String title){
    return Get.snackbar(
      title,
      message,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
    );
  }
}