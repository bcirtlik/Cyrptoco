import 'package:flutter/material.dart';

import 'api/currencyApi.dart';
import 'ui/CyrptoListWidget.dart';


void main() async{

  CurrencyApi currencyApi=new CurrencyApi();
  List currencies=await currencyApi.getCurrencies();
  print(currencies);

  runApp(new MaterialApp(
      home: new MainWidget(currencies)
  ));

}


