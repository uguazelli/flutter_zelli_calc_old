import 'package:flutter/material.dart';
import 'package:flutter_2_application/helper/adaptative_theme.dart';
import 'package:flutter_2_application/views/parts/menu.dart';

AdaptativeTheme adaptativeTheme;

class TempConversion extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    adaptativeTheme = AdaptativeTheme(MediaQuery.of(context).size.width);
    return MaterialApp(
      title: 'Zelli Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zelli Calculator'),
      ),
      drawer: Menu(),
      body: Container(
        alignment: Alignment(0.0, 0.9),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: adaptativeTheme.maxHeight,
            maxWidth: adaptativeTheme.maxHeight,
          ),
          color: Colors.yellow,
          child: Column(
            children: [
              Celsius(),
              Fahrenheit(),
              Keyboard(),
            ],
          ),
        ),
      ),
    );
  }
}

class Celsius extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    adaptativeTheme = AdaptativeTheme(MediaQuery.of(context).size.width);
    return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment(0.9, 0.9),
        color: Colors.green,
        child: Text('Celsius'),
      ),
    );
  }
}

class Fahrenheit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    adaptativeTheme = AdaptativeTheme(MediaQuery.of(context).size.width);
    return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment(0.9, 0.9),
        color: Colors.blue,
        child: Text('Fahrenheit'),
      ),
    );
  }
}

class Keyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    adaptativeTheme = AdaptativeTheme(MediaQuery.of(context).size.width);
    return Expanded(
      flex: 5,
      child: Container(
        color: Colors.orange,
        child: Text('KeyBoard'),
      ),
    );
  }
}
