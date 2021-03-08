import 'package:flutter/material.dart';
import 'package:flutter_2_application/helper/adaptative_theme.dart';

AdaptativeTheme adaptativeTheme;

class SimpleCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    adaptativeTheme = AdaptativeTheme(MediaQuery.of(context).size.width);
    return Container(
      constraints: BoxConstraints(
        maxHeight: adaptativeTheme.maxHeight,
        maxWidth: adaptativeTheme.maxHeight,
      ),
      color: Colors.green,
      child: Column(
        children: [
          Display(),
          Keyboard(),
        ],
      ),
    );
  }
}

class Display extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        alignment: Alignment(0.9, 0.9),
        color: Colors.green,
        child: Text(
          'Dispay',
          style: TextStyle(fontSize: adaptativeTheme.fontSize),
        ),
      ),
    );
  }
}

class Keyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
          alignment: Alignment(0.9, 0.9),
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Key(value: 'raiz'),
                  Key(value: '%'),
                  Key(value: 'C'),
                  Key(value: '/'),
                ],
              ),
              Row(
                children: [
                  Key(value: '7'),
                  Key(value: '8'),
                  Key(value: '9'),
                  Key(value: 'x'),
                ],
              ),
              Row(
                children: [
                  Key(value: '4'),
                  Key(value: '5'),
                  Key(value: '6'),
                  Key(value: '-'),
                ],
              ),
              Row(
                children: [
                  Key(value: '1'),
                  Key(value: '2'),
                  Key(value: '3'),
                  Key(value: '+'),
                ],
              ),
              Row(
                children: [
                  Key(value: '+-'),
                  Key(value: '.'),
                  Key(value: '0'),
                  Key(value: '='),
                ],
              ),
            ],
          )),
    );
  }
}

class Key extends StatelessWidget {
  String value;
  Key({this.value});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          alignment: Alignment(0, 0),
          child: Text(
            value,
            style: TextStyle(fontSize: adaptativeTheme.fontSize),
          ),
        ),
      ),
    );
  }
}
