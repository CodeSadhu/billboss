import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:invoice_generator/common_widgets/text_styles.dart';
import 'package:invoice_generator/utils/color_palette.dart';
import 'package:invoice_generator/utils/common_methods.dart';
import 'package:invoice_generator/utils/constants.dart';
import 'package:invoice_generator/utils/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MainPageState();
}

class _MainPageState extends State<HomePage> {
  late Size screenSize;

  @override
  Widget build(BuildContext context) {
    screenSize = getScreenSize(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          screenSize.height * appBarSize,
        ),
        child: AppBar(
          backgroundColor: ColorPalette.pinkBlush,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          toolbarHeight: screenSize.height * appBarSize,
          title: Text(
            CommonStrings.appTitle,
            style: h1Style(
              screenSize: screenSize,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            CommonMethods.logoutAndClearData();
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade600),
          child: Text(
            'Sign out',
            style: h2Style(
              screenSize: screenSize,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
