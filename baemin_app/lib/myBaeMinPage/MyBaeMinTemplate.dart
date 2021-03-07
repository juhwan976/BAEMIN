import 'dart:io';

import 'package:flutter/material.dart';

import 'MyBaeMinArrow.dart';
import 'MyBaeMinButton.dart';
///*****************************************************************************
///
/// my배민에 사용되는 설명이 없는 항목들의 템플릿을 빌드하는 위젯
///
/// @ 매개변수
///             Key       key
/// @required   double    leftFontMargin  : 항목의 제목 왼쪽에 적용될 마진
/// @required   String    title           : 항목의 제목
/// @required   Function  function        : 항목을 터치했을 경우 실행될 함수
///
/// @ 메서드
/// Widget    build(BuildContext context)
///
/// [title]의 [fontSize]는 19로 되어있다.
///
///*****************************************************************************
///
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

    return Container(
      height: (Platform.isIOS) ? _thisWidth * 0.15733333 : 59, // 59
      color: Colors.white,
      child: MyBaeMinButton(
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
    );
  }
}
