import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: must_be_immutable
class TypewriterText extends StatefulWidget {
  bool homescreen;
  String text;
  TypewriterText({super.key, required this.text, required this.homescreen});

  @override
  // ignore: no_logic_in_create_state
  State<TypewriterText> createState() => _TypewriterTextState(actualText4: text,homescreen: homescreen);
}

class _TypewriterTextState extends State<TypewriterText> {
  String actualText4;
  bool homescreen;
  _TypewriterTextState({required this.actualText4, required this.homescreen});
  String text1 = '';
  int _textLength = 0;
  int _index = 0;
  bool _isFoward = true;
  late Timer timer;
  @override
  void initState() {
    // TODO: implement initState
    _textLength = actualText4.length;
    _index = -1;
    _isFoward = true;
    timer = Timer.periodic(const Duration(milliseconds: 150), (timer) {
      if (_isFoward) {
        _index++;
        if (_index > _textLength) {
          _index--;
          _isFoward = false;
        }
      }
      if (!_isFoward) {
        _index--;
        if (_index < 0) {
          _index += 2;
          _isFoward = true;
        }
      }
      setState(() {
        text1 = '${actualText4.substring(0, _index)}_';
      });
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(homescreen){
      return Text(text1,style: GoogleFonts.sourceCodePro(fontSize: 30),);
    }
    else{
      return Text(
        text1,
        style: GoogleFonts.sourceCodePro(
            height: 1.2,
            fontWeight: FontWeight.w700,
            fontSize: 45,
            color: Colors.white
        ),
      );
    }
  }
}
