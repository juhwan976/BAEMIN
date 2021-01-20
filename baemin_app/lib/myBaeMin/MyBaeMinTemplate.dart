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
          height: (MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top) * 0.07682292,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(_leftFontMargin, 0, 0, 0),
                child: Text(
                  title,
                  textScaleFactor: 1,
                  style: TextStyle(
                    fontSize: 15.58,
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