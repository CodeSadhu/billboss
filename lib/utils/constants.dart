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
      color: Colors.grey.withOpacity(0.5),
      blurRadius: 5,
      // spreadRadius: 10,
    ),
  ];
}
