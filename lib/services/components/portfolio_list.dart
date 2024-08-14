

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_math_final/services/components/nulldata.dart';
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    if (portfolios != null) {

      if(portfolios.length ==0){
        return Nulldata();
      }
      else{
        return ListView.builder(
          itemCount: portfolios.length,
          itemBuilder: (context,index){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: height * .004966887,horizontal: width * 0.010416667),
              child: Center(
                child: PortfolioCard(
                  amount: portfolios[index].amount,
                  purchasedate: portfolios[index].purchase_date,
                  purchaserate: portfolios[index].purchase_rate,
                  quantity: portfolios[index].quantity,
                  sellrate: portfolios[index].sell_rate,
                  selldate: portfolios[index].sell_date,
                  status: portfolios[index].status,
                  stock_symbol: portfolios[index].stock_symbol,
                ),
              ),
            );
          },

        );
      }
    }
    else{
      return const Center(child: CircularProgressIndicator());
    }
  }
}

