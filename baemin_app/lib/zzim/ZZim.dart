import 'package:flutter/material.dart';

class ZZimPage extends StatefulWidget {
  ZZimPage({Key key}) : super(key : key);

  @override
  _ZZimPageState createState() => _ZZimPageState();
}

class _ZZimPageState extends State<ZZimPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('찜한가게'),
      ),
    );
  }
}