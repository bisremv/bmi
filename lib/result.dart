import 'package:dicee/ReusableCard.dart';
import 'package:dicee/constants.dart';
import 'package:flutter/material.dart';
import 'bottomButton.dart';

class Result extends StatelessWidget {
  final String bmiResult;
  final String bmiText;
  final String interpretation;
  Result(
      {required this.bmiResult,
      required this.bmiText,
      required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Container(
                  child: Text(
                    "Your Result",
                    style: kTitleTextStyle,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                  kcontainerColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        bmiText.toUpperCase(),
                        style: kResultTextStyle,
                      ),
                      Text(bmiResult, style: kBmiTextStyle),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: kbodyTextStyle,
                      )
                    ],
                  ),
                  () {}),
            ),
            Expanded(
              child: BottomButton("RE-Calculate", () {
                Navigator.pop(context);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
