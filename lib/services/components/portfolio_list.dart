import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/portfolio_model.dart';
class PortfolioList extends StatefulWidget {
  const PortfolioList({super.key});

  @override
  State<PortfolioList> createState() => _PortfolioListState();
}

class _PortfolioListState extends State<PortfolioList> {
  @override
  Widget build(BuildContext context) {
    late var portfolios = Provider.of<List<PortfolioModel>?>(context);
    if(portfolios == null){
      return const Center(child: Text('No data'),);
    }
    else{
      return ListView.builder(
        itemCount: portfolios.length,
        itemBuilder: (context,index){
          return Column(
            children: [
              Text(portfolios[index].status),
              Text((portfolios[index].quantity).toString()),
              Text(portfolios[index].stock_symbol),
            ],
          );
        },

      );
    }
  }
}
