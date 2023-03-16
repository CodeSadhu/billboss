import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/color_palette.dart';

TextStyle h1Style({
  required Size screenSize,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontSize: fontSize ?? screenSize.height * 0.024,
    color: color ?? ColorPalette.buttonTextColor,
    fontWeight: fontWeight ?? FontWeight.w600,
  );
}

TextStyle h2Style({
  required Size screenSize,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontSize: screenSize.height * 0.022,
    color: color ?? ColorPalette.buttonTextColor,
    fontWeight: fontWeight ?? FontWeight.w500,
  );
}

TextStyle h3Style({
  required Size screenSize,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontSize: screenSize.height * 0.02,
    color: color ?? ColorPalette.buttonTextColor,
    fontWeight: fontWeight ?? FontWeight.w400,
  );
}
