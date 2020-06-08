import 'package:flutter/material.dart';
import 'constants.dart';

class ReuseableCard extends StatelessWidget {
  ReuseableCard({this.color, this.cardChild});

  final Color color;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: cardChild,
    );
  }
}
