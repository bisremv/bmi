import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget childcontainer;
  final Function gester;
  ReusableCard(
      Color this.colour, Widget this.childcontainer, Function this.gester) {
    // throw UnimplementedError();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        gester();
      },
      child: Container(
        child: childcontainer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
        margin: EdgeInsets.all(15),
      ),
    );
  }
}
