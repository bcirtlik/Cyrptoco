import 'package:flutter/material.dart';


class CyrptoListWidget extends StatelessWidget{

  final List<MaterialColor> colors=[Colors.blue,Colors.indigo,Colors.red];
  final List currencies;

  CyrptoListWidget(this.currencies);

  @override
  Widget build(BuildContext context) {
      return new Scaffold(
        body: buildBody(),
        backgroundColor: Colors.blue,
      );


  }


  Widget buildBody(){

    return new Container(
      margin: const EdgeInsets.fromLTRB(8.0, 56.0, 8.0, 0.0),
      child: new Column(
        children: <Widget>[
          getAppTitleWidget(),
          getListViewWidget(),

        ],
      ),
    );

  }


  Widget getAppTitleWidget(){
    return new Text('Cyrptocurrencies',style: new TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 24.0
    ),);
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