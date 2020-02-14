import 'package:hello_world/custom_appbar.dart';
import 'package:hello_world/custom_shape_clipper.dart';
import 'package:hello_world/flight_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hello_world/crypto.dart';
import 'package:hello_world/uploadcrop.dart';
import 'package:hello_world/flight_list.dart';
import 'package:url_launcher/url_launcher.dart';

// void main() => runApp(MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeScreen(),
//       theme: appTheme,
//     ));
const URL="http://agricoop.gov.in/programmes-schemes-listing";
Color firstColor = Colors.green;
Color secondColor = Colors.orange;

ThemeData appTheme =
    ThemeData(primaryColor: Colors.green, fontFamily: "Oxygen",);

List<String> locations = ['Bijnor ', 'Patna '];

class HomeScreen extends StatelessWidget {
 final  String text;
 final String text2;
  HomeScreen(this.text, this.text2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
              child: Column(
          children: <Widget>[
            HomeScreenTopPart(text,text2),
            homeScreenBottom
          ],
        ),
      ),
    );
  }
}

const TextStyle dropdownLableStyle =
    TextStyle(color: Colors.white, fontSize: 16);
const TextStyle dropdownMenuItemStyle =
    TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold);

class HomeScreenTopPart extends StatefulWidget {
 final String text;

  final String text2;

  HomeScreenTopPart( this.text, this.text2);

  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState(text,text2);
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  final String text;

 final String text2;

  _HomeScreenTopPartState(this.text, this.text2);
  var selectedLocationIndex = 0;
  var isFlightSelected = false;
  TextEditingController t1=new TextEditingController();
   Future launchURL(String url) async{
     if(await canLaunch(url)){
       await launch(url, forceSafariVC: true,forceWebView: true);
     }
     
   }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 400,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [firstColor, secondColor])),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                  child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                             IconButton(iconSize: 50,icon : Icon(Icons.account_circle, color: Colors.white), onPressed: () {
                                               
              showDialog<String>(
            context: context,
            builder: (BuildContext context)=> AlertDialog(title: Text('Your Name : $text') ,
            content: Text('Registered Mobile Number: $text2',style: TextStyle(
           fontWeight: FontWeight.bold),),
            
            actions: <Widget>[FlatButton(child: Text('OK'),
            onPressed: ()=>Navigator.pop(context,'OK'),)],)
              );
                                             },),
                                             new Text("Hi! $text",style: TextStyle(color: Colors.white,
            fontSize: 20,fontWeight: FontWeight.bold),)
                                          ],
                                        ),
                         Row(
  
                        children: <Widget>[
  
                          Icon(Icons.location_on, color: Colors.white),
  
                          SizedBox(
  
                            width: 16,
  
                          ),
  
                          PopupMenuButton(
  
                              onSelected: (index) {
  
                                setState(() {
  
                                  selectedLocationIndex = index;
  
                                });
  
                              },
  
                              child: Row(
  
                                children: <Widget>[
  
                                  Text(
  
                                    locations[selectedLocationIndex],
  
                                    style: dropdownLableStyle,
  
                                  ),
  
                                  Icon(
  
                                    Icons.keyboard_arrow_down,
  
                                    color: Colors.white,
  
                                  )
  
                                ],
  
                              ),
  
                              itemBuilder: (BuildContext context) =>
  
                                  <PopupMenuItem<int>>[
  
                                    PopupMenuItem(
  
                                      child: Text(
  
                                        locations[0],
  
                                        style: dropdownMenuItemStyle,
  
                                      ),
  
                                      value: 0,
  
                                    ),
  
                                    PopupMenuItem(
  
                                      child: Text(
  
                                        locations[1],
  
                                        style: dropdownMenuItemStyle,
  
                                      ),
  
                                      value: 1,
  
                                    )
  
                                  ]),
  
                          Spacer(),
  
                         new IconButton(
  
                             icon: Icon(Icons.format_list_bulleted),
  
                             onPressed: ()=>{},
  
                                                     color: Colors.white,
  
                                                   ),
  
                                                   new Text("Change Language",
  
                                                   style: TextStyle(
  
                                                     color: Colors.white
  
                                                   ),)
  
                                                 ],
  
                                               ),
],
                  ),
                                         ),
                                         SizedBox(
                                           height: 50,
                                         ),
                                         Text(
                                           "Search Your Crop",
                                           style: TextStyle(
                                             fontSize: 24,
                                             color: Colors.white,
                                             fontWeight: FontWeight.bold
                                           ),
                                           textAlign: TextAlign.center,
                                         ),
                                         SizedBox(
                                           height: 30,
                                         ),
                                         Padding(
                                           padding: EdgeInsets.symmetric(horizontal: 32),
                                           child: Material(
                                             elevation: 5.0,
                                             borderRadius: BorderRadius.all(Radius.circular(30)),
                                             child: TextField(
                                               controller: t1,
                                               //style: dropdownMenuItemStyle,
                                               cursorColor: appTheme.primaryColor,
                                               decoration: InputDecoration(
                                                   contentPadding: EdgeInsets.symmetric(
                                                       horizontal: 32, vertical: 13),
                                                   suffixIcon: Material(
                                                     elevation: 2.0,
                                                     borderRadius:
                                                         BorderRadius.all(Radius.circular(30.0)),
                                                     child: InkWell(
                                                 child: Icon(
                                                         Icons.search,
                                                         color: Colors.black,
                                                       ),
                         
                                                       onTap: (){
                                                         Navigator.push(context, MaterialPageRoute(builder:(BuildContext context)=> FlightListScreen(t1.text) ));
                                                       },
                                                     ),
                                                   ),
                                                   border: InputBorder.none),
                                             ),
                                           ),
                                         ),
                                         SizedBox(
                                           height: 10,
                                         ),
                                         Row(
                                           mainAxisSize: MainAxisSize.min,
                                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                                           children: <Widget>[
                                             InkWell(
                                               child: ChoiceChip(
                                                   Icons.call, "Toll-Free 1800-180-1551", isFlightSelected),
                                               onTap: () {
                                                 setState(() {
                                                   isFlightSelected = true;
                                                 });
                                               },
                                             ),
                                             IconButton(icon: Icon(Icons.crop_portrait), onPressed: null),
                                                MaterialButton(
  
                                        color: Colors.green,
  
                                       textColor: Colors.black,
  
                                         child: new Text("Government Agri Forum "),
  
                                        onPressed: (){
                                          launchURL(URL);
                                        }
  
  
  
                  ),
                                           ],
                                         )
                                       ],
                                     ),
                                   ),
                                 )
                               ],
                             );
                           }
                         
                         
}

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSelected;

  ChoiceChip(this.icon, this.text, this.isSelected);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8.0),
      decoration: widget.isSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.all(Radius.circular(20)))
          : null,
      child: Row(
        children: <Widget>[
          Icon(
            widget.icon,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(
            width: 8,
          ),
          Text(widget.text, style: TextStyle(color: Colors.white, fontSize: 16))
        ],
      ),
    );
  }
}

