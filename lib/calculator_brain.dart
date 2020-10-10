import 'dart:math';

class CalculatorBrain {
  int height;
  int weight;
  double _bmi;
  CalculatorBrain({this.height, this.weight});
  String calculateBMI() {
    _bmi = weight * 100 * 100 / pow(height, 2);
    return _bmi.toStringAsFixed(2);
  }

  String result() {
    if (_bmi > 25) {
      return 'OVERWEIGHT';
    } else if (_bmi < 18.5) {
      return 'UNDERWEIGHT';
    } else {
      return 'NORMAL';
    }
  }

  String advice() {
    if (_bmi > 25) {
      return 'Woah. Cut down on the food dude.';
    } else if (_bmi < 18.5) {
      return 'Eat something. Anything.';
    } else {
      return 'You\'re the definition of perfection. Congrats.';
    }
  }
}
