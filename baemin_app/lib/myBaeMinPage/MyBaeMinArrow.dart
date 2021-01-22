import 'package:flutter/material.dart';

/*
 * 화살표 아이콘을 빌드하는 위젯
 */
class MyBaeMinArrow extends StatelessWidget {
  const MyBaeMinArrow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 20,
        color: Colors.black26,
      ),
      margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
    );
  }
}