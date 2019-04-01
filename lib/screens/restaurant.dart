import 'package:flutter/material.dart';
import 'package:second_app/screens/details.dart';

class Restaurant extends StatelessWidget{
  final String continental = 'Continental', local = 'African';
  final String title = 'RESTAURANT';
  final List<String> mylist = ['Barcelos', 'Koffee Lounge', 'Rhapsody', 'Maachi Dessert',];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2a2e43),
        leading: Icon(Icons.restaurant_menu,color: Colors.white,),
        title: Text(title, style: TextStyle(fontSize: 25, color: Colors.white),),
        ),
      body: Material(
        color: Color(0xFF2a2e43),
        child: ListView(
          children: <Widget>[
            Padding(child: myTitle(continental),padding: EdgeInsets.only(left: 10),),
            Padding(child: MyListView(mylist),padding: EdgeInsets.only(left: 10, right: 10),),
            Container(height: 50),
            Padding(child: myTitle(local),padding: EdgeInsets.only(left: 10),),
            Padding(child: MyListView(mylist),padding: EdgeInsets.only(left: 10, right: 10),),
            Container(height: 50),
          ],
        ),
      ),
    );
  }

  myTitle(text){
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Text(text, style: TextStyle(fontSize: 20, color: Colors.white),),
    );
  }
}

class MyListView extends StatelessWidget{
  final List<String> list;
  MyListView(this.list);

  void goNext(context, textTitle){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Details(textTitle);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: list.map((element)=>ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 220,
                width: 200,
                color: Color(0xFF2a2e43),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 150,
                      width: 200,
                      color: Color(0xFF2a2e43),
                      child: GestureDetector(
                        onTap: (){goNext(context, element);},
                        child: Image(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/botanical.jpg'),
                      ),
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 70,
                      color: Color(0xFF353a50),
                      child:Center(
                        child: Text(element, 
                        style: TextStyle(fontSize: 15, 
                        color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                        ),
                      )
                    )
                  ],
                ),
              ),
            )).toList(),
          )
        ],
      )
    );
  }
}
