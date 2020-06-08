import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/reuseable_card.dart';
import 'package:bmi_calculator/constants.dart';

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
  double _value = 180.0;
  void _setvalue(double value) => setState(() => _value = value);

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
                    child: ReuseableCard(
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
                    child: ReuseableCard(
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
            child: ReuseableCard(
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
                        '${_value.round()}',
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
                      value: _value,
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
                  child: ReuseableCard(color: kActiveCardColor),
                ),
                Expanded(
                  child: ReuseableCard(color: kActiveCardColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
