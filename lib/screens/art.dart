import 'package:flutter/material.dart';

class Art extends StatelessWidget{
  final String appTitle = 'Arts & Culture';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appTitle),),
      body: Material(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: myContent(),
            )
          ],
        ),
      ),
    );
  }

  myContent(){
    return Wrap(
              direction: Axis.horizontal,
              spacing: 20,
              runSpacing: 20,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    width: 180,
                    height: 200,
                    color: Colors.red,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 180,
                          height: 130,
                          color: Colors.yellow,
                          child: Image(
                            fit: BoxFit.scaleDown,
                            image: AssetImage('assets/botanical.jpg'),
                          ),
                        ),
                        Container(
                          width: 180,
                          height: 70,
                          color: Colors.green,
                          child: Center(child: Text('Colro', overflow: TextOverflow.fade,),),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
  }
}