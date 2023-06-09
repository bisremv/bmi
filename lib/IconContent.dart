import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  IconContent(this.icong, this.gender) {}
  final IconData icong;
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icong,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "$gender",
          style: klabelTextStyle,
        ),
      ],
    );
  }
}
