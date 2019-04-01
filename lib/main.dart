import 'package:flutter/material.dart';
import 'package:second_app/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Home(),
      ),
    );
  }
}