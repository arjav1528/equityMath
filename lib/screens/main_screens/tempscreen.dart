import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../services/API/remote_service.dart';
class Tempscreen extends StatefulWidget {
  const Tempscreen({super.key});

  @override
  State<Tempscreen> createState() => _TempscreenState();
}

class _TempscreenState extends State<Tempscreen>{

  String text = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }
  Future<void> _getData() async {
    try{
      final rates = await RemoteService().getRates('RELIANCE.BSE');
      setState(() {

        text = rates!['Time Series (Daily)']['2024-07-05']['1. open'];

      });
    }catch(e){if (kDebugMode) {
      print(e.toString());
    }}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(text,style: const TextStyle(
          color: Colors.black
        ),),
      )
    );
  }
}
