

// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_math_final/services/components/nulldata.dart';

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
  Stream<List<PortfolioModel>>? portfolios = Historyservice().portfolio;

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
      value: portfolios,
      initialData: null,
      builder: (context,snapshot){
        if(portfolios==null){
          // ignore: prefer_const_constructors
          return Nulldata();
        }
        else{
          return const Scaffold(
              body: PortfolioList()
          );
        }
      },
    );
  }
}