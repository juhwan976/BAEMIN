import 'package:flutter/material.dart';

class MyBaeMinButton extends StatelessWidget {
  const MyBaeMinButton({
    Key key, this.icon, this.text,
  }) : super(key: key);

  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        highlightColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon,
            Container(
              height: 5,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 13,
                color: Color(0x70000000),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        onPressed: (){},
    );
  }
}