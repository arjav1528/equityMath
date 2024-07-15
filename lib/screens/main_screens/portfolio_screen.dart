

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stock_math_final/services/components/typewriter_text.dart';

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
  @override
  void initState() {
    super.initState();
    email = FirebaseAuth.instance.currentUser!.email;
    username = email!.substring(0,email!.indexOf('@'));
  }
  @override

  Widget build(BuildContext context) {
    late var portfolios = Provider.of<List<PortfolioModel>?>(context);
    return StreamProvider<List<PortfolioModel>?>.value(
      value: Historyservice().portfolio,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Spacer(flex: 1,),

            Text('$username’s Portfolio',
            style: GoogleFonts.sourceCodePro(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),),
            Spacer(flex: 5,)
          ],
        ),
        body: PortfolioList()
      ),
    );
  }
}