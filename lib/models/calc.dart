import 'package:flutter/foundation.dart';

class Calc with ChangeNotifier {
  String display = '0';
  String operation = '';
  bool isPositive = true;
  List<String> numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  void setDisplay(String value) {
    if (value == 'C') {
      clean();
    } else if (value == '.') {
      setDot(value);
    } else if (numbers.contains(value)) {
      concatenate(value);
    } else if (value == '+-') {
      negative(value);
    }
  }

//clean display
  void clean() {
    display = '0';
    isPositive = true;
    notifyListeners();
  }

//add dot
  void setDot(String value) {
    if (!display.contains('.') && display == '0') {
      display = '0.';
    } else if (!display.contains('.') && display != '0') {
      display = display + value;
    }
    notifyListeners();
  }

  void concatenate(String value) {
    if (display == '0') {
      display = value;
    } else if (value != '0') {
      display = display + value;
    }
    notifyListeners();
  }

  void negative(String value) {
    if (display != '0' && isPositive) {
      display = '-' + display;
    } else if (display != '0' && !isPositive) {
      display = display.substring(1, display.length);
    }
    isPositive = !isPositive;
    notifyListeners();
  }
}
