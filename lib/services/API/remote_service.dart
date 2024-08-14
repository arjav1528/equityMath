// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';


class RemoteService{
    Future<Map<String,dynamic>?> getRates(String stockSymbol) async {
    var client = http.Client();
    var uri = Uri.parse('https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=$stockSymbol&outputsize=full&apikey=https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=SUZLON.BSE&outputsize=full&apikey=FTOE7T2IPP526Q5J}');
    var response = await client.get(uri);
    if(response.statusCode == 200){
      return jsonDecode(response.body);

      }
    return null;
    }

}
