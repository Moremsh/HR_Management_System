import 'package:flutter/material.dart';

class KElevatedBtnTheme{
  KElevatedBtnTheme._();

  static ElevatedButtonThemeData lightElevatedTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0 ,
      foregroundColor: Colors.white.withOpacity(0.9),
      backgroundColor: Color(0XFF1C4D8D),
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      side: const BorderSide(color:Color(0XFF1C4D8D)),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16 , fontWeight: FontWeight.w600 , color: Colors.white),
    )
  );

  static ElevatedButtonThemeData darkElevatedTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0 ,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: const BorderSide(color: Colors.blue),
        padding: const EdgeInsets.symmetric(vertical: 18),
        textStyle: const TextStyle(fontSize: 16 , fontWeight: FontWeight.w600 , color: Colors.white),
      )
  );
}