import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Color(0xFF0d101f),
            secondary: Colors.purple,
          ),
          scaffoldBackgroundColor: Color(0xFF0d101f)),
      home: InputPage(),
    );
  }
}
