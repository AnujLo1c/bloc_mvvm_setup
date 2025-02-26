import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthNetwork {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (e) {
      throw Exception("Google SignIn Failed: $e");
    }
  }

  signOutWithGoogle() async {
   try{
      await _auth.signOut();
      await _googleSignIn.signOut();
  }
  catch(e)
  {
  throw Exception("Google SignOut failed $e");
  }
    }
}
