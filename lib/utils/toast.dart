import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/color_palette.dart';
import 'package:invoice_generator/utils/constants.dart';
import 'package:invoice_generator/utils/strings.dart';

enum ToastType {
  info,
  error,
  warning,
  success,
}

Color getToastColor(ToastType type) {
  if (type == ToastType.error) {
    return ColorPalette.errorRed;
  } else {
    return ColorPalette.successGreen;
  }
}

String getToastTitle(ToastType type) {
  if (type == ToastType.error) {
    return CommonStrings.error;
  } else {
    return CommonStrings.success;
  }
}

void showToast({
  required String message,
  required ToastType type,
}) {
  // if (rootNavigatorKey.currentContext != null) {
  Flushbar(
    borderRadius: BorderRadius.circular(20),
    backgroundColor: ColorPalette.buttonTextColor,
    flushbarPosition: FlushbarPosition.BOTTOM,
    message: message,
    messageColor: getToastColor(type),
    messageSize: 16,
    duration: const Duration(
      milliseconds: 2000,
    ),
    animationDuration: const Duration(milliseconds: 500),
    forwardAnimationCurve: Curves.easeInOut,
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    leftBarIndicatorColor: getToastColor(type),
    titleColor: getToastColor(type),
    title: getToastTitle(type),
    titleSize: 20,
    flushbarStyle: FlushbarStyle.FLOATING,
    margin: const EdgeInsets.only(
      bottom: 20,
      left: 20,
      right: 20,
    ),
  ).show(rootNavigatorKey.currentContext!);

  // }
}
