import 'package:flutter/material.dart';

class KAppBarTheme{
  KAppBarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    elevation: 0 ,
    centerTitle: false ,
    backgroundColor: Colors.transparent ,
    surfaceTintColor: Colors.transparent ,
    scrolledUnderElevation:  0 ,
    iconTheme: IconThemeData(color: Colors.black , size: 24 ),
    actionsIconTheme: IconThemeData(color: Colors.black , size: 24 ),
    titleTextStyle: TextStyle(fontSize: 18 , color: Colors.black , fontWeight: FontWeight.w600),
  );

  static AppBarTheme darkAppBarTheme = AppBarTheme(
    elevation: 0 ,
    centerTitle: false ,
    backgroundColor: Colors.transparent ,
    surfaceTintColor: Colors.transparent ,
    scrolledUnderElevation:  0 ,
    iconTheme: IconThemeData(color: Colors.white , size: 24 ),
    actionsIconTheme: IconThemeData(color: Colors.white , size: 24 ),
    titleTextStyle: TextStyle(fontSize: 18 , color: Colors.white , fontWeight: FontWeight.w600),
  );
}