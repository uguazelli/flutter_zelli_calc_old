import 'package:flutter/material.dart';
import 'package:flutter_2_application/helper/adaptative_theme.dart';
import 'package:flutter_2_application/models/temp_processor.dart';
import 'package:flutter_2_application/views/menu.dart';
import 'package:provider/provider.dart';

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
      //adding provider to handle state change
      home: MultiProvider(providers: [
        ChangeNotifierProvider<TempProcessor>(
          create: (_) => TempProcessor(),
        )
      ], child: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zelli Temperature Conversion'),
      ),
      drawer: Menu(),
      body: Container(
        alignment: Alignment(0.0, 0.6),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: adaptativeTheme.maxHeight,
            maxWidth: adaptativeTheme.maxHeight,
          ),
          child: Column(
            // using expanded to dynamic set height and width
            children: [
              Expanded(flex: 1, child: Display(tempScale: 'c')),
              Expanded(flex: 1, child: Display(tempScale: 'f')),
              Expanded(flex: 4, child: Keyboard()),
            ],
          ),
        ),
      ),
    );
  }
}

//display both Celsius and Fahrenheit cards display
class Display extends StatelessWidget {
  final String tempScale;
  Display({this.tempScale});

  @override
  Widget build(BuildContext context) {
    TempProcessor tempProcessor = context.watch<TempProcessor>();
    return Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.blue.withOpacity(
                tempProcessor.activatedLabel == tempScale ? 0.4 : 0.0),
          ),
        ),
        color:
            tempProcessor.activatedLabel == tempScale ? null : Colors.grey[100],
        margin: EdgeInsets.all(10),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () => tempProcessor.setActiveLabel(tempScale),
          child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: double.infinity,
                    alignment: Alignment(-0.9, 0.8),
                    child: Text(
                      tempScale == 'c' ? 'Celsius:' : 'Fahrenheit',
                      style: TextStyle(
                        fontSize: adaptativeTheme.fontSize - 20,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    alignment: Alignment(0.0, 0.8),
                    child: Text(
                      tempScale == 'c' ? tempProcessor.c : tempProcessor.f,
                      style: TextStyle(fontSize: adaptativeTheme.fontSize - 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class Keyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0.9, 0.9),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Key(value: ''),
                Key(value: ''),
                Key(value: 'C'),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Key(value: '7'),
                Key(value: '8'),
                Key(value: '9'),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Key(value: '4'),
                Key(value: '5'),
                Key(value: '6'),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Key(value: '1'),
                Key(value: '2'),
                Key(value: '3'),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Key(value: '±'),
                Key(value: '0'),
                Key(value: '.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Key extends StatelessWidget {
  final String value;
  Key({this.value});

  BoxDecoration boxDecoration(String value) {
    if (value == '')
      return new BoxDecoration();
    else if (value == 'C')
      return new BoxDecoration(
        color: Colors.red[100],
        border: Border.all(
          color: Colors.black,
          width: 0.05,
        ),
      );
    else
      return new BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 0.05,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    TempProcessor tempProcessor = context.watch<TempProcessor>();
    return Expanded(
      child: InkWell(
        onTap: () => tempProcessor.setDisplay(value),
        child: Container(
          decoration: boxDecoration(value),
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
