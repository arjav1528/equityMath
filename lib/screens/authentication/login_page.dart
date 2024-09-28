// ignore_for_file: prefer_const_constructors, no_logic_in_create_state

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/authentication/auth_services.dart';
class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});
  @override
  State<LoginPage> createState() => _LoginPageState(onTap: onTap);
}

class _LoginPageState extends State<LoginPage> {
  final Function()? onTap;
  _LoginPageState({required this.onTap});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,

          color: Colors.grey[300],
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.098039216,),
              const Icon(Icons.lock,size: 100,),
              SizedBox(height: height * 0.006535948 ,),
              Text('Welcome Back',style: GoogleFonts.sourceCodePro(fontSize: 16,fontWeight: FontWeight.bold),),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: height * 0.045751634,),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),

                      child: TextFormField(
                        onChanged: (val){},
                        obscureText: false,
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade400)
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,


                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Enter an E-mail';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: height * 0.026143791,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),

                      child: TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade400)
                          ),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                        ),
                        validator: (value) => value!.length < 6 ? 'Pass should be at least 6 characters' : null,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.026143791,),
              GestureDetector(
                onTap: () async {
                  if(_formKey.currentState!.validate()){
                    try {
                      await AuthServices().signUserIn(emailController, passwordController);
                    } on Exception catch (e) {
                      if (kDebugMode) {
                        print(e.toString());
                      }
                      
                    }

                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.026143791,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Flexible(child: Divider(color: Colors.grey,)),
                    Text('OR',style: TextStyle(color: Colors.grey),),
                    Flexible(child: Divider(color: Colors.grey,)),
                  ],
                ),
              ),
              SizedBox(height: height * 0.026143791,),
              // Text('data'),
              GestureDetector(
                onTap: (){
                  AuthServices().signInWithGoogle();
                },
                child: SvgPicture.asset('assets/icons/google.svg',
                    height: height * 0.058823529,
                    width: width * 0.111111111
                ),
              ),
              SizedBox(height: height * 0.039215686,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Not a Member? ',style: TextStyle(fontWeight: FontWeight.bold),),
                  GestureDetector(
                    onTap:(){
                      setState(() {
                        onTap!();
                      });
                    },
                    child:const Text('Register Now',style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),)
                    ,
                  )
                ],
              ),
            ],
          ),

        ),
      ),
    );
  }
}