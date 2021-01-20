import 'package:flutter/material.dart';

import 'MyBaeMinArrow.dart';
import 'MyBaeMinShadowH.dart';

class MyBaeMinTemplate extends StatelessWidget {
  const MyBaeMinTemplate({
    Key key,
    @required double leftFontMargin, this.title
  }) : _leftFontMargin = leftFontMargin, super(key: key);

  final double _leftFontMargin;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MyBaeMinShadowH(),
        Container(
          height: 59,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(_leftFontMargin, 0, 0, 0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
              ),
              MyBaeMinArrow(),
            ],
          ),
        ),
      ],
    );
  }
}