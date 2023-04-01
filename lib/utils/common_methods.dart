import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:billboss/utils/constants.dart';
import 'package:billboss/utils/routes.dart';
import 'package:billboss/utils/shared_prefs_util.dart';

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

  static bool isMobilePlatform() {
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.fuchsia) {
      return true;
    } else {
      return false;
    }
  }

  static void openHomePage({required dynamic id}) {
    SharedPrefs.setToken(id.toString());
    Navigator.pushReplacementNamed(
      rootNavigatorKey.currentContext!,
      AppRoutes.home,
    );
  }
}
