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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(

        child: new GestureDetector(
          onTap: () {
            setState(() {
              _color = new Color.fromARGB(
                255,
                _random.nextInt(256),
                _random.nextInt(256),
                _random.nextInt(256)
              );
            });
          },

          child: new Container(
            color: _color,
            child: new Text("Hey there",
            style: TextStyle(
              fontSize: 20.0
            ),
            ),
            alignment: Alignment.center,
          ),
        ), 
      ),
    );
  }
}