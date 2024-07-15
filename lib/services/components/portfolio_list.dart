import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_math_final/services/components/portfolio_card.dart';

import '../../models/portfolio_model.dart';
class PortfolioList extends StatefulWidget {
  const PortfolioList({super.key});

  @override
  State<PortfolioList> createState() => _PortfolioListState();
}

class _PortfolioListState extends State<PortfolioList> {
  double balance = 0;

  @override
  Widget build(BuildContext context) {
    late var portfolios = Provider.of<List<PortfolioModel>?>(context);
    if(portfolios == null){
      return const Center(child: Text('No data'),);
    }
    else{
      return ListView.builder(
        itemCount: 5,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child:PortfolioCard(
              amount: portfolios[index].amount,
              purchasedate: portfolios[index].purchase_date,
              purchaserate: portfolios[index].purchase_rate,
              quantity: portfolios[index].quantity,
              sellrate: portfolios[index].sell_rate,
              selldate: portfolios[index].sell_date,
              status: portfolios[index].status,
              stock_symbol: portfolios[index].stock_symbol,
            )
          );
        },

      );
    }
  }
}
