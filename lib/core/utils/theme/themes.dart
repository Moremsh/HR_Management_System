import 'package:flutter/material.dart';
import 'custom_themes/appbar_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/elevatedbtn_theme.dart';
import 'custom_themes/inputdecoration_theme.dart';
import 'custom_themes/outlinedbtn_theme.dart';

class KAppThemes {
  KAppThemes._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true ,
    fontFamily: 'Poppins',
    primaryColor: Colors.blue,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: KElevatedBtnTheme.lightElevatedTheme,
    appBarTheme: KAppBarTheme.lightAppBarTheme,
    checkboxTheme: KCheckBoxTheme.lightCheckBoxTheme ,
    outlinedButtonTheme: KOutlinedBtnTheme.lightOutlinedTheme,
    inputDecorationTheme: KInputDecorationTheme.lightInputDecorationTheme
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true ,
    fontFamily: 'Poppins',
    primaryColor: Colors.blue,
    brightness: Brightness.dark,
    elevatedButtonTheme: KElevatedBtnTheme.darkElevatedTheme,
    appBarTheme: KAppBarTheme.darkAppBarTheme,
    checkboxTheme: KCheckBoxTheme.darkCheckBoxTheme ,
    outlinedButtonTheme: KOutlinedBtnTheme.darkOutlinedTheme,
    inputDecorationTheme: KInputDecorationTheme.darkInputDecorationTheme

  );
}