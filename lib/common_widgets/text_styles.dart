import 'package:flutter/material.dart';

TextStyle h1Style({
  required Size screenSize,
  Color? color,
  Size? fontSize,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontSize: screenSize.height * 0.024,
    color: color ?? Colors.black,
    fontWeight: fontWeight ?? FontWeight.w600,
  );
}

TextStyle h2Style({
  required Size screenSize,
  Color? color,
  Size? fontSize,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontSize: screenSize.height * 0.022,
    color: color ?? Colors.black,
    fontWeight: fontWeight ?? FontWeight.w500,
  );
}

TextStyle h3Style({
  required Size screenSize,
  Color? color,
  Size? fontSize,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontSize: screenSize.height * 0.02,
    color: color ?? Colors.black,
    fontWeight: fontWeight ?? FontWeight.w400,
  );
}
