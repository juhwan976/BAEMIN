import 'package:flutter/material.dart';

class MyBaeMinButton extends StatelessWidget {
  const MyBaeMinButton({
    Key key, this.icon, this.text, this.function
  }) : super(key: key);

  final Icon icon;
  final String text;
  final Function function;

  @override
  Widget build(BuildContext context) {
    final _thisWidth = MediaQuery.of(context).size.width;
    final _thisTextScaleFactor = MediaQuery.of(context).textScaleFactor;

    return FlatButton(
        highlightColor: Colors.transparent,
        splashColor: Color(0x0D000000),
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
        onPressed: function,
    );
  }
}