import 'package:flutter/material.dart';
import 'package:hello_world/flight_list.dart';
import 'package:hello_world/home.dart';



class uploadcrop extends StatefulWidget {
  List<FlightCard> li;
  @override
  uploadcrop(this.li);
  _uploadCrop createState() => _uploadCrop(li);
}

class _uploadCrop extends State<uploadcrop> {
  
TextEditingController tt=new TextEditingController();
TextEditingController tt1=new TextEditingController();
TextEditingController ttprice=new TextEditingController();
List<FlightCard> l;
_uploadCrop(this.l);
  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            //filterQuality: FilterQuality.low,
              image: AssetImage("assets/images/uploadcrop.jpg"),
              
      fit: BoxFit.cover,
            color: Colors.grey,
            colorBlendMode: BlendMode.lighten,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Upload Crop Details",
                style: TextStyle(color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24.0),
               
              ),
              new  Form(

                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 4.0),
                                  child: Theme(
                    data: new ThemeData(
                     // brightness: Brightness.dark,
                      primarySwatch: Colors.blue,

                    ),
                    
                    child: new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Enter Crop name",
                       fillColor: Colors.black,
                      ),
                      controller: tt,
                   //   keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ),
              ),
               new Form(
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 4.0),
                                  child: Theme(
                    data: ThemeData(
                      primarySwatch: Colors.blue,
                     // brightness: Brightness.dark,
                    ),


                    child: new TextFormField(
                      decoration: new InputDecoration(
                          labelText: "No.of quantity available in Kg",
                          fillColor: Colors.black
                      ),
                      controller: tt1,
                      keyboardType: TextInputType.number,
                     // obscureText: true,
                    ),
                  ),
                ),

              ),
              new Form(
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 4.0),
                                  child: Theme(
                    data: ThemeData(
                      primarySwatch: Colors.blue,
                      //brightness: Brightness.dark,
                    ),


                    child: new TextFormField(
                      decoration: new InputDecoration(
                          labelText: "Price per Kg",
                          fillColor: Colors.black
                      ),
                      keyboardType: TextInputType.number,
                     // obscureText: true,
                      controller: ttprice,
                    ),
                  ),
                ),

              ),
              Row(
                              children: <Widget>[
    Padding(padding: EdgeInsets.only(left: 80.0),
          child: new MaterialButton(
  
                      color: Colors.green,
  
                      textColor: Colors.black,
  
                      child: new Text("Update"),
  
                      onPressed: (){
                        
                       l.add(FlightCard(tt.text,int.parse(ttprice.text),int.parse(tt1.text),'Feb 2020',3.8+double.parse(ttprice.text)%1.5));
                       setState(() {
                         tt.clear();
                         tt1.clear();
                         ttprice.clear();
                         
                       });
                        showDialog<String>(
            context: context,
            builder: (BuildContext context)=> AlertDialog(
            content: Text('Uploaded Successfully',style: TextStyle(
           fontWeight: FontWeight.bold),),
            
            actions: <Widget>[FlatButton(child: Text('OK'),
            onPressed: ()=>Navigator.pop(context,'OK'),)],)
            );
                       },
  
  
  
                    ),
    ),
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal: 8.0),
                 ),
                  new MaterialButton(
  
                    color: Colors.green,
  
                    textColor: Colors.black,
  
                    child: new Text("Back"),
  
                    onPressed: ()=>Navigator.pop(context),
  
  
  
                  ),

],
              )
            ],
          )
        ],
      ),
    );
  }
}