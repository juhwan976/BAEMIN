import 'package:baemin_app/myBaeMinPage/MyBaeMinButton.dart';
import 'package:flutter/material.dart';

class MyBaeMinSixButtons extends StatelessWidget {
  const MyBaeMinSixButtons({
    Key key,
    @required this.directory,
    @required this.text,
    @required this.function,
  }) : super(key: key);

  final String directory;
  final String text;
  final Function function;

  @override
  Widget build(BuildContext context) {

    return MyBaeMinButton(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 40,
            child: Image.asset(directory),
          ),
          Text(
            text,
            textScaleFactor: 0.82,
            style: TextStyle(
              fontSize: 12,
              color: Color(0x70000000),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      function: function,
    );
  }
}
