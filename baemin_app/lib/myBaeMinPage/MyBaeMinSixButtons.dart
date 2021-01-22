import 'package:baemin_app/myBaeMinPage/MyBaeMinButton.dart';
import 'package:flutter/material.dart';

class MyBaeMinSixButtons extends StatelessWidget {
  const MyBaeMinSixButtons({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.function,
  }) : super(key: key);

  final Icon icon;
  final String text;
  final Function function;

  @override
  Widget build(BuildContext context) {
    final _thisWidth = MediaQuery.of(context).size.width;
    final _thisTextScaleFactor = MediaQuery.of(context).textScaleFactor;

    return MyBaeMinButton(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icon,
          Container(
            height: _thisWidth * 0.01333333, // 5
          ),
          Text(
            text,
            textScaleFactor: 0.82,
            style: TextStyle(
              fontSize: 13,
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
