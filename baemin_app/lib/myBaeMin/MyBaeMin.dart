import 'package:flutter/material.dart';

class MyBaeMinPage extends StatefulWidget {
  MyBaeMinPage({Key key}) : super(key: key);

  @override
  _MyBaeMinPageState createState() => _MyBaeMinPageState();
}

class _MyBaeMinPageState extends State<MyBaeMinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('마이배민'),
      ),
    );
  }
}