import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:invoice_generator/firebase_options.dart';

class FirebaseService {
  FirebaseService._();

  static final FirebaseService firebaseService = FirebaseService._();
  factory FirebaseService() {
    return firebaseService;
  }

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).then((value) {
      FirebaseAuth.instance.authStateChanges().listen(authStateChangeListener);
      FirebaseAuth.instance.idTokenChanges().listen(idTokenChangeListener);
    });
    // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }

  void idTokenChangeListener(User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  }

  void authStateChangeListener(User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  }
}
