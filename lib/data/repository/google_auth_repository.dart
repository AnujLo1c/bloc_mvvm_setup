import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import '../network/google_auth_service.dart';


class GoogleAuthRepository {
  final GoogleAuthNetwork _googleAuthNetwork = GoogleAuthNetwork();

  Future<User?> signInWithGoogle() async {
    try {
      UserCredential? userCredential = await _googleAuthNetwork.signInWithGoogle();
      // print(userCredential);
      return userCredential?.user;
    } catch (e) {
      throw Exception("Authentication Error: $e");
    }
  }
   signOutWithGoogle() async{

  await _googleAuthNetwork.signOutWithGoogle();


  }
}
