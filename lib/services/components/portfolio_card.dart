// ignore_for_file: no_logic_in_create_state, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/portfolio_model.dart';
// ignore: must_be_immutable
class PortfolioCard extends StatefulWidget {
  String status;
  String stock_symbol;
  double amount;
  String purchasedate;
  String selldate;
  double purchaserate;
  double sellrate;
  double quantity;
  PortfolioCard({super.key, required this.amount,required this.status,required this.purchasedate,required this.purchaserate,required this.quantity,required this.selldate,required this.sellrate,required this.stock_symbol});

  @override
  State<PortfolioCard> createState() => _PortfolioCardState(status: status,stock_symbol: stock_symbol,selldate: selldate,sellrate: sellrate,purchasedate: purchasedate,amount: amount,quantity: quantity, purchaserate: purchaserate,);
}

class _PortfolioCardState extends State<PortfolioCard> {
  String status;
  String stock_symbol;
  double amount;
  String purchasedate;
  String selldate;
  double purchaserate;
  double sellrate;
  double quantity;
  _PortfolioCardState({required this.amount,required this.status,required this.purchasedate,required this.purchaserate,required this.quantity,required this.selldate,required this.sellrate,required this.stock_symbol});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    late var portfolios = Provider.of<List<PortfolioModel>?>(context);
    if(status == 'Profit'){
      return SizedBox(
        height: 100,
        width: 350,
        child: Stack(
          children: [
            SvgPicture.asset('assets/icons/profit.svg'),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(stock_symbol,
                          style: GoogleFonts.sourceCodePro(
                              color: Colors.white,
                              fontSize: 14
                          ),),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text('Shares : ${quantity.toStringAsFixed(0)}',
                            style: GoogleFonts.sourceCodePro(
                                color: Colors.white,
                                fontSize: 14
                            )
                            ,),
                        )

                      ],
                    ),
                    Text('Purchased on $purchasedate @ ${purchaserate.toStringAsFixed(2)}',
                      style: GoogleFonts.sourceCodePro(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 0.01,
                          wordSpacing: 0.01
                      ),),
                    Text('Sold on $selldate @ ${sellrate.toStringAsFixed(2)}',
                      style: GoogleFonts.sourceCodePro(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 0.01,
                          wordSpacing: 0.01
                      ),),
                    Text('Profit : ${amount.toStringAsFixed(2)}',
                      style: GoogleFonts.sourceCodePro(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 0.01,
                          wordSpacing: 0.01
                      ),),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }
    else{
      return SizedBox(
        height: 100,
        width: 350,
        child: Stack(
          children: [
            SvgPicture.asset('assets/icons/loss.svg'),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(stock_symbol,
                          style: GoogleFonts.sourceCodePro(
                              color: Colors.white,
                              fontSize: 14
                          ),),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text('Shares : ${quantity.toStringAsFixed(0)}',
                            style: GoogleFonts.sourceCodePro(
                                color: Colors.white,
                                fontSize: 14
                            )
                            ,),
                        )

                      ],
                    ),
                    Text('Purchased on $purchasedate @ ${purchaserate.toStringAsFixed(2)}',
                      style: GoogleFonts.sourceCodePro(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 0.01,
                          wordSpacing: 0.01
                      ),),
                    Text('Sold on $selldate @ $sellrate',
                      style: GoogleFonts.sourceCodePro(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 0.01,
                          wordSpacing: 0.01
                      ),),
                    Text('Loss : ${amount.toStringAsFixed(2)}',
                      style: GoogleFonts.sourceCodePro(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 0.01,
                          wordSpacing: 0.01
                      ),),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }
  }
}
