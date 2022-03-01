import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "barry.allen@example.com",
          password: "SuperSecretPassword!"
      );
      final User? user = userCredential.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign in with email and password


// register with email and password

// sign out

}