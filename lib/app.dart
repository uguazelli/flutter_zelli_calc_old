import 'package:flutter/material.dart';
import 'package:flutter_2_application/views/simple_calc.dart';
import 'views/parts/menu.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
        //making the main container use 100% of safe area
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment(0.0, 0.9),
        child: SimpleCalculator(),
      ),
    );
  }
}
