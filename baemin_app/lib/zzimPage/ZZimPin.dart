import 'package:flutter/material.dart';

class ZZimPin extends StatelessWidget {
  const ZZimPin({
    Key key,
    @required this.visible,
    @required this.title,
  }) : super(key: key);

  final bool visible;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        margin: EdgeInsets.fromLTRB(3, 12, 0, 0),
        width: 30,
        height: 17,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: (title == '쿠폰')
              ? Colors.orange
              : ((title == '신규') ? Colors.red : Colors.black),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(1, 1, 0, 0),
            child: Text(
              title,
              textScaleFactor: 0.82,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
