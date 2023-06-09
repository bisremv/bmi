import 'dart:math';

class calculatorBrain {
  calculatorBrain(this.height, this.weight);
  final int height;
  final int weight;
  double _bmi = 0;
  String calculateBmi() {
    double _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getresult() {
    if (_bmi >= 25) {
      return 'overWeigth';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'underWeigth';
    }
  }

  String getinterpretation() {
    if (_bmi >= 25) {
      return 'you have higher than normal body wigth';
    } else if (_bmi > 18.5) {
      return 'you have  normal body wigth';
    } else {
      return 'you have lower than normal body wigth';
    }
  }
}
