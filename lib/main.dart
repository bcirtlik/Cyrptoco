import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'ui/CyrptoListWidget.dart';


void main() async{

  List currencies=await getCurrencies();
  print(currencies);

  runApp(new MaterialApp(
      home: new CyrptoListWidget(currencies)
  ));

}



Future<List> getCurrencies() async{
  String apiUrl = 'https://api.coinmarketcap.com/v1/ticker/?limit=50';
  http.Response response= await http.get(apiUrl);
  return jsonDecode(response.body);

}