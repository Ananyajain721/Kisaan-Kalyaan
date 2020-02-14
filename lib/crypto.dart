import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_world/flight_list.dart';
import 'package:hello_world/pressed.dart';
import 'package:http/http.dart' as http;
import 'package:hello_world/pressed.dart';
class cryptoscreen extends StatefulWidget {
  @override
  _cryptoscreenState createState() => _cryptoscreenState();
}

class _cryptoscreenState extends State<cryptoscreen> {
  TextEditingController t=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Let's Explore Crypto's",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
          body: new Container(
        child : new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
            Padding(padding: EdgeInsets.all(4.0),),
            new TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 4.0),
                hintText: "What's your cryptocurrency?",
              ),
              controller: t,
            ),
            new RaisedButton(
              onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder:(BuildContext context)=> pressed() )),
                          child: new Text(
                            "Enter"
                          ),
                          color: Colors.cyan,
                        ),
                        
                      ],),
                    ),
                  ),
    );
              }
            
            




              }


