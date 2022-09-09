import 'dart:math';

class Logic {
  double calculateBMI(double height, double weight) {
    double bmi = weight / pow(height, 2);
    return bmi;
  }
}
