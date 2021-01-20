import 'package:flutter/material.dart';

class MyBaeMinButton extends StatelessWidget {
  const MyBaeMinButton({
    Key key, this.icon, this.text,
  }) : super(key: key);

  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return
      FlatButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon,
            Container(
              height: (MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top) * 0.00651042,
            ),
            Text(
              text,
              textScaleFactor: 1,
              style: TextStyle(
                fontSize: 10.66,
                color: Color(0x70000000),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        onPressed: () {},

    );
  }
}