import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mybmi/logic/bmi_logic.dart';
import 'package:mybmi/pages/resultPage.dart';
enum Gender {
  boy,
  girl,
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Gender selectedGender;
  double height = 150.0;
  int weight = 50;
  int age = 10;
  int picState = 0;
  @override
  Widget build(BuildContext context) {
    double wide = MediaQuery.of(context).size.width;
    return Scaffold(
    appBar: AppBar(
      title: Text("BMI Calculator"),
      ),
    body: Column(
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: SelectCard(co: Colors.redAccent,pressEvent: () {
                    setState(() {
                      selectedGender = Gender.boy;
                    });},type: "man",picState: (selectedGender == Gender.boy ? 1 : 0),),
              ),
              Expanded(
                child: SelectCard(co: Colors.redAccent,pressEvent: () {
                  setState(() {
                    selectedGender = Gender.girl;
                  });},type: "Noman",picState: (selectedGender == Gender.girl ? 1 : 0),),
              ),
            ],
          ),
        ),
        Container(
          width: wide-50.0,
          padding: EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(5.0)
          ),
          child: Column(
            children: <Widget>[
              Text("Height",style: TextStyle(fontFamily: 'quicksand',fontSize: 30),),
              Text(height.round().toString()+'cm',style: TextStyle(fontFamily: 'quicksand',fontSize: 20)),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: Colors.black,
                  activeTrackColor: Colors.white,
                  thumbColor: Colors.blue,
                  overlayColor: Colors.blue[300],
                  thumbShape:
                  RoundSliderThumbShape(enabledThumbRadius: 10.0),
                  overlayShape:
                  RoundSliderOverlayShape(overlayRadius: 15.0),
                ),
                child: Slider(
                  value: height,
                  min: 100.0,
                  max: 200.0,
                  onChanged: (double n){
                    setState(() {
                      height = n;
                  });
                  },
                ),
              )
            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text("Weight",style: TextStyle(fontFamily: 'quicksand',fontSize: 30),),
                      Row(
                        children: <Widget>[
                          SelectClick(type:1,func:(){
                            setState(() {
                              if(weight<=1)weight=1;
                              else weight--;
                            });}),
                          Container(width: 10.0,),
                          Text(weight.toString(),style: TextStyle(fontFamily: 'quicksand',fontSize: 20,)),
                          Container(width: 10.0,),
                          SelectClick(type:0,func:(){
                            setState(() {
                              if(weight>=99)weight=99;
                              else weight++;
                            });}),
                        ],
                      )
                    ],
                  )
              ),
              Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text("Age",style: TextStyle(fontFamily: 'quicksand',fontSize: 30),),
                      Row(
                        children: <Widget>[
                          SelectClick(type:1,func:(){
                            setState(() {
                              if(age<=1)age=1;
                              else age--;
                            });}),
                          Container(width: 10.0,),
                          Text(age.toString(),style: TextStyle(fontFamily: 'quicksand',fontSize: 20,)),
                          Container(width: 10.0,),
                          SelectClick(type:0,func:(){
                            setState(() {
                              if(age>=99)age=99;
                              else age++;
                            });}),
                        ],
                      )
                    ],
                  )
              )
            ],
          ),
        ),
        Expanded(
          child: Container(child: ResultClick(func: (){
            setState(() {
              calculateBMI bmi1 = calculateBMI(high: height,mass: weight);
              Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => resultPage(
                  bmiscore: bmi1.getBMI(),
                  bmiresult: bmi1.getResult(),
                  bmimsg: bmi1.getResultMsg(),
                )
              ));
            });
          }),)
        )
      ],
    ),
    );
  }
}

class SelectCard extends StatelessWidget{
  SelectCard({@required this.co,this.pressEvent,this.type,this.picState});

  String type;
  Color co;
  Function pressEvent;
  int picState = 0;
  @override
  Widget build(BuildContext context) {
    double wide = MediaQuery.of(context).size.width;
    double high = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: pressEvent,
      child: Container(
        child: Column(children: <Widget>[
          Image(image: AssetImage( (type=='man') ? ((picState==0) ? "assets/man.png":"assets/man_sel.png"):((picState==0) ? "assets/wom.png":"assets/wom_sel.png"))),
          Text((type=='man')? "Man":"Woman",style: TextStyle(color: (picState==0) ? Colors.black : Colors.blueAccent,fontFamily: 'quicksand',fontSize: 30))
        ],
        ),
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: co,
          borderRadius: BorderRadius.circular(5.0),
        )
      ),
    );
  }
}
class SelectClick extends StatelessWidget{
  SelectClick({@required this.type,this.func});

  int type;
  Function func;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RawMaterialButton(
      child: Image(image: AssetImage((type==0) ? 'assets/plus.png' : 'assets/minus.png' ),),
      onPressed: func,
      constraints: BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0
      ),
    );
  }
}
class ResultClick extends StatelessWidget{
  ResultClick({@required this.func});

  Function func;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: func,
      child: Container(
        child: Center(
          child: Text("Calculate BMI",style: TextStyle(fontFamily: 'quicksand',fontSize: 40),),
        ),
        color: Colors.redAccent,
        margin: EdgeInsets.only(top: 50.0),
      )
    );
  }
}