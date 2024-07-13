import 'package:flutter/material.dart';

import '../../screens/authentication/login_page.dart';
import '../../screens/authentication/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;
  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(
        onTap: (){
          setState(() {
            togglePages();
          });
        },
      );
    }
    else{
      return RegisterPage(
        onTap: (){
          setState(() {
            togglePages();
          });
        },
      );
    }
  }
}
