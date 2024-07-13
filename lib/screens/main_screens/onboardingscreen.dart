// ignore_for_file: file_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_animated_button/elevated_layer_button.dart';

import '../../services/authentication/auth_stream.dart';
import '../../services/components/typewriter_text.dart';
class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});
  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}
class _OnboardingscreenState extends State<Onboardingscreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 130, 123, 230),
      body: Stack(
        children: [
          Center(
            child: GifView.asset('assets/gifs/bg.gif'),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Equity',
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                            color: Colors.green
                        ),),
                      Text('Math',
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                            color: Colors.red
                        ),)
                    ],
                  ),
                  SizedBox(
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: TypewriterText(homescreen: false, text: 'Eat..Sleep..Trade',),

                    ),
                  ),
                  SizedBox(height: 130,),
                  Center(
                    child: ElevatedLayerButton(
                      onClick: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  AuthStream()));
                      },
                      buttonHeight: 70,
                      buttonWidth: 250,
                      animationDuration: const Duration(milliseconds: 200),
                      animationCurve: Curves.easeIn,
                      topDecoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all()
                      ),
                      topLayerChild: Text('Sign In',style: GoogleFonts.sourceCodePro(fontSize: 20,color: const Color.fromARGB(255, 130, 123, 230)),),
                      baseDecoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all()
                      ),
                    ),
                  ),
                  const Spacer()



                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}