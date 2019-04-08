import 'package:flutter/material.dart';
import 'package:second_app/screens/myContentView.dart';
import 'package:second_app/screens/myJson.dart';

class Art extends StatefulWidget{
  _ArtState createState() => _ArtState();
}

class _ArtState extends State<Art>{
  final String appTitle = 'Arts & Culture';
  List<MyJson> list = List<MyJson>();

  @override
  void initState() {
    super.initState();
    list.addAll([
      MyJson(name: 'London', image: 'assets/botanical.jpg'),
      MyJson(name: 'America', image: 'assets/national.jpg'),
      MyJson(name: 'Germany', image: 'assets/crystal.jpg'),
      MyJson(name: 'Canada', image: 'assets/brazil.jpg'),
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.my_location),
        title: Text(appTitle),
        backgroundColor: Color(0xFF2a2e43)),
      body: Material(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: MyView(list),
            )
          ],
        ),
      ),
    );
  }
}