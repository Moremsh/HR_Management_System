import 'package:flutter/material.dart';

class KInputDecorationTheme {
  KInputDecorationTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 20),
    errorMaxLines: 3 ,
    prefixIconColor: Colors.grey ,
    suffixIconColor: Colors.grey ,
    labelStyle: const TextStyle().copyWith(color: Colors.black.withOpacity(0.8) , fontSize: 14),
    hintStyle: const TextStyle().copyWith(color: Colors.black.withOpacity(0.8) , fontSize: 14),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.black.withValues(alpha: 0.8)),
    border: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14) ,
      borderSide: BorderSide(color: Colors.grey.shade500  , width: 1 )
    ),
    enabledBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14) ,
      borderSide: const BorderSide(color: Colors.grey , width: 1 )
    ),
    focusedErrorBorder: OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14) ,
        borderSide: const BorderSide(color: Colors.orange , width: 2 )
    ),
    errorBorder: OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14) ,
        borderSide: const BorderSide(color: Colors.red , width: 1 )
    ),
    focusedBorder: OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14) ,
        borderSide: const BorderSide(color: Colors.black , width: 1 )
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3 ,
    prefixIconColor: Colors.grey ,
    suffixIconColor: Colors.grey ,
    labelStyle: const TextStyle().copyWith(color: Colors.white.withOpacity(0.8), fontSize: 14),
    hintStyle: const TextStyle().copyWith(color: Colors.white.withOpacity(0.8), fontSize: 14),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.white.withValues(alpha: 0.8)),
    border: OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14) ,
        borderSide: const BorderSide(color: Colors.grey , width: 1 )
    ),
    enabledBorder: OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14) ,
        borderSide: const BorderSide(color: Colors.grey , width: 1 )
    ),
    focusedErrorBorder: OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14) ,
        borderSide: const BorderSide(color: Colors.orange , width: 2 )
    ),
    errorBorder: OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14) ,
        borderSide: const BorderSide(color: Colors.red , width: 1 )
    ),
    focusedBorder: OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14) ,
        borderSide: const BorderSide(color: Colors.black , width: 1 )
    ),
  );
}