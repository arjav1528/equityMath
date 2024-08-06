// ignore: depend_on_referenced_packages
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:stock_math_final/secrets/apikey.dart';
class RemoteService{
    Future<Map<String,dynamic>?> getRates(String stockSymbol) async {
    var client = http.Client();
    String api = apiKey().api;
    var uri = Uri.parse('https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=$stockSymbol&outputsize=full&apikey=https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=SUZLON.BSE&outputsize=full&apikey=$api}');
    var response = await client.get(uri);
    if(response.statusCode == 200){
      return jsonDecode(response.body);

      }
    return null;
    }

}
