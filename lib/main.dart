// import 'package:flutter/material.dart';
// import 'package:second_app/screens/home.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SafeArea(
//         child: Home(),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// //import 'package:second_app/screens/home.dart';
// import 'package:second_app/mymap.dart';
// //import 'package:second_app/del.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'dart:async';

// //import 'package:google_maps_flutter/google_maps_flutter.dart';


// //void main() => runApp(MyApp());

// class Post{
//   int id;
//   String station;
//   Post({this.id, this.station});

//   factory Post.fromJson(Map<String, dynamic> json){
//     return Post(
//       id: json['id'],
//       station: json['station']
//     );
//   }

// }

// void main(){
//   runApp(MyApp());

// }

// class MyApp extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return _MyAppState();
//   }
// }

// class _MyAppState extends State<MyApp>{
//   List data;

//   Future<dynamic> fetchPost() async {
//     var res = await http.get('https://freemvt.000webhostapp.com/stationApi.php');

//     if(res.statusCode == 200){
//       print(res.body);
//       setState(() {
//        data = jsonDecode(res.body);
//       });
//       //return Post.fromJson(json.decode(res.body));
//     }else{
//       print('problem');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchPost();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SafeArea(
//         //child: Home(),
//         //child: MyDel(),
//         //child: MyMap(),
//         child: Scaffold(
//           body: Center(
//             child: ListView.builder(
//               itemCount: data==null?0:data.length,
//               itemBuilder: (BuildContext context, int index){
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                   Text('id: ${data[index]['id']}'),
//                   Text('id: ${data[index]['station']}')
//                 ],);
//               },
//             )
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  GoogleMapController _mapcontrol;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My Map'),),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(24.142, -110.321),
                zoom: 10
              ),
              onMapCreated: (controller){
                _mapcontrol = controller;
              },
              myLocationEnabled: true,
            ),
            // Text('Hi')
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class MyJson{
//   final String title;
//   final String image;
//   MyJson({this.title, this.image});
// }

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget{
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp>{
//   List<MyJson> server = [
//     MyJson(title: 'Barcelos', image: 'assets/logo.png'),
//     MyJson(title: 'Koffee Lounge', image: 'assets/botanical.jpg'),
//     MyJson(title: 'Kukun', image: 'assets/logo.png'),
//     MyJson(title: 'Rhapsody', image: 'assets/botanical.jpg'),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: ListView.builder(
//           itemCount: server.length,
//           itemBuilder: (BuildContext context, int index){
//             return Container(
//               child: Column(
//                 children: <Widget>[
//                   Card(child: Image.asset(server[index].image),),
//                   Text(server[index].title),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Myss(),
//     );
//   }
// }

// class Myss extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: Column(
//         children: <Widget>[
//           Text('data'),
//           Container(
//             width: 200,
//             height: 200,
//             child: Hero(
//             tag: 'pussy',
//             child: GestureDetector(
//               onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>GoMussy())),
//               child: Image.asset('assets/botanical.jpg'),
//             ),
//           ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class GoMussy extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Hero(
//             child: Image.asset('assets/botanical.jpg'),
//             tag: 'pussy',
//           ),
//           Text('Hi Data')
//         ],
//       ),
//     );
//   }
// }
