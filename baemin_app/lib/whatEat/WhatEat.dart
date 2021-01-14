import 'package:flutter/material.dart';

class WhatEatPage extends StatefulWidget {
  WhatEatPage({Key key}) : super(key: key);

  @override
  _WhatEatPageState createState() => _WhatEatPageState();
}

class _WhatEatPageState extends State<WhatEatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('뭐먹지'),
      ),
    );
  }
}