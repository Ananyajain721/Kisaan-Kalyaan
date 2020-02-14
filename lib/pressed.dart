import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class pressed extends StatefulWidget {
  @override
  _pressedState createState() => _pressedState();
}

class _pressedState extends State<pressed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("View the cryptocurrencies",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
       body:crypt(),
    );
  }
}
var myData;
 Future<List> func() async{
  var url="https://api.coinmarketcap.com/v1/ticker/?limit=50";
  var resp=await http.get(url);
   myData=jsonDecode(resp.body);
   print(myData);
   return myData;
 
}
Widget crypt(){
 var mydata= func();
  return new ListView.builder(
    itemBuilder: (BuildContext context,int index){
      return new Card(
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: <Widget>[
         new Text("name : "+myData[index]['name'],style: TextStyle(color: Colors.cyan,fontWeight: FontWeight.bold),),
            if(double.parse(myData[index]['percent_change_1h'])>0)
            new Text("percent change in one hour : "+myData[index]['percent_change_1h'],style: TextStyle(color: Colors.green),)
            else
            new Text("percent change in one hour : "+myData[index]['percent_change_1h'],style: TextStyle(color: Colors.red),),
        
         new Text("percent change in 24 hour : "+myData[index]['percent_change_24h'])
       ],
         
     ),
      );
    },
   itemCount: myData==null?0:myData.length,
 );
}
