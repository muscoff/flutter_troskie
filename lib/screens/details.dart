import 'package:flutter/material.dart';

class Details extends StatelessWidget{
  final String appTitle;
  Details(this.appTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(appTitle,
        overflow: TextOverflow.fade, 
        style: TextStyle(color: Colors.deepPurple),),
        ),
      body: Material(
        color: Color(0xFF2a2e43),
        child: ListView(
          children: <Widget>[
            Card(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Image(fit: BoxFit.contain,image: AssetImage('assets/botanical.jpg'),)
                  ),
                  Positioned(
                    child: Container(
                      color: Colors.amber,
                      child: Center(
                        child: Text(appTitle, 
                        style: TextStyle(fontSize: 30, fontFamily: 'Sweet',),
                        overflow: TextOverflow.fade,)
                        ),
                      ),
                    bottom: 0,
                    left: 20,
                    right: 20,
                  )
                ],
              ),
            ),
            //Center(
            //  child: 
            Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 35),
                    child: Text('Description', 
                    style: TextStyle(
                      fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                  )
                  ]),
                  Padding(
                    padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                    child: Text('We are a chinese restaurant but we also serve Ghanaian dishes.', 
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 35, left: 10, right: 10, bottom: 50),
                    child: Card(
                      color: Color(0xFF2a2e43),
                      elevation: 2,
                      child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Icon(Icons.contact_phone, size: 35, color: Colors.white,),flex: 1,),
                        Expanded(child: 
                        Text('+233-247-899-003', style: TextStyle(fontSize: 15, color: Colors.white),),flex: 3,)
                      ],
                    ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: RawMaterialButton(
                    splashColor: Colors.amberAccent,
                    shape: StadiumBorder(),
                    elevation: 6,
                    onPressed: (){},
                    fillColor: Color(0xFF3acce1),
                    child: Container(
                      width: 300,
                      height: 50,
                      child: Center(
                        child: Text('Go There',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  )
                ],
              )
              //)
          ],
        ),
      ),
    );
  }
}