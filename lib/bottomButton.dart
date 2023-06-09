import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  String name;
  Function onpress;
  BottomButton(this.name, this.onpress);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onpress();
      },
      child: Container(
        child: Center(
          child: Text(
            name,
            style: klargeBUttonTextstyle,
            textAlign: TextAlign.center,
          ),
        ),
        color: kbottomcontainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kbottomcontainerheight,
      ),
    );
  }
}
