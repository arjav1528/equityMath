

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/portfolio_model.dart';
import '../../services/components/portfolio_list.dart';
import '../../services/firestore_cloud/HistoryService.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}
class _PortfolioScreenState extends State<PortfolioScreen> {
  String? email;
  String username = '';
  String final_username = '';
  @override
  void initState() {
    super.initState();
    email = FirebaseAuth.instance.currentUser!.email;
    username = email!.substring(0,email!.indexOf('@'));
    if(username.length > 7){
      final_username = username.substring(0,8);
      final_username += '..';
    }
  }
  @override

  Widget build(BuildContext context) {
    return StreamProvider<List<PortfolioModel>?>.value(
      value: Historyservice().portfolio,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            const Spacer(flex: 1,),

            Text('$final_username’s Portfolio',
            style: GoogleFonts.sourceCodePro(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),),
            const Spacer(flex: 5,)
          ],
        ),
        body: const PortfolioList()
      ),
    );
  }
}