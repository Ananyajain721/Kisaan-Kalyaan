import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class sms_app extends StatefulWidget {
  @override
  _sms_appState createState() => _sms_appState();
}

class _sms_appState extends State<sms_app> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Sms"),),
    body: RaisedButton(child: Text("SEND SMS"),onPressed: () {sendsms();}
    ,),
    );
  }
  sendsms(){
  String sms1="sms:8750573051";
  launch(sms1);
}
}


