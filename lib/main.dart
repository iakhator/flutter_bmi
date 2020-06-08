import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/parent_input.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: kBackgroundColor,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      title: 'Startup Name Generator',
      home: Scaffold(
        // backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: ParentInput()
      ),
    );
  }
}
