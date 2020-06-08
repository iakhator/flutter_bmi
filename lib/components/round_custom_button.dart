import 'package:flutter/material.dart';

class RoundCustomButton extends StatelessWidget {
  RoundCustomButton({@required this.onPressed, @required this.icon});
  final GestureTapCallback onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Color(0xFF24263f),
      elevation: 1.0,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: icon,
      ),
      onPressed: onPressed,
      shape: CircleBorder(),
    );
  }
}
