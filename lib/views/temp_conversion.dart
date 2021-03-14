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
        constraints: BoxConstraints(
          maxHeight: adaptativeTheme.maxHeight,
          maxWidth: adaptativeTheme.maxHeight,
        ),
        color: Colors.red,
        child: Column(
          children: [Celsius()],
        ),
      ),
    );
  }
}

class Celsius extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    adaptativeTheme = AdaptativeTheme(MediaQuery.of(context).size.width);
    return Container(
      alignment: Alignment(0.9, 0.9),
      color: Colors.green,
      child: Text('Here we go'),
    );
  }
}
