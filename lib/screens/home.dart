import 'package:flutter/material.dart';
import 'package:second_app/screens/first.dart';

class Home extends StatelessWidget{
  final String _troskie = 'Troskie', _getStarted = 'Get Started';
  void goInfo(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return First();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Color(0xFFfbb41a),
        child: Stack(
          children: <Widget>[
            myTitle(_troskie),
            myImage('assets/logo.png'),
            myButton(goInfo,context,_getStarted),
        ],
      ),
    );
  }
}

myTitle(String text){
  return Positioned(
    left: 150.0,
    right: 150.0,
    top: 150,
    child: Container(
      child: Text(text, 
      style:TextStyle(
        fontFamily: 'Sweet', 
        fontSize: 42.0, 
        color: Color(0xFF6d2674)
        )
      ),
    ),
  );
}

myImage(String image){
  return Positioned(
    left: 26.0,
    right: 26.0,
    top: 80.0,
    child: Container(
      child: Image.asset(image),
    ),
  );
}

myButton(cb,context,text){
  return Positioned(
    left: 26.0,
    right: 26.0,
    bottom: 50.0,
    child: RawMaterialButton(
      shape: StadiumBorder(),
      fillColor: Color(0xFFb32cc1),
      onPressed: (){
        cb(context);
      },
      child: Padding(
        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: Text(text.toUpperCase(), style: TextStyle(fontSize: 20, color: Colors.white),),
      ),
    ),
  );
}

void flightBook(BuildContext context){
    var alertdialog = AlertDialog(
      content: Text('Have a pleasant flight'),
      title: Text('Brussels Airline'),
    );

    showDialog(
      context: context,
      builder: (BuildContext context){
        return alertdialog;
      }
    );
  }