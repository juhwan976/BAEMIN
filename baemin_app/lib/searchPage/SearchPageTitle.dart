import 'package:flutter/material.dart';

///*****************************************************************************
///
/// 검색 페이지에서 출력되는 글자들을 빌드하는 위젯
///
/// @ 매개변수
///             Key       key
/// @required   String    title       : 출력될 내용
/// @required   double    leftMargin  : 출력될 내용의 왼쪽에 들어갈 마진
///
/// @ 메서드
/// Widget    build(BuildContext context)
///
/// [title]의 [fontSize]는 19로 설정되었다.
///
///*****************************************************************************
///
class SearchPageTitle extends StatelessWidget {
  const SearchPageTitle({
    Key key,
    @required this.title,
    @required this.leftMargin,
  }) : super(key: key);

  final String title;
  final double leftMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(leftMargin, 0, 0, 0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
