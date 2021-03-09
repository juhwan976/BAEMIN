import 'package:flutter/material.dart';

///*****************************************************************************
///
/// 찜한가게 페이지의 가게 리스트에서 분할선을 빌드하는 위젯
///
/// @ 매개변수
/// Key   key
///
/// @ 메서드
/// Widget    build(BuildContext context)
///
///*****************************************************************************
///
class ZZimShadowH extends StatelessWidget {
  const ZZimShadowH({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: Color(0x01000000),
    );
  }
}