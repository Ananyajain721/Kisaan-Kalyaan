import 'package:hello_world/custom_shape_clipper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './home.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:hello_world/sms.dart';

final Color discountBackgroundColor = Colors.green.withOpacity(0.2);
final Color flightBorderColor = Color(0xFFE6E6E6);
final Color chipBackgroundColor = Color(0xFFF6F6F6);

class FlightListScreen extends StatefulWidget {
  final String t;
  FlightListScreen(this.t);
  @override
  _FlightListScreenState createState() => _FlightListScreenState(t);
}

class  _FlightListScreenState extends State<FlightListScreen>{

  String tex;
  _FlightListScreenState(this.tex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        elevation: 0.0,
        title: Text("Search Result",style: TextStyle(fontFamily: "Oxygen"),),
        gradient: LinearGradient(colors: [
          Colors.green,Colors.orange
        ]),
        centerTitle: true,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: (){
            Navigator.pop(context);
          } 
          ),
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
              child: Column(
          children: <Widget>[
            FlightListTopPart(tex),
            SizedBox(height: 20,),
            FlightListBottomPart(tex),
          ],
        ),
      ) ,
      
    );
  }
}



class FlightListTopPart extends StatelessWidget {
 final String t;
  FlightListTopPart(this.t);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
         decoration: BoxDecoration(
                gradient: LinearGradient(colors: [firstColor, secondColor])),
            height:160 ,
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.symmetric(horizontal: 16),
              elevation: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:20, vertical: 24),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(children: <Widget>[Icon(Icons.location_on),Padding(padding: EdgeInsets.symmetric(horizontal: 4.0),),Text("Bijnor", style:TextStyle(fontSize:16.0, ))]),
                          Divider(color: Colors.grey,),
                          Text("$t", style:TextStyle(fontSize:16.0,fontWeight: FontWeight.bold )),
                        ],
                      ),
                    ),
                    
                  ],

                ),
              ),
            ),
          ],
        )
      ],

      
    );
  }
}


class FlightListBottomPart extends StatefulWidget {
 final String tee;
  FlightListBottomPart(this.tee);
   _FlightListBottomScreenState createState() => _FlightListBottomScreenState(tee);
}

 List<FlightCard> l=[];
class _FlightListBottomScreenState extends State<FlightListBottomPart>{
  String te;
 
   _FlightListBottomScreenState(this.te);
   @override
void initState()
{
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:16.0),
          child: Text("Nearby Best Deals for $te", style: dropdownMenuItemStyle),
        ),
        SizedBox(height:10 ,),
       // new Expanded(
             new ListView.builder
              (
                shrinkWrap: true,
         physics: ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
                itemCount: l.length,
                itemBuilder: (BuildContext context, int Index) {
                  if(te.compareTo(l[Index].name)==0)
                  return l[Index];
                  else
                  return null;
                }
            )

        ],
      ),

      
    );
  }
}


class FlightCard extends StatelessWidget {
 final String name;
 final int price;
  final int quantity;
  final String date;
  final double rate;
   var inr= new NumberFormat.currency(symbol: "Rs.",);
  FlightCard(this.name,this.price,this.quantity,this.date,this.rate);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0,),
      child: Stack(
        children: <Widget>[
           Container(
           margin: EdgeInsets.only(right: 16),
          
             decoration: BoxDecoration(  
               borderRadius: BorderRadius.all(Radius.circular(10)),
               border: Border.all(color: flightBorderColor),
                ),
                child:Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                        
                          Text("${formatCurrency.format(price)}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          SizedBox(width: 8,),
                           Text("(${formatCurrency.format(price+5)})",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,decoration: TextDecoration.lineThrough,color: Colors.grey),),

                          ],
                      ),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: -8,
                        children: <Widget>[
                         
                           FlightDetailChip(Icons.adjust, '$name'),
                            FlightDetailChip(
                              Icons.add_shopping_cart, '$quantity Kg'),
                          FlightDetailChip(Icons.star, '$rate'),
                           FlightDetailChip(Icons.calendar_today, '$date'),
                            MaterialButton(
  
                    color: Colors.green,
  
                    textColor: Colors.black,
  
                    child: new Text("Order"),
  
                    onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder:(BuildContext context)=> sms_app() )),
  
  
  
                  ),


                        ],
                        
                      ),
                   
                     
                    ],
                  ),
                 
                ) ,
      ),
      Positioned(
        top: 10,
        right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
              margin: EdgeInsets.only(right: 8.0),
              
              child: Text("Add",style:TextStyle(color: appTheme.primaryColor,fontSize: 14, fontWeight: FontWeight.w600)
        ),
        decoration: BoxDecoration(color:discountBackgroundColor, borderRadius: BorderRadius.all(Radius.circular(10)) ),),
      )
        ],
      ),
    );
  }
}

class FlightDetailChip extends StatelessWidget {
  final IconData iconData;
  final String label;
  FlightDetailChip(this.iconData,this.label );
  @override
  Widget build(BuildContext context) {
    return RawChip(
  
      label: Text(label),
      labelStyle: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),
      backgroundColor: chipBackgroundColor,
      avatar:Icon(iconData,size: 14,) ,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),

      
    );
  }
}