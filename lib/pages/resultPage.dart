
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class resultPage extends StatelessWidget{
  resultPage({@required this.bmiscore,this.bmiresult,this.bmimsg});

  String bmiscore;
  String bmiresult;
  String bmimsg;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("BMI Result"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text("You got",style: TextStyle(fontFamily: 'quicksand',fontSize: 60)),
                    Text(bmiscore,style: TextStyle(fontFamily: 'quicksand',fontSize: 80),),
                    Text(bmiresult,style: TextStyle(fontFamily: 'quicksand',fontSize: 25,color: Colors.white),),
                  ],
                ),
                color: Colors.redAccent,
                margin: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                padding: EdgeInsets.only(left: 50.0,right: 50.0),
              ),
            ),
            Expanded(
              child: Container(
                child: Text(bmimsg,style: TextStyle(fontFamily: 'quicksand',fontSize: 25),),
                color: Colors.redAccent,
                margin: EdgeInsets.only(top: 80.0),
                padding: EdgeInsets.all(10.0),
              ),
            ),
            Expanded(
              child: Container(
                child: GestureDetector(
                  child: Text("Re-calculate BMI",style: TextStyle(fontFamily: 'quicksand',fontSize: 40),),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
                margin: EdgeInsets.only(top: 120.0),
                padding: EdgeInsets.all(10.0),
                color: Colors.redAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}