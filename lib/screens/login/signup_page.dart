import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:invoice_generator/common_widgets/text_styles.dart';
import 'package:invoice_generator/screens/login/widgets/app_header_widget.dart';
import 'package:invoice_generator/services/firebase_service.dart';
import 'package:invoice_generator/utils/color_palette.dart';
import 'package:invoice_generator/utils/common_methods.dart';
import 'package:invoice_generator/utils/constants.dart';
import 'package:invoice_generator/utils/routes.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late Size screenSize;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void registerEmailAndPassword() async {
    try {
      UserCredential loginResult =
          await FirebaseService().firebaseAuth.createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text,
              );
      if (loginResult.user != null) {
        CommonMethods.openHomePage(id: loginResult.user!.uid);
        print(
            'Registered email and password on Firebase. Using registered email and password to sign in.');
      }
    } catch (e, stacktrace) {
      if (e is FirebaseAuthException) {
        print(e);
      }
    }
  }

  Widget buildRegisterForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: getBoxShadow,
            borderRadius: BorderRadius.circular(20),
            color: ColorPalette.tertiaryColor,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.02,
            vertical: screenSize.height * 0.01,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: outlineTextfieldDecoration(
                  screenSize: screenSize,
                  fillColor: ColorPalette.buttonTextColor,
                  filled: true,
                  hintText: 'Enter email',
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: outlineTextfieldDecoration(
                  screenSize: screenSize,
                  fillColor: ColorPalette.buttonTextColor,
                  filled: true,
                  hintText: 'Enter password',
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: screenSize.height * 0.02,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorPalette.tertiaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            fixedSize: Size.fromWidth(screenSize.width),
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.08,
              vertical: screenSize.height * 0.02,
            ),
          ),
          child: Text(
            'Create Account',
            style: h2Style(
              screenSize: screenSize,
            ),
          ),
          onPressed: () async {
            registerEmailAndPassword();
          },
        ),
        SizedBox(
          height: screenSize.height * 0.02,
        ),
        InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          },
          child: RichText(
            text: TextSpan(
              text: 'Already have an account? ',
              style: h3Style(
                screenSize: screenSize,
                fontSize: screenSize.height * 0.016,
              ),
              children: [
                TextSpan(
                  text: 'Log in',
                  style: h3Style(
                    screenSize: screenSize,
                    color: ColorPalette.blue,
                    textDecoration: TextDecoration.underline,
                    fontSize: screenSize.height * 0.016,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPalette.primaryBackgroundColor,
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: getScaffoldPadding(
          screenSize: screenSize,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppHeaderWidget(
                  screenSize: screenSize,
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                buildRegisterForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
