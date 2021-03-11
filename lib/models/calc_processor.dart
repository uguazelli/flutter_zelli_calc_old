import 'package:flutter/foundation.dart';
import 'dart:math';

class CalcProcessor with ChangeNotifier {
  String display = '0';
  String saved = '';
  String operation = '';
  bool isPositive = true;
  int easterEggCount = 0;
  List<String> numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  void setDisplay(String val) {
    if (val == '=') {
      easterEgg();
    } else {
      easterEggCount = 0;
    }
    if (val == 'C') {
      clean();
    } else if (val == '.') {
      setDot(val);
    } else if (val == '±') {
      sign(val);
    } else if (numbers.contains(val)) {
      concatenate(val);
    } else if (['+', '-', 'x', '÷', '='].contains(val)) {
      operate(val);
    } else if (val == '%') {
      percent();
    } else if (val == '√') {
      squareRoot();
    }
  }

//clean display
  void clean() {
    display = '0';
    operation = '';
    saved = '';
    isPositive = true;
    notifyListeners();
  }

//add dot
  void setDot(String val) {
    if (saved != '') {
      if (!display.contains('.') && display == '0') {
        display = '0.';
      } else if (!display.contains('.') && display != '0') {
        display = display + val;
      }
    }

    notifyListeners();
  }

  void sign(String val) {
    display = (double.parse(display) * -1).toString();
    notifyListeners();
  }

  void concatenate(String val) {
    if (operation != '') {
      if (saved != '') {
        display = display == '0' ? val : display + val;
      } else {
        saved = display;
        display = val;
      }
    } else {
      display = display == '0' ? val : display + val;
    }
    notifyListeners();
  }

  void operate(String val) {
    if (saved != '') {
      if (operation == '+')
        display = (double.parse(saved) + double.parse(display)).toString();
      else if (operation == '-')
        display = (double.parse(saved) - double.parse(display)).toString();
      else if (operation == 'x')
        display = (double.parse(saved) * double.parse(display)).toString();
      else if (operation == '÷')
        display = (double.parse(saved) / double.parse(display)).toString();
    }
    operation = val;
    saved = '';
    notifyListeners();
  }

  void percent() {
    if (operation == '+' || operation == '-') {
      display = (double.parse(saved) * double.parse(display) / 100).toString();
    }
    if (operation == 'x' || operation == '÷') {
      display = (double.parse(display) / 100).toString();
    }
    notifyListeners();
  }

  void squareRoot() {
    display = sqrt(double.parse(display)).toString();
    notifyListeners();
  }

  easterEgg() {
    easterEggCount++;
    if (easterEggCount == 10) {
      display = 'AIDA,\nYOU ARE SO BEAUTIFUL!';
    }
    notifyListeners();
  }
}
