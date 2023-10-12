import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String host = "localhost";

  signUpWithEmail({required String email, required String password}) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  signInWithEmail({required String email, required String password}) async {
    // _callFirebaseEmulator();
    await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future signOut() async {
    return await _auth.signOut();
  }

  // void _callFirebaseEmulator() {
  //   _auth.useAuthEmulator(host, 8080);
  // }
}