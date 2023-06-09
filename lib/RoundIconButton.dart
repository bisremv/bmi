import 'package:flutter/material.dart';
import 'constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required Function this.changeweight});
  final IconData icon;
  Function changeweight;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      child: Icon(icon),
      elevation: 6,
      disabledElevation: 6,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      fillColor: Color(0xFF4c4f5e),
      onPressed: () {
        changeweight();
      },
    );
  }
}
