import 'package:flutter/material.dart';
import 'package:second_app/screens/details.dart';
import 'package:second_app/screens/myJson.dart';

class MyView extends StatelessWidget{
  final List<MyJson> list;
  MyView(this.list);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 20,
      runSpacing: 20,
      children: list.map((element)=>ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 180,
          height: 170,
          color: Colors.red,
          child: Column(
            children: <Widget>[
              Container(
                width: 180,
                height: 120,
                color: Colors.yellow,
                child: Hero(
                  tag: element.name,
                  child: GestureDetector(
                  onTap: (){goDetails(context, element.name, element.image);},
                  child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(element.image),
                ),
                ),
                ),
              ),
              Container(
                width: 180,
                height: 50,
                color: Color(0xFF353a50),
                child: Center(
                  child: Text(element.name, 
                  overflow: TextOverflow.fade,
                  style: TextStyle(color: Colors.white),),
                  )
              )
            ],
          ),
        ),
      )).toList()
    );
  }

  goDetails(context, mytitle, image){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Details(appTitle: mytitle, image: image);
    }));
  }
}