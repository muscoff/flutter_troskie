import 'package:flutter/material.dart';
import 'package:second_app/screens/restaurant.dart';
import 'package:second_app/screens/art.dart';

class MainScreen extends StatefulWidget{
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{

  List<String> station = List<String>();
  List<String> destination = List<String>();
  String stationValue, destinationValue;
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();


  @override
  void initState(){
    super.initState();
    station.addAll(['Madina', 'Lapaz', '37 Station', 'Tema-Station', 'Nkrumah Circle', 'Kaneshie',
    'Achimota', 'Accra Mall', 'Shangrila']);

    destination.addAll(['Dr Kwame Nkrumah Museum', 'James Town LightHouse','National Museum',
    'National Theatre','University of Ghana','Memorial Centre of African Culture',
    'Independence Square And Arch', 'Usser Fort and Museum','Osu Castle','Legon Botanical Garden',
    'Crystal Park','Memory Lane Park']);

    destinationValue =destination[0];
    stationValue =station[0]; 
  }

  
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffold,
        bottomNavigationBar: bottomNav(onHome, goRestaurant, goArt),
      body: Material(
        child: ListView(
          children: <Widget>[
            topSearch(),
            Card(child: Text('MAIN STATION', style: TextStyle(fontSize: 20),), elevation: 5,),
            mainStationList(),
            ]
        )
      ),
    ),
    );
  }

  mainStationList(){
  return Container(
    child: Column(
    children: station.map((element)=>ListTile(
      leading: Icon(Icons.train),
      trailing: Icon(Icons.time_to_leave),
      title: Text(element),
        )
      ).toList(),
    ),
    );
  }

  topSearch(){
    return Container(
      height: 200,
      color: Colors.amber,
      child: Column(
        children: <Widget>[
          Container(height: 15,),
            stationGo(),
          Container(height: 15,),
            destinationGo(),
          ],
        ),
      );
  }

  destinationGo(){
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white
          ),
        width: 400,
        child: ListTile(
        leading: IconButton(
          onPressed: null,
          icon: Icon(Icons.landscape),
        ),
        title: TextField(
        onSubmitted: (String value){onDestination(value);},
        decoration: InputDecoration(
          hintText: 'Where to?',
        ),
      ),
      ),
      ),
    );
  }

  stationGo(){
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white
          ),
        width: 400,
        child: ListTile(
        leading: IconButton(
          onPressed: null,
          icon: Icon(Icons.arrow_back),
        ),
        title: TextField(
        onSubmitted: (String value){onStation(value);},
        decoration: InputDecoration(
          hintText: 'Station',
        ),
      ),
      ),
      ),
    );
  }

  void onStation(String value){
    setState(() {
     stationValue = value; 
    });
    if(value.isEmpty && destinationValue.isEmpty || value.isEmpty & destinationValue.isNotEmpty)return;
    _scaffold.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  void onDestination(String value){
    setState(() {
     destinationValue = value; 
    });
    if(value.isEmpty && stationValue.isEmpty || value.isEmpty & stationValue.isNotEmpty)return;
    _scaffold.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  void onHome(){
    //_scaffold.currentState.showSnackBar(SnackBar(content: Text('You clicked home'),));

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return MainScreen();
    }));
  }

  void goRestaurant(){
    //_scaffold.currentState.showSnackBar(SnackBar(content: Text('You clicked home'),));
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Restaurant();
    }));
  }

  void goArt(){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Art();
    }));
  }
}

bottomNav(cb, rcb, acb){
  return BottomAppBar(
    child: Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              child: Icon(Icons.home),
              onTap: (){cb();},
            ),
          ),
          Expanded(
            child: GestureDetector(
              child: Icon(Icons.restaurant_menu),
              onTap: (){rcb();},
            ),
            ),
          Expanded(
              child: GestureDetector(
                child: Icon(Icons.settings_applications),
                onTap: (){acb();},
              ),
            )
          ],
        ),
      ),
    color: Colors.amber,
  );
}

