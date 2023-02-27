import 'package:flutter/material.dart';
import 'package:invoice_generator/screens/home_page.dart';
import 'package:invoice_generator/screens/login_page.dart';
import 'package:invoice_generator/utils/constants.dart';
import 'package:invoice_generator/utils/routes.dart';
import 'package:invoice_generator/utils/shared_prefs_util.dart';
import 'package:invoice_generator/utils/strings.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefs.init();

  firebaseService.initializeFirebase();

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
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1200,
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
        primarySwatch: Colors.blue,
        fontFamily: appFont,
      ),
      navigatorKey: rootNavigatorKey,
      home: token != null ? const HomePage() : const LoginPage(),
      routes: {
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.login: (context) => const LoginPage(),
      },
    );
  }
}
