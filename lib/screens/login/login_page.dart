import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:invoice_generator/common_widgets/text_styles.dart';
import 'package:invoice_generator/utils/color_palette.dart';
import 'package:invoice_generator/utils/constants.dart';
import 'package:invoice_generator/utils/images.dart';
import 'package:invoice_generator/utils/shared_prefs_util.dart';
import 'package:invoice_generator/utils/svg_paths.dart';
import 'package:invoice_generator/utils/toast_messages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Size screenSize;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    screenSize = getScreenSize(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: screenSize.height * 0.02,
          horizontal: screenSize.width * 0.04,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                SvgPath.invoiceGraphic,
                height: screenSize.height * 0.2,
              ),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              Text(
                'Invoice Generator',
                style: h2Style(
                  screenSize: screenSize,
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
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    try {
      await _googleSignIn.signIn().then((signInDetails) {
        if (signInDetails != null) {
          print('Signed in with google. Auth id: ${signInDetails.id}');
          SharedPrefs.setToken(signInDetails.id);
          Navigator.pushReplacementNamed(context, '/home');
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
