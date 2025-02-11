import 'package:flutter/material.dart';

class AppFonts {
  AppFonts._();


  static TextStyle bold(double size, [Color? color]) {
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto',
    );
  }

  

  static TextStyle medium(double size, [Color? color]) {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,

    );
  }

  static TextStyle regular(double size, [Color? color]) {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,

    );
  }
}