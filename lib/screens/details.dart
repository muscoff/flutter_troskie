import 'package:flutter/material.dart';

class Details extends StatefulWidget{
  String appTitle;
  String image;
  Details({this.appTitle, this.image});
  DetailState createState() => DetailState();
}

class DetailState extends State<Details>{
  String appTitle;
  String image;
  //Details({this.appTitle, this.image});

  String description = 'We are a chinese restaurant but we also serve Ghanaian dishes.';
  String contact = '+233-247-899-003';

  GlobalKey<ScaffoldState> scaf = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    appTitle = widget.appTitle;
    image = widget.image;
  }

  void fuck(){
    scaf.currentState.showSnackBar(SnackBar(
      content: Text('Empire State of Mind'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaf,
      // appBar: AppBar(
      //   backgroundColor: Colors.amber,
      //   title: Text(appTitle, overflow: TextOverflow.fade, 
      //   style: TextStyle(color: Colors.deepPurple),),),
      body: Material(
        color: Color(0xFF2a2e43),
        child: ListView(
          children: <Widget>[
            ImageText(appTitle: appTitle, image: image),
            DescriptionTitle(),
            Description(description),
            ContactDetail(contact),
            MyButton(fuck)
          ],
        ),
      ),
    );
  }
}


class ImageText extends StatelessWidget{
  final String appTitle;
  final String image;
  ImageText({this.appTitle, this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Hero(
      tag: appTitle,
      child:Card(
      child: Image(
        image: AssetImage(image),fit: BoxFit.contain,
        ),
      )
    ),
    Positioned(
      bottom: 1,
      right: 0,left: 0,
      child: Container(
      //color: Colors.amber,
      child: Center(
        child: Text(appTitle, overflow: TextOverflow.fade, 
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
      ),
    ),
    )
      ],
    );
  }
}

class DescriptionTitle extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 35),
      child: Text('Description', 
      style: TextStyle(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }
}

class Description extends StatelessWidget{
  final String description;
  Description(this.description);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 10, right: 10),
      child: Text(description, 
      style: TextStyle(fontSize: 15, color: Colors.white),
      ),
    );
  }
}

class ContactDetail extends StatelessWidget{
  final String contact;
  ContactDetail(this.contact);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 35, left: 10, right: 10, bottom: 50),
      child: Card(
        color: Color(0xFF2a2e43),
        elevation: 2,
        child: Row(
        children: <Widget>[
          Expanded(
            child: Icon(Icons.contact_phone, size: 35, color: Colors.white,),flex: 1,),
          Expanded(child: 
          Text(contact, style: TextStyle(fontSize: 15, color: Colors.white),),flex: 3,)
        ],
      ),
      )
    );
  }
}

class MyButton extends StatelessWidget{
  final Function fuck;
  MyButton(this.fuck);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20, right: 20, left: 20),
      child: RawMaterialButton(
      splashColor: Colors.amberAccent,
      //shape: BeveledRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(10, 15))),
      shape: UnderlineInputBorder(borderRadius: BorderRadius.circular(20)),
      //shape: StadiumBorder(),
      elevation: 6,
      onPressed: (){fuck();},
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
    );
  }
}
