// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class PortfolioModel{
  double amount;
  String purchase_date;
  double purchase_rate;
  double quantity;
  String sell_date;
  double sell_rate;
  String status;
  String stock_symbol;
  Timestamp timestamp;
  String stock;


  PortfolioModel({
    required this.status,
    required this.stock_symbol,
    required this.amount,
    required this.sell_date,
    required this.sell_rate,
    required this.purchase_date,
    required this.purchase_rate,
    required this.quantity,
    required this.timestamp,
    required this.stock});
}