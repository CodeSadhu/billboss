import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:invoice_generator/common_widgets/text_styles.dart';
import 'package:invoice_generator/screens/home_page.dart';
import 'package:invoice_generator/utils/constants.dart';
import 'package:invoice_generator/utils/shared_prefs_util.dart';
import 'package:invoice_generator/utils/strings.dart';
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
          child: ElevatedButton(
            child: Text(
              CommonStrings.signInWithGoogle,
              style: h1Style(
                screenSize: screenSize,
              ),
            ),
            onPressed: () async {
              try {
                await _googleSignIn.signIn().then((signInDetails) {
                  if (signInDetails != null) {
                    print(
                        'Signed in with google. Auth id: ${signInDetails.id}');
                    SharedPrefs.setToken(signInDetails.id);
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const HomePage(),
                    //   ),
                    // );
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
            },
          ),
        ),
      ),
    );
  }
}
