import 'package:flutter/material.dart';

class CustomTextStyle {
  String fontFamily;
  double fontSize;
  Color color;
  double hight;
  double letterSpacing;

  CustomTextStyle({
    this.fontFamily,
    this.fontSize,
    this.color = Colors.black,
    this.hight = 0.0,
    this.letterSpacing = 0.0
  });
}