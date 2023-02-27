import 'package:flutter/material.dart';
import 'package:invoice_generator/services/firebase_service.dart';

GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

const double appBarSize = 0.07;

const String appFont = 'Poppins';

FirebaseService firebaseService = FirebaseService();

Size getScreenSize(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return size;
}
