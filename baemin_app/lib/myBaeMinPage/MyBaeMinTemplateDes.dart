import 'dart:io';

import 'package:flutter/material.dart';

import 'MyBaeMinArrow.dart';
import 'MyBaeMinButton.dart';

///*****************************************************************************
///
/// my배민에 사용되는 설명이 있는 항목들의 템플릿을 빌드하는 위젯
///
/// @ 매개변수
///             Key       key
/// @required   double    leftFontMargin  : 항목의 제목 및 설명의 왼쪽에 적용될 마진
/// @required   String    title           : 항목의 제목
/// @required   String    description     : 항목의 설명
/// @required   Function  function        : 항목을 터치했을 경우 실행될 함수
///
/// @ 메서드
/// Widget    build(BuildContext context)
///
/// [title]의 [fontSize]는 19로 설정되어있다.
/// [description]의 [fontSize]는 16으로 설정되어있다.
///
///*****************************************************************************
///
class MyBaeMinTemplateDes extends StatelessWidget {
  const MyBaeMinTemplateDes({
    Key? key,
    required double leftFontMargin,
    required this.title,
    required this.description,
    required this.function,
  })  : _leftFontMargin = leftFontMargin,
        super(key: key);

  final double _leftFontMargin;
  final String title;
  final String description;
  final Function function;

  @override
  Widget build(BuildContext context) {
    final _thisWidth = MediaQuery.of(context).size.width;

    return Container(
      height: (Platform.isIOS)
          ? _thisWidth * 0.21866667
          : 82, // 82, _thisWidth * 0.21866667
      color: Colors.white,
      child: MyBaeMinButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(_leftFontMargin, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    textScaleFactor: 0.82,
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                  Container(
                    height: _thisWidth * 0.008, // 3
                  ),
                  Text(
                    description,
                    textScaleFactor: 0.82,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0x70000000),
                    ),
                  ),
                ],
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
