import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthServices{

  //Sign In with Email and Password
  Future signUserIn(TextEditingController email, TextEditingController password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);

  }

  // SignUp with email and Password
  Future<void> signUserUp(TextEditingController email, TextEditingController password) async {

    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);
  }

  //Signout
  signUserOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }
  //Sign In with Google
  signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleSignInAuthentication = await googleSignInAccount?.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication!.idToken,
      accessToken: googleSignInAuthentication.accessToken
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}