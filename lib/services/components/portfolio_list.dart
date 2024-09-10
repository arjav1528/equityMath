import 'package:flutter/cupertino.dart';
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
  double invested = 0;
  double returns = 0;
  late double returnpercent = 0;

  void getBalance(List<PortfolioModel> portfolio) {
    double tempb = 0;
    double tempi = 0;
    double tempr = 0;
    for (var obj in portfolio) {
      tempb += obj.amount;
      tempi += (obj.purchase_rate * obj.quantity);
      tempr += (obj.sell_rate * obj.quantity);
    }
    setState(() {
      balance = tempb;
      invested = tempi;
      returns = tempr;
      double net = returns - invested;
      returnpercent = ((net * 100) / invested);

    });
  }


  @override
  Widget build(BuildContext context) {
    var portfolios = Provider.of<List<PortfolioModel>?>(context);
    getBalance(portfolios!);
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          // SvgPicture.asset('assets/icons/portfolio.svg'),
          Column(
            children: [
              Container(
                height: height * 0.261437908,
                width: width,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(200, 186, 182, 241),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                        color: Colors.deepPurple,
                        width: 2

                    )
                ),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 3 * 0.013071895,),
                    const Text('Your Balance',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color.fromARGB(255, 130, 123, 230),
                          fontSize: 20
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(flex: 2,),
                        Text(balance.toStringAsFixed(2),
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 40
                          ),),
                        const Spacer(flex: 1,),
                        Transform.scale(
                          scale: 0.8,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(returnpercent.toString()=='NaN' ? '0' : returnpercent.toStringAsFixed(2),
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    color: returnpercent>0 ? Colors.green[800] : Colors.red[800]

                                ),),
                              const SizedBox(width: 5,),
                              returnpercent>0 ? Icon(
                                CupertinoIcons.triangle_fill,
                                color: Colors.green[800],
                              ) : Transform.scale(
                                scaleY: -1,
                                child: Icon(
                                  CupertinoIcons.triangle_fill,
                                  color: Colors.red[800],
                                ),
                              )
                            ],
                          ),
                        ),
                        const Spacer(flex: 1,),
                      ],
                    ),
                    SizedBox(height: height * 0.013071895,),
                    Column(
                      children: [
                        Text('Invested : ${invested.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14
                          ),),
                        SizedBox(width: width * 0.055555556,),
                        Text('Returns : ${returns.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14
                          ),),
                      ],
                    ),
                    SizedBox(height: height * 0.013071895,),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
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
                          stock: portfolios[index].stock,
                        ),
                      ),
                    );
                  },

                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}


