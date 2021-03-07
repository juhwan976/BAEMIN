import 'package:flutter/material.dart';

///*****************************************************************************
///
/// 검색 페이지 실시간 검색어 중 항목의 이름을 빌드하는 위젯
///
/// @ 매개변수
///             Key       key
/// @required   String    name    : 항목의 이름
///
/// @ 메서드
/// Widget    build(BuildContext context)
///
/// [name]의 [fontSize]는 19로 설정되어있다.
///
///*****************************************************************************
///
class SearchPageRankingName extends StatelessWidget {
  const SearchPageRankingName({
    Key key,
    @required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
      child: Text(
        name,
        textScaleFactor: 0.82,
        style: TextStyle(
          fontSize: 19,
        ),
      ),
    );
  }
}
