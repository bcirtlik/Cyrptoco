import 'package:flutter/material.dart';

import '../api/currencyApi.dart';


class MainWidget extends StatefulWidget {
  var currencies;


  MainWidget(this.currencies);
  @override
  CyrptoListWidget createState() => new CyrptoListWidget(currencies);
}


class CyrptoListWidget extends State<MainWidget>{

  final List<MaterialColor> colors=[Colors.blue,Colors.indigo,Colors.red];
  List currencies;

  CyrptoListWidget(this.currencies);

  @override
  Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.brown.shade200,
          title: new Text("Cyrptocurrency"),
        ),
        body: buildBody(),
        floatingActionButton: new FloatingActionButton(
          onPressed: ()=>addCurrency(),
          backgroundColor: Colors.indigo.shade300,
          child: new Icon(Icons.add),
        ),
        backgroundColor: Colors.white,
      );


  }

  void addCurrency(){}


  Widget buildBody() {
    return new Container(
        margin: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 10.0),
        child: RefreshIndicator(
            child: new Column(
              children: <Widget>[
                getListViewWidget(),
              ],
            ),
            onRefresh: refreshCurrencyList));
  }


  Future<void> refreshCurrencyList() async{
    CurrencyApi currencyApi=new CurrencyApi();
    List currencies=await currencyApi.getCurrencies();
    setState(() {
      this.currencies=currencies;
    });


  }


  Widget getListViewWidget(){
    return new Flexible(
        child: new ListView.builder(
            itemCount: currencies.length,
            itemBuilder: (context,index){
              final Map currency=currencies[index];
              final MaterialColor color=colors[index % colors.length];
              return getListItemWidget(currency,color);
            }



            ),


    );

  }

  Container getListItemWidget(Map currency,MaterialColor color){
      return new Container(
        margin: const EdgeInsets.only(top:10.0),
        child: new Card(
          child: getListTile(currency, color),
          color: Colors.blueGrey.shade50 ,
        ),


      );

  }


  CircleAvatar getLeadingWidget(String currencyName,MaterialColor color){
      return new CircleAvatar(
        backgroundColor: color,
        child: new Text(currencyName[0]),        
      );
  }


  Text getTitleWidget(String currencyName){
    return new Text(currencyName, style: new TextStyle(fontWeight: FontWeight.bold),);
  }

  Text getSubtitleWidget(String priceUSD,String percentChange1h){
      return new Text('\$$priceUSD\n1 hour: $percentChange1h%');
  }

  ListTile getListTile(Map currency,MaterialColor color){
    return new ListTile(
      leading: getLeadingWidget(currency['name'], color),
      title: getTitleWidget(currency['name']),
      subtitle: getSubtitleWidget(currency['price_usd'], currency['percent_change_1h']),
      isThreeLine: true,
    );
    
  }

}