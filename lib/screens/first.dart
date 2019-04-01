import 'package:flutter/material.dart';
import 'package:second_app/screens/mainScreen.dart';

class First extends StatelessWidget{
  final String text1 = 'Freemovement is a directory of commercial buses(Trotro) routes from the various main Stations in Accra to selected destinations in Accra';
  final String text2 = 'Some of the destinations include tourist sites, restaurants, beaches, museums, etc';
  final String text3 = 'We strongly advice you to employ other map applications or ask the local around once you arrive at the stop closer to your final destination';
  
  // void goNext(BuildContext context){
  //   //Navigator.of(context).pushNamedAndRemoveUntil('/MainScreen', (Route<dynamic>route)=>false);
  //   Navigator.of(context).pushNamed('/MainScreen');
  // }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(scrollDirection: Axis.horizontal,
        children: <Widget>[
          ViewList(content:text1),
          ViewList(content:text2),
          ViewList(content:text3, button:true)
        ],
      ),
    );
  }
}

class ViewList extends StatelessWidget{
  final String text='Troskie', content;
  final bool btn = false, button; 
  ViewList({Key key, this.content, this.button=false}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          myText(text),
          image('assets/logo.png'),
          textContent(content),
          button?myBtn(goNext, context):Text('')
        ],
      ),
    );
  }

  goNext(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return MainScreen();
    }));
  }

  myText(String text){
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Sweet', 
        color: Color(0xFF6d2674),
        fontSize: 42.0
        ),
    );
  }

  image(String image){
    return Padding(
      padding: EdgeInsets.only(top: 30, bottom: 20),
      child: FadeInImage(
        placeholder: AssetImage(image),
        image: AssetImage(image),
      ),
    );
  }

  textContent(String text){
    return Padding(
      padding: EdgeInsets.all(5.0),
        child: Center(
          child: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),
        ),
    );
  }

  myBtn(cb, context){
    return Padding(
      padding: EdgeInsets.only(top: 60),
      child: RawMaterialButton(
      onPressed: (){cb(context);},
      fillColor: Color(0xFFb32cc1),
      shape: StadiumBorder(),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Container(
          width: 200,
          child: Center(
            child: Text('Begin', style: TextStyle(fontSize: 25, color: Colors.white),)
          ),
        ),
      ),
    ),
    );
  }
}
