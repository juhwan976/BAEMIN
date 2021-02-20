import 'dart:io';

import 'package:flutter/material.dart';

import 'MyBaeMinArrow.dart';
import 'MyBaeMinButton.dart';

class MyBaeMinTemplateDes extends StatelessWidget {
  const MyBaeMinTemplateDes({
    Key key,
    @required double leftFontMargin,
    @required this.title,
    @required this.description,
    @required this.function,
  })  : _leftFontMargin = leftFontMargin,
        super(key: key);

  final double _leftFontMargin;
  final String title;
  final String description;
  final Function function;

  @override
  Widget build(BuildContext context) {
    final _thisWidth = MediaQuery.of(context).size.width;

    return Container(
      height: (Platform.isIOS)
          ? _thisWidth * 0.21866667
          : 82, // 82, _thisWidth * 0.21866667
      color: Colors.white,
      child: MyBaeMinButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(_leftFontMargin, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    textScaleFactor: 0.82,
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                  Container(
                    height: _thisWidth * 0.008, // 3
                  ),
                  Text(
                    description,
                    textScaleFactor: 0.82,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0x70000000),
                    ),
                  ),
                ],
              ),
            ),
            MyBaeMinArrow(),
          ],
        ),
        function: function,
      ),
    );
  }
}
