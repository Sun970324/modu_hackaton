import 'package:flutter/material.dart';

class AppColors {
  // all colors
  static const moduRed = Color(0xFFB32727);
  static const moduBrightRed = Color(0xFFCD1215);
  static const mcdYellow = Color(0xFFFFBD18);
  static const mcdYellowLight = Color.fromRGBO(255, 190, 24, 0.55);
  static const moduPencilBlack = Color(0xFF323232);
  static const moduTextWhite = Color.fromARGB(255, 240, 240, 240);
  static const whiteTransparent100 = Color.fromRGBO(255, 255, 255, 0.75);
  static const whiteTransparent200 = Color.fromRGBO(255, 255, 255, 0.24);
  static const grey100 = Color(0xFFE9E9E9);
  static const grey200 = Color.fromARGB(232, 222, 221, 221);
  static const grey300 = Color(0xFFA9A9A9);

  // named for usage
  static const darkText = moduPencilBlack;
  static const lightText = moduTextWhite;
  static const basicButton = grey200;
  static const disabled = grey100;
  static const disabledText = grey300;
  static const background = grey100;
  static const buttonSetDefault = whiteTransparent100;
  static const buttonSetOnDarkBgr = whiteTransparent200;
}
