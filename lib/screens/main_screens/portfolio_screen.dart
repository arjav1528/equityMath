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

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<PortfolioModel>?>.value(
      value: Historyservice().portfolio,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Hello'),
          centerTitle: true,
        ),
        body: PortfolioList(),
      ),
    );
  }
}