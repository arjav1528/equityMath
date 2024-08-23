

// ignore_for_file: non_constant_identifier_names

// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  Stream<List<PortfolioModel>> portfolios = Historyservice().portfolio;

  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<PortfolioModel>?>.value(
      value: portfolios,
      initialData: null,
      child:  const PortfolioList()
    );
  }
}