import 'package:flutter/material.dart';

import 'MyBaeMinArrow.dart';
import 'MyBaeMinArrowButton.dart';
import 'MyBaeMinShadowH.dart';

class MyBaeMinTemplate extends StatelessWidget {
  const MyBaeMinTemplate({
    Key key,
    @required double leftFontMargin,
    @required this.title,
    @required this.function,
  })  : _leftFontMargin = leftFontMargin,
        super(key: key);

  final double _leftFontMargin;
  final String title;
  final Function function;

  @override
  Widget build(BuildContext context) {
    final _thisWidth = MediaQuery.of(context).size.width;
    final _thisTextScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Column(
      children: <Widget>[
        MyBaeMinShadowH(),
        Container(
          height: _thisWidth * 0.15733333, // 59
          color: Colors.white,
          child: MyBaeMinArrowButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(_leftFontMargin, 0, 0, 0),
                  child: Text(
                    title,
                    textScaleFactor: 0.82,
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                ),
                MyBaeMinArrow(),
              ],
            ),
            function: function,
          ),
        ),
      ],
    );
  }
}
