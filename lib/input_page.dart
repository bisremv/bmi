import 'package:dicee/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableCard.dart';
import 'IconContent.dart';
import 'constants.dart';
import 'RoundIconButton.dart';
import 'bottomButton.dart';
import 'calculaterBrain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kcontainerColor;
  Color femaleCardColor = kcontainerColor;
  int height = 180;
  int Weight = 60;
  int age = 19;
  Gender? selectedgender = null;

  Function Gester(Gender selected) {
    return () {
      setState(() {
        selectedgender = selected;
      });
    };
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        selectedgender == Gender.male
                            ? kinactivecardColor
                            : kcontainerColor,
                        IconContent(FontAwesomeIcons.mars, "Male"),
                        Gester(Gender.male)),
                  ),
                  Expanded(
                    child: ReusableCard(
                        selectedgender == Gender.female
                            ? kinactivecardColor
                            : kcontainerColor,
                        IconContent(FontAwesomeIcons.venus, "Female"),
                        Gester(Gender.female)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                  kcontainerColor,
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Height",
                        style: klabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toString(), style: kNumberTextStyle),
                          Text(
                            "cm",
                            style: klabelTextStyle,
                            textAlign: TextAlign.end,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8d8e98),
                          thumbColor: Color(0xfBfb1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          max: 220,
                          min: 120,
                          onChanged: (double newvalue) {
                            setState(() {
                              height = newvalue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  () {}),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        kcontainerColor,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Weight",
                              style: klabelTextStyle,
                            ),
                            Text(
                              Weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    changeweight: () {
                                      setState(() {
                                        Weight--;
                                      });
                                    }),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    changeweight: () {
                                      setState(() {
                                        Weight++;
                                      });
                                    }),
                              ],
                            )
                          ],
                        ),
                        () {}),
                  ),
                  Expanded(
                    child: ReusableCard(
                        kcontainerColor,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Age",
                              style: klabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    changeweight: () {
                                      setState(() {
                                        age--;
                                      });
                                    }),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    changeweight: () {
                                      setState(() {
                                        age++;
                                      });
                                    }),
                              ],
                            )
                          ],
                        ),
                        () {}),
                  ),
                ],
              ),
            ),
            BottomButton("Calculate", () {
              setState(() {
                calculatorBrain calc = calculatorBrain(height, Weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Result(
                        bmiResult: calc.calculateBmi(),
                        bmiText: calc.getresult(),
                        interpretation: calc.getinterpretation(),
                      );
                    },
                  ),
                );
              });
            }),
          ]),
    );
  }
}

enum weigthOperation { add, minus }
