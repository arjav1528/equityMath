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
  String stock;
  PortfolioCard({super.key,
    required this.amount,
    required this.status,
    required this.purchasedate,
    required this.purchaserate,
    required this.quantity,
    required this.selldate,
    required this.sellrate,
    required this.stock_symbol,
    required this.stock
  });

  @override
  State<PortfolioCard> createState() => _PortfolioCardState(
    status: status,
    stock_symbol: stock_symbol,
    selldate: selldate,
    sellrate: sellrate,
    purchasedate: purchasedate,
    amount: amount,
    quantity: quantity,
    purchaserate: purchaserate,
    stock: stock
  );
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
  String stock;
  _PortfolioCardState({
    required this.amount,
    required this.status,
    required this.purchasedate,
    required this.purchaserate,
    required this.quantity,
    required this.selldate,
    required this.sellrate,
    required this.stock_symbol,
    required this.stock
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    late var portfolios = Provider.of<List<PortfolioModel>?>(context);
    if(status == 'Profit'){
      return Stack(
        children: [
          SizedBox(
            width: width,
              child: SvgPicture.asset('assets/icons/profit.svg',
                fit: BoxFit.fitWidth,
              )
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.038888889),
                      child: Text(stock_symbol,
                        style: GoogleFonts.sourceCodePro(
                            color: Colors.white,
                            fontSize: 14
                        ),),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: width * 0.038888889),
                      child: Text('Shares : ${quantity.toStringAsFixed(0)}',
                        style: GoogleFonts.sourceCodePro(
                            color: Colors.white,
                            fontSize: 14
                        )
                        ,),
                    )

                  ],
                ),
                Padding(
                  padding:EdgeInsets.only(left: width * 0.038888889),
                  child: Text('Purchased on $purchasedate @ ${purchaserate.toStringAsFixed(2)}',
                    style: GoogleFonts.sourceCodePro(
                        color: Colors.white,
                        fontSize: 15,
                        letterSpacing: 0.0,
                        wordSpacing: 0.00
                    ),),
                ),
                Padding(
                  padding:EdgeInsets.only(left: width * 0.038888889),
                  child: Text('Sold on $selldate @ ${sellrate.toStringAsFixed(2)}',
                    style: GoogleFonts.sourceCodePro(
                        color: Colors.white,
                        fontSize: 16,
                        letterSpacing: 0.01,
                        wordSpacing: 0.01
                    ),),
                ),
                SizedBox(height: height * 0.004966887,),
                Padding(
                  padding:EdgeInsets.only(left: width * 0.038888889),
                  child: Text('Profit : ${amount.toStringAsFixed(2)}',
                    style: GoogleFonts.sourceCodePro(
                        color: Colors.white,
                        fontSize: 16,
                        letterSpacing: 0.01,
                        wordSpacing: 0.01
                    ),),
                ),
              ],
            ),
          )
        ],
      );
    }
    else{
      return Stack(
        children: [
          SizedBox(
              width: width,
              child: SvgPicture.asset('assets/icons/loss.svg',
                fit: BoxFit.fitWidth,
              )
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.038888889),
                      child: Text(stock_symbol,
                        style: GoogleFonts.sourceCodePro(
                            color: Colors.white,
                            fontSize: 14
                        ),),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: width * 0.038888889),
                      child: Text('Shares : ${quantity.toStringAsFixed(0)}',
                        style: GoogleFonts.sourceCodePro(
                            color: Colors.white,
                            fontSize: 14
                        )
                        ,),
                    )

                  ],
                ),
                Padding(
                  padding:EdgeInsets.only(left: width * 0.038888889),
                  child: Text('Purchased on $purchasedate @ ${purchaserate.toStringAsFixed(2)}',
                    style: GoogleFonts.sourceCodePro(
                        color: Colors.white,
                        fontSize: 15,
                        letterSpacing: 0.0,
                        wordSpacing: 0.00
                    ),),
                ),
                Padding(
                  padding:EdgeInsets.only(left: width * 0.038888889),
                  child: Text('Sold on $selldate @ ${sellrate.toStringAsFixed(2)}',
                    style: GoogleFonts.sourceCodePro(
                        color: Colors.white,
                        fontSize: 16,
                        letterSpacing: 0.01,
                        wordSpacing: 0.01
                    ),),
                ),
                SizedBox(height: height * 0.004966887,),
                Padding(
                  padding:EdgeInsets.only(left: width * 0.038888889),
                  child: Text('Loss : ${amount.toStringAsFixed(2)}',
                    style: GoogleFonts.sourceCodePro(
                        color: Colors.white,
                        fontSize: 16,
                        letterSpacing: 0.01,
                        wordSpacing: 0.01
                    ),),
                ),
              ],
            ),
          )
        ],
      );
    }
  }
}
