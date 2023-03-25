import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:invoice_generator/common_widgets/text_styles.dart';
import 'package:invoice_generator/screens/login/widgets/app_header_widget.dart';
import 'package:invoice_generator/services/firebase_service.dart';
import 'package:invoice_generator/utils/color_palette.dart';
import 'package:invoice_generator/utils/common_methods.dart';
import 'package:invoice_generator/utils/constants.dart';
import 'package:invoice_generator/utils/images.dart';
import 'package:invoice_generator/utils/routes.dart';
import 'package:invoice_generator/utils/strings.dart';
import 'package:invoice_generator/utils/toast.dart';
import 'package:invoice_generator/utils/toast_messages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Size screenSize;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    screenSize = getScreenSize(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: getScaffoldPadding(
          screenSize: screenSize,
        ),
        child: loginPageView(),
      ),
    );
  }

  Widget loginPageView() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppHeaderWidget(
              screenSize: screenSize,
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            buildSignInForm(),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            Text(
              'OR',
              style: appbarStyle(
                screenSize: screenSize,
                color: ColorPalette.buttonTextColor,
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorPalette.tertiaryColor,
                padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.04,
                  vertical: screenSize.height * 0.02,
                ),
              ),
              label: Text(
                'Login with Google',
                style: h3Style(
                  screenSize: screenSize,
                ),
              ),
              icon: Image.asset(
                ImagePath.googleIcon,
                height: screenSize.height * 0.03,
                fit: BoxFit.cover,
              ),
              onPressed: () async {
                await signInWithGoogle();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSignInForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          // decoration: BoxDecoration(
          //   boxShadow: getBoxShadow,
          //   borderRadius: BorderRadius.circular(20),
          //   color: ColorPalette.tertiaryColor,
          // ),
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
            'Login',
            style: h2Style(
              screenSize: screenSize,
            ),
          ),
          onPressed: () async {
            signInWithEmail();
          },
        ),
        SizedBox(
          height: screenSize.height * 0.02,
        ),
        InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, AppRoutes.signup);
          },
          child: RichText(
            text: TextSpan(
              text: 'New to ${CommonStrings.appTitle}? ',
              style: h3Style(
                screenSize: screenSize,
                fontSize: screenSize.height * 0.016,
              ),
              children: [
                TextSpan(
                  text: 'Create an account',
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

  void signInWithEmail() async {
    try {
      UserCredential loginResult =
          await FirebaseService().firebaseAuth.signInWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text,
              );
      if (loginResult.user != null) {
        CommonMethods.openHomePage(id: loginResult.user!.uid);
        print(
            'Registered email and password on Firebase. Using registered email and password to sign in.');
        showToast(
          message:
              'Registered email and password on Firebase. Using registered email and password to sign in.',
          type: ToastType.success,
        );
      }
    } catch (e, stacktrace) {
      if (e is FirebaseAuthException) {
        print(e);
        showToast(message: e.message!.toString(), type: ToastType.error);
      } else if (e is PlatformException) {
        print(e);
      }
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await _googleSignIn.signIn().then((signInDetails) {
        if (signInDetails != null) {
          print('Signed in with google. Auth id: ${signInDetails.id}');
          showToast(
            message: 'Signed in with google. Auth id: ${signInDetails.id}',
            type: ToastType.success,
          );
          CommonMethods.openHomePage(id: signInDetails.id);
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return SnackBar(
                content: Text(
                  CustomToast.googleAuthError,
                  style: h2Style(
                    screenSize: screenSize,
                  ),
                ),
              );
            },
          );
        }
      });
    } catch (e) {
      print('${CustomToast.googleAuthError}: $e');
    }
  }
}
