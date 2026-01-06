import 'package:flutter/material.dart';

class KOutlinedBtnTheme {
  KOutlinedBtnTheme._();

  static OutlinedButtonThemeData lightOutlinedTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0 ,
      foregroundColor: Colors.black,
      side: const BorderSide(color: Colors.grey),
      textStyle: const TextStyle(fontSize: 16 , fontWeight: FontWeight.w600 , color: Colors.black),
      padding: const EdgeInsets.symmetric(vertical: 16 , horizontal: 20 ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    )
  );

  static OutlinedButtonThemeData darkOutlinedTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0 ,
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.grey),
        textStyle: const TextStyle(fontSize: 16 , fontWeight: FontWeight.w600 , color: Colors.white),
        padding: const EdgeInsets.symmetric(vertical: 16 , horizontal: 20 ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      )
  );
}