import 'package:flutter/material.dart';
import 'package:billboss/utils/color_palette.dart';
import 'package:billboss/utils/constants.dart';
import 'package:billboss/utils/strings.dart';

TextStyle appbarStyle({
  required Size screenSize,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontSize: fontSize ?? screenSize.height * 0.028,
    color: color ?? ColorPalette.buttonTextColor,
    fontWeight: fontWeight ?? FontWeight.w600,
  );
}

TextStyle h1Style({
  required Size screenSize,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  TextDecoration? textDecoration,
  String? fontFamily,
}) {
  return TextStyle(
    fontSize: fontSize ?? fontSize ?? screenSize.height * 0.024,
    color: color ?? ColorPalette.buttonTextColor,
    fontWeight: fontWeight ?? FontWeight.w600,
    fontStyle: fontStyle,
    decoration: textDecoration,
    fontFamily: fontFamily ?? appFont,
  );
}

TextStyle h2Style({
  required Size screenSize,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  TextDecoration? textDecoration,
  String? fontFamily,
}) {
  return TextStyle(
    fontSize: fontSize ?? screenSize.height * 0.022,
    color: color ?? ColorPalette.buttonTextColor,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontStyle: fontStyle,
    decoration: textDecoration,
    fontFamily: fontFamily ?? appFont,
  );
}

TextStyle h3Style({
  required Size screenSize,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  TextDecoration? textDecoration,
  String? fontFamily,
}) {
  return TextStyle(
    fontSize: fontSize ?? screenSize.height * 0.02,
    color: color ?? ColorPalette.buttonTextColor,
    fontWeight: fontWeight ?? FontWeight.w400,
    fontStyle: fontStyle,
    decoration: textDecoration,
    fontFamily: fontFamily ?? appFont,
  );
}

InputDecoration outlineTextfieldDecoration({
  required Size screenSize,
  String? hintText,
  TextStyle? hintStyle,
  bool? filled,
  Color? fillColor,
}) {
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    filled: filled,
    fillColor: fillColor,
    contentPadding: EdgeInsets.symmetric(
      horizontal: screenSize.width * 0.04,
      vertical: screenSize.height * 0.02,
    ),
    hintText: hintText,
    hintStyle: hintStyle,
  );
}
