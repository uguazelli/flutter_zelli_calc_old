import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TempProcessor with ChangeNotifier {
  String c = '0';
  String f = '0';
  String activatedLabel = 'c';
  bool labelChanged = true;

// Activating labe to recieve values from keyboard
  void setActiveLabel(String label) {
    activatedLabel = label;
    labelChanged = true;
    notifyListeners();
  }

// set values according to the keyboard pressed
  void setDisplay(String value) {
    if (value == 'C') {
      cleanDisplay();
    } else {
      if (activatedLabel == 'c') {
        if (value == '±') {
          c = sign(c);
        } else {
          c = concatenate(c, value);
        }
      }

      if (activatedLabel == 'f') {
        if (value == '±') {
          f = sign(f);
        } else {
          f = concatenate(f, value);
        }
      }
    }

    labelChanged = false;
    truncateDisplay();
    seFields();
    notifyListeners();
  }

//setting display to '0'
  void cleanDisplay() {
    c = '0';
    f = '0';
  }

// seeting values to the other field (not active label)
  void seFields() {
    if (activatedLabel == 'c') {
      f = ((double.parse(c) * 1.8) + 32).toStringAsFixed(2);
    }
    if (activatedLabel == 'f') {
      c = ((double.parse(f) - 32) * 0.5556).toStringAsFixed(2);
    }
  }

//setting positive / negative
  String sign(String s) => (double.parse(s) * -1).toString();

// truncTION TO 2 DECIMALS
  void truncateDisplay() {
    c = c.length > 5 ? c.substring(0, 5) : c;
    f = f.length > 5 ? f.substring(0, 5) : f;
  }

  //keyboard input
  String concatenate(String actual, String pressed) {
    if (labelChanged || actual == '0') {
      return pressed == '.' ? '0.' : pressed;
    } else {
      return actual + pressed;
    }
  }
}
