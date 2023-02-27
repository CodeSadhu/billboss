import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:invoice_generator/utils/constants.dart';
import 'package:invoice_generator/utils/routes.dart';
import 'package:invoice_generator/utils/shared_prefs_util.dart';

class CommonMethods {
  CommonMethods._();

  static void logoutAndClearData() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    await _googleSignIn.signOut();
    SharedPrefs.clearPreferences();
    // ignore: use_build_context_synchronously
    Navigator.pushNamedAndRemoveUntil(
      rootNavigatorKey.currentContext!,
      AppRoutes.login,
      (route) => false,
    );
  }
}