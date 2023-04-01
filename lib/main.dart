import 'package:flutter/material.dart';
import 'package:billboss/screens/form/form.dart';
import 'package:billboss/screens/home/home_page.dart';
import 'package:billboss/screens/login/login_page.dart';
import 'package:billboss/screens/login/signup_page.dart';
import 'package:billboss/services/firebase_service.dart';
import 'package:billboss/utils/color_palette.dart';
import 'package:billboss/utils/constants.dart';
import 'package:billboss/utils/routes.dart';
import 'package:billboss/utils/shared_prefs_util.dart';
import 'package:billboss/utils/strings.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseService().initializeFirebase();

  await SharedPrefs.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var token;

  @override
  void initState() {
    super.initState();
    token = SharedPrefs.getToken();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1920,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(480, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
        background: Container(
          color: Colors.white,
        ),
      ),
      title: CommonStrings.appTitle,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorPalette.primaryBackgroundColor,
        cardColor: ColorPalette.buttonTextColor,
        primaryColor: ColorPalette.secondaryColor,
        fontFamily: appFont,
        useMaterial3: true,
      ),
      navigatorKey: rootNavigatorKey,
      home: token != null ? const HomePage() : const LoginPage(),
      routes: {
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.login: (context) => const LoginPage(),
        AppRoutes.signup: (context) => const SignUpPage(),
        AppRoutes.form: (context) => const FormWidget(),
      },
    );
  }
}
