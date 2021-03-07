import 'package:flutter/material.dart';

///*****************************************************************************
///
/// my배민 페이지에서 사용되는 화살표를 빌드하는 위젯
///
/// @ 매개변수
/// Key   key
///
/// @ 메서드
/// Widget    build(BuildContext context)
///
///*****************************************************************************
///
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