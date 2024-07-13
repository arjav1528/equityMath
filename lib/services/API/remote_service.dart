import 'package:http/http.dart' as http;
import 'dart:convert';
class RemoteService{
    Future<Map<String,dynamic>?> getRates(String stockSymbol) async {
    var client = http.Client();
    var uri = Uri.parse('https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=$stockSymbol&outputsize=full&apikey=demo');
    var response = await client.get(uri);
    if(response.statusCode == 200){
      return jsonDecode(response.body);

      }
    return null;
    }

}
