import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../../screens/screen_wrapper.dart';
import 'login_or_register.dart';
class AuthStream extends StatelessWidget {
  const AuthStream({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return const ScreenWrapper();
          }
          else{
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
