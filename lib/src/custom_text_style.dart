import 'package:flutter/material.dart';

class CustomTextStyle {
  String fontFamily;
  double fontSize;
  Color color;
  double hight;
  double letterSpacing;

  CustomTextStyle({
    this.fontFamily = '',
    this.fontSize = 16,
    this.color = Colors.black,
    this.hight = 0.0,
    this.letterSpacing = 0.0,
  });

  static CustomTextStyle from(TextStyle value) => CustomTextStyle(
        fontFamily: value.fontFamily,
        fontSize: value.fontSize,
        color: value.color,
        hight: value.height,
        letterSpacing: value.letterSpacing,
      );

  static TextStyle to(CustomTextStyle value) => TextStyle(
        fontFamily: value.fontFamily,
        fontSize: value.fontSize,
        height: value.hight,
        letterSpacing: value.letterSpacing,
        color: value.color,
      );
}
