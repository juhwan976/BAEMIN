import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        toolbarHeight: 46,
        centerTitle: true,
        title: Text(
          '홈',
        ),
      ),
      body: Container(
        child: Center(
          child: Text('홈 페이지'),
        ),
      ),
    );
  }
}
