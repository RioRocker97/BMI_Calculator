import 'package:flutter/material.dart';
import 'package:mybmi/pages/mainPage.dart';
void main() => runApp(MainBMI());

class MainBMI extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent
      ),
      home: MainPage(),
    );
  }
}