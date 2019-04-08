import 'package:flutter/material.dart';
import 'package:second_app/screens/details.dart';
import 'package:second_app/screens/myJson.dart';

class Restaurant extends StatelessWidget{
  final String continental = 'Continental', local = 'African';
  final String title = 'RESTAURANT';
  final List<MyJson> mylist = <MyJson>[
    MyJson(name: 'London', image: 'assets/botanical.jpg'),
    MyJson(name: 'Manhattan', image: 'assets/brazil.jpg'),
    MyJson(name: 'Los Angeles', image: 'assets/national.jpg'),
    MyJson(name: 'Colorado', image: 'assets/crystal.jpg'),
  ];

  final List<MyJson> localList = <MyJson>[
    MyJson(name: 'Barcelos', image: 'assets/botanical.jpg'),
    MyJson(name: 'Koffee Lounge', image: 'assets/brazil.jpg'),
    MyJson(name: 'Rhapsody', image: 'assets/national.jpg'),
    MyJson(name: 'Maachi Dessert', image: 'assets/crystal.jpg'),
  ];
  //final List<String> mylist = ['Barcelos', 'Koffee Lounge', 'Rhapsody', 'Maachi Dessert',];

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
            Padding(child: MyListView(localList),padding: EdgeInsets.only(left: 10, right: 10),),
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
  final List<MyJson> list;
  MyListView(this.list);

  void goNext(context, textTitle, image){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Details(appTitle: textTitle, image: image);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: list.map((element)=>ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 180,
                width: 200,
                color: Color(0xFF2a2e43),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 130,
                      width: 200,
                      color: Color(0xFF2a2e43),
                      child: Hero(
                        tag: element.name,
                        child: GestureDetector(
                        onTap: (){goNext(context, element.name, element.image);},
                        child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(element.image),
                        )
                      ),
                      )
                    ),
                    Container(
                      width: 200,
                      height: 50,
                      color: Color(0xFF353a50),
                      child:Center(
                        child: Text(element.name, 
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
