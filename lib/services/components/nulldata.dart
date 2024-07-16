import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_math_final/services/components/typewriter_text.dart';
class Nulldata extends StatelessWidget {
  const Nulldata({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TypewriterText(text: 'Error 404', homescreen: true),
          Text('Data Not Found',style: GoogleFonts.sourceCodePro(),),
          Text('Return to Home Screen',style: GoogleFonts.sourceCodePro(),),
          Text('and update your Portfolio',style: GoogleFonts.sourceCodePro(),),
        ],
      ),
    );
  }
}
