
// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/portfolio_model.dart';

class Historyservice{
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // ignore: non_constant_identifier_names
  Future saveTransaction(String stock_symbol,String purchasedate,String selldate,double quantity,double purchaserate,double sellrate) async {
    double difference = sellrate - purchaserate;
    String status = difference>0 ? 'Profit' : 'Loss';
    double amount =  quantity * difference;
    return await _firestore.collection('users').doc(uid).collection('Transactions').add({
      'stock_symbol' : stock_symbol,
      'amount' : amount,
      'quantity' : quantity,
      'purchase_date' : purchasedate,
      'purchase_rate' : purchaserate,
      'sell_date': selldate,
      'sell_rate' : sellrate,
      'status' : status,
      'timestamp' : FieldValue.serverTimestamp()



    });
  }

  List<PortfolioModel> _portfolioList(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return PortfolioModel(
          amount: doc['amount'],
          purchase_date: doc['purchase_date'],
          quantity: doc['quantity'],
          sell_date: doc['sell_date'],
          sell_rate: doc['sell_rate'],
          purchase_rate: doc['purchase_rate'],
          status: doc['status'],
          stock_symbol: doc['stock_symbol'],
          timestamp: doc['timestamp']



      );
    }).toList();
  }



  Stream<List<PortfolioModel>> get portfolio {
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('Transactions')
        .orderBy('timestamp',descending: true)
        .limit(5)
        .snapshots()
        .map(_portfolioList);
  }

}