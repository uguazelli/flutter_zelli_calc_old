import 'package:flutter/material.dart';
import 'package:flutter_2_application/helper/adaptative_theme.dart';
import 'package:flutter_2_application/models/calc_processor.dart';
import 'package:provider/provider.dart';

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
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<CalcProcessor>(
            create: (_) => CalcProcessor(),
          )
        ],
        child: Column(
          children: [
            Display(),
            Keyboard(),
          ],
        ),
      ),
    );
  }
}

class Display extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CalcProcessor calc = context.watch<CalcProcessor>();
    return Expanded(
      flex: 2,
      child: Container(
        alignment: Alignment(0.9, 0.9),
        child: Text(
          calc.display,
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
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Key(value: '√'),
                    Key(value: '%'),
                    Key(value: 'C'),
                    Key(value: '÷'),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Key(value: '7'),
                    Key(value: '8'),
                    Key(value: '9'),
                    Key(value: 'x'),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Key(value: '4'),
                    Key(value: '5'),
                    Key(value: '6'),
                    Key(value: '-'),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Key(value: '1'),
                    Key(value: '2'),
                    Key(value: '3'),
                    Key(value: '+'),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Key(value: '±'),
                    Key(value: '.'),
                    Key(value: '0'),
                    Key(value: '='),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class Key extends StatelessWidget {
  final String value;
  Key({this.value});
  @override
  Widget build(BuildContext context) {
    CalcProcessor calc = context.watch<CalcProcessor>();
    return Expanded(
      child: GestureDetector(
        onTap: () => calc.setDisplay(value),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 0.05),
              left: BorderSide(width: 0.05),
              right: BorderSide(width: 0.05),
              bottom: BorderSide(width: 0.05),
            ),
          ),
          // color: Colors.red,
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
