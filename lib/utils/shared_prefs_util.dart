import 'package:billboss/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences> init() async {
    await _instance;
    _prefsInstance = await SharedPreferences.getInstance();
    return _prefsInstance!;
  }

  static Future<bool> clearPreferences() async {
    // var prefs = await _instance;
    bool isCleared = false;
    await _prefsInstance!.clear().then((value) {
      isCleared = true;
    });
    return isCleared;
  }

  static setToken(String? token) async {
    if (token == null) return;
    var prefs = await _instance;
    prefs.setString(CommonStrings.token, token);
  }

  static String? getToken() {
    return _prefsInstance!.getString(CommonStrings.token);
  }
}
