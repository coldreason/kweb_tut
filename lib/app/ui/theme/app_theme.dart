import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

ThemeData recipleTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: recipleOrange,
  textTheme: TextTheme(
    headline1: NotoSansKR.getTextStyle(const TextStyle(
        fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold)),
    bodyText1: NotoSansKR.getTextStyle(const TextStyle(
        fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal)),
    bodyText2: NotoSansKR.getTextStyle(const TextStyle(
        fontSize: 14, color: Colors.black, fontWeight: FontWeight.normal)),
    button: NotoSansKR.getTextStyle(const TextStyle(
        fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
    caption: NotoSansKR.getTextStyle(const TextStyle(
      fontSize: 12,
      color: recipleOrange,
      fontWeight: FontWeight.w400,
    )),
  ),
);