import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:billboss/firebase_options.dart';

class FirebaseService {
  FirebaseService._();

  static final FirebaseService firebaseService = FirebaseService._();
  late FirebaseAuth _firebaseAuthInstance;

  factory FirebaseService() {
    return firebaseService;
  }

  FirebaseAuth get firebaseAuth => _firebaseAuthInstance;

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).then((value) {
      FirebaseAuth.instance.authStateChanges().listen(authStateChangeListener);
      FirebaseAuth.instance.idTokenChanges().listen(idTokenChangeListener);
      _firebaseAuthInstance = FirebaseAuth.instance;
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
