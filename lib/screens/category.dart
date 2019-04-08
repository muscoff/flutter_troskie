import 'package:flutter/material.dart';
import 'package:second_app/screens/art.dart';

class MyCategory extends StatefulWidget{
  _MyCategoryState createState() => _MyCategoryState();
}

class _MyCategoryState extends State<MyCategory>{
  final String appTitle = 'Categories';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){moveBack();},
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Color(0xFF2a2e43),
          icon: Icon(Icons.arrow_back),
          onPressed: (){moveBack();},
        ),
        title: Text(appTitle, style: TextStyle(fontSize: 22, color: Color(0xFF2a2e43)),),
        ),
      body: Material(
        child: ListView(
          children: <Widget>[
            MyList(appTitle: 'Arts & Culture',goPage: goArt)
          ],
        ),
      ),
    ),
    );
  }

  moveBack(){
    Navigator.pop(context);
  }

  void goArt(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Art()));
  }
}

class MyList extends StatelessWidget{
  final String appTitle;
  final Function goPage;
  MyList({this.appTitle, this.goPage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
      title: Text(appTitle),
      onTap: (){goPage();},
    ),
    Container(height: 1,color: Colors.grey,)
      ],
    );
  }
}