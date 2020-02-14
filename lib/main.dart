import 'package:flutter/material.dart';
import 'package:hello_world/home.dart';

void main(){
  runApp(new MyApp());
}

class  MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.red,
        brightness: Brightness.light,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

TextEditingController tt=new TextEditingController();
TextEditingController tt1=new TextEditingController();
  @override
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 7)
    );
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.bounceInOut,);
    _iconAnimation.addListener(()=> this.setState((){}));
    _iconAnimationController.forward();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.green,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            
              image: AssetImage("assets/images/farmer.jpg"),
              
      fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.hardLight,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.local_florist,
                color: Colors.yellowAccent,
                size: _iconAnimation.value * 100,
               
              ),
              new  Form(

                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 4.0),
                                  child: Theme(
                    data: new ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.green,

                    ),
                    
                    child: new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Enter Your Name"
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
                      primarySwatch: Colors.green,
                      brightness: Brightness.dark,
                    ),


                    child: new TextFormField(
                      decoration: new InputDecoration(
                          labelText: "Mobile Number"
                      ),
                      controller: tt1,
                      keyboardType: TextInputType.phone,
                      obscureText: true,
                    ),
                  ),
                ),

              ),
              new Form(
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 4.0),
                                  child: Theme(
                    data: ThemeData(
                      primarySwatch: Colors.green,
                      brightness: Brightness.dark,
                    ),


                    child: new TextFormField(
                      decoration: new InputDecoration(
                          labelText: "Password"
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                  ),
                ),

              ),
              Row(
                              children: <Widget>[
    Padding(padding: EdgeInsets.only(left: 80.0),
          child: new MaterialButton(
  
                      color: Colors.green,
  
                      textColor: Colors.white,
  
                      child: new Text("Login"),
  
                      onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder:(BuildContext context)=> HomeScreen(tt.text,tt1.text) )),
  
  
  
                    ),
    ),
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal: 8.0),
                 ),
                  new MaterialButton(
  
                    color: Colors.green,
  
                    textColor: Colors.white,
  
                    child: new Text("Register"),
  
                    onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder:(BuildContext context)=> HomeScreen(tt.text,tt1.text) )),
  
  
  
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
