import 'package:flutter/material.dart';

class ZZimPin extends StatelessWidget {
  const ZZimPin({Key key, @required this.visible, @required this.title})
      : super(key: key);

  final bool visible;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(3, 12, 0, 0),
            width: 30,
            height: 17,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: (title == '쿠폰')
                  ? Colors.orange
                  : ((title == '신규') ? Colors.red : Colors.black),
            ),
          ),
          Positioned(
            top: 15,
            left: 9.5,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
