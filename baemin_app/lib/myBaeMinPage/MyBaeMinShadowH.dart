import 'package:flutter/material.dart';

///*****************************************************************************
///
/// my배민 페이지에 사용되는 가로 분할선을 빌드하는 위젯
///
/// @ 매개변수
/// Key   key
///
/// @ 메서드
/// Widget    build(BuildContext context)
///
/// [color]는 Color(0x10000000) 으로 설정되어있다.
///
///*****************************************************************************
///
class MyBaeMinShadowH extends StatelessWidget {
  const MyBaeMinShadowH({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: Color(0x01000000));
  }
}