var viewAllStyle = TextStyle(fontSize: 14, color: appTheme.primaryColor,fontWeight: FontWeight.w900);

var homeScreenBottom = Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text("Search Your Options", style: dropdownMenuItemStyle)
         
        ],
      ),
    ),
    Container(
      height: 240,
      child: ListView(scrollDirection: Axis.horizontal, children: cityCards),
    ),
    Container(
      height: 240,
      child: ListView(scrollDirection: Axis.horizontal, children: cityCards2),
    ),
     Container(
      height: 240,
      child: ListView(scrollDirection: Axis.horizontal, children: cityCards3),
    )
  ],
);

List<CityCard> cityCards = [
  CityCard("Upload Crop", "assets/images/napanta-logo.png"),
  CityCard(
      "Agri-Forum ", "assets/images/schemes.jpg"),
];
List<CityCard> cityCards2 = [
  CityCard("Cold Storage", "assets/images/cold.jpg"),
  CityCard(
      "Crop Yield", "assets/images/yield.png"),
];
List<CityCard> cityCards3 = [
   CityCard(
      "Visit Farms", "assets/images/visit.png"),
];

final formatCurrency = NumberFormat.simpleCurrency();

class CityCard extends StatelessWidget {
  final String imagePath, cityName;

  CityCard(this.cityName, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 210,
                  width: 160,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  width: 160,
                  height: 60,
                  child: Container(
                    decoration: BoxDecoration(  
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black,
                          Colors.black.withOpacity(0.1)
                        ]
                      )
                    ),
                  ),

                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  right: 10,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(cityName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 17)),
                          // Text(monthYear,
                          //     style: TextStyle(
                          //         fontWeight: FontWeight.normal,
                          //         color: Colors.white,
                          //         fontSize: 14))
                        ],
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: InkWell(
                                                 child: Icon(
                                                         Icons.search,
                                                         color: Colors.black,
                                                       ),
                         
                                                       onTap: (){
                                                         Navigator.push(context, MaterialPageRoute(builder:(BuildContext context)=> uploadcrop(l) ));
                                                       },
                                                     ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
