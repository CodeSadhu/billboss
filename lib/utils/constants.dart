import 'package:flutter/material.dart';
import 'package:invoice_generator/services/firebase_service.dart';
import 'package:invoice_generator/utils/color_palette.dart';

GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

const double appBarSize = 0.07;

const String appFont = 'Poppins';

FirebaseService firebaseService = FirebaseService();

Size getScreenSize(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return size;
}

List<BoxShadow> get getBoxShadow {
  return [
    BoxShadow(
      color: ColorPalette.black.withOpacity(0.25),
      blurRadius: 5,
      // spreadRadius: 10,
    ),
  ];
}

EdgeInsets getScaffoldPadding({
  required Size screenSize,
}) {
  return EdgeInsets.symmetric(
    vertical: screenSize.height * 0.02,
    horizontal: screenSize.width * 0.04,
  );
}
