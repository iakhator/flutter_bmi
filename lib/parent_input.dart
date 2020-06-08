import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'round_custom_button.dart';
import 'button_button.dart';
import 'results_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class ParentInput extends StatefulWidget {
  @override
  _ParentInputState createState() => _ParentInputState();
}

enum Gender {
  male,
  female,
}

class _ParentInputState extends State<ParentInput> {
  Gender genderSelected;
  double _height = 180.0;
  int _weight = 30;
  int _age = 2;
  void _setvalue(double value) => setState(() => _height = value);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        genderSelected = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      color: genderSelected == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(FontAwesomeIcons.mars, size: 90.0),
                          SizedBox(height: 15),
                          Text(
                            'MALE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        genderSelected = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      color: genderSelected == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(FontAwesomeIcons.venus, size: 80.0),
                          SizedBox(height: 15),
                          Text(
                            'FEMALE',
                            style: kGenderTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kTextStyleGray,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '${_height.round()}',
                        style: kTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kTextStyleGray,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: kSliderActiveColor,
                      inactiveTrackColor: kSliderInactiveColor,
                      thumbColor: kSliderThumbColor,
                      overlayColor: kSliderThumbOverlay,
                    ),
                    child: Slider(
                      value: _height,
                      onChanged: _setvalue,
                      min: 150.0,
                      max: 200.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kTextStyleGray,
                        ),
                        Text(
                          '$_weight',
                          style: kTextStyle,
                        ),
                        Row(
                          children: <Widget>[
                            RoundCustomButton(
                              onPressed: () {
                               setState(() {
                                 _weight -= 1;
                               },);
                              },
                              icon: Icon(
                                FontAwesomeIcons.minus,
                                size: 30.0,
                              ),
                            ),
                            RoundCustomButton(
                              onPressed: () {
                               setState(() {
                                 _weight += 1;
                               },);
                              },
                              icon: Icon(
                                FontAwesomeIcons.plus,
                                size: 30.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kTextStyleGray,
                        ),
                        Text(
                          '$_age',
                          style: kTextStyle,
                        ),
                        Row(
                          children: <Widget>[
                            RoundCustomButton(
                              onPressed: () {
                               setState(() {
                                 _age -= 1;
                               },);
                              },
                              icon: Icon(
                                FontAwesomeIcons.minus,
                                size: 30.0,
                              ),
                            ),
                            RoundCustomButton(
                              onPressed: () {
                               setState(() {
                                 _age += 1;
                               },);
                              },
                              icon: Icon(
                                FontAwesomeIcons.plus,
                                size: 30.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

           BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: _height, weight: _weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
