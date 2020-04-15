import 'package:flutter/cupertino.dart';
import 'dart:math';

class calculateBMI{
  calculateBMI({this.high,this.mass,});

  double high;
  int mass;
  double result;

  String getBMI(){
    result = mass / pow(high/100,2);
    return result.toStringAsFixed(1);
  }
  String getResult() {
    if (result >= 25) {
      return 'Overweight';
    } else if (result > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getResultMsg() {
    if (result >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (result >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
