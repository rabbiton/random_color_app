import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  State createState() => new _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final Random _random = new Random();
  Color _color = Colors.grey[300];
  Color themeTextColor = Colors.grey[900];
  List<Color> _colorList = [Color(0xFFE0E0E0)];
  int pressButtonCounter = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "Random color App",
        ),
        centerTitle: true,
        backgroundColor: _color,
        textTheme: TextTheme(
            title: TextStyle(
          color: themeTextColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )),
      ),
      body: new Center(
        child: new GestureDetector(
          onTap: () {
            setState(() {
              pressButtonCounter = 0;
              _color = new Color.fromARGB(255, _random.nextInt(256),
                  _random.nextInt(256), _random.nextInt(256));
              _colorList.add(_color);
              print(_colorList);
            });
          },
          child: new Container(
            color: _color,
            child: new Text(
              "Hey there",
              style: TextStyle(fontSize: 20.0),
            ),
            alignment: Alignment.center,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_colorList.length == 2) {
              _color = _colorList[0];
            }
            else {
              if (_colorList.length > 3) {
                pressButtonCounter++;
                if (_colorList.length - (1 + pressButtonCounter) < 0) {
                  pressButtonCounter = 0;
                  _colorList.clear();
                  _colorList.add(Color(0xFFE0E0E0));
                  _color = _colorList[0];
                }
                else {
                  _color =
                      _colorList[_colorList.length - (1 + pressButtonCounter)];
                }
              }
            }
          });
        },
        tooltip: 'Changing background to the previous color',
        child: Icon(
          Icons.update,
          color: themeTextColor,
        ),
        backgroundColor: _color,
      ),
    );
  }
}
