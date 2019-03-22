import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyApi {
  Future<List> getCurrencies() async {
    String apiUrl = 'https://api.coinmarketcap.com/v1/ticker/?limit=50';
    http.Response response = await http.get(apiUrl);
    return jsonDecode(response.body);
  }
}