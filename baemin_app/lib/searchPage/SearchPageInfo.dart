import 'package:flutter/material.dart';

///*****************************************************************************
///
/// 검색 페이지에서 실사간 검색어의 변동사항을 나타내는 이미지를 빌드하는 위젯
///
/// @ 매개변수
///             Key       key
/// @required   String    directory   : 이미지의 위치
///
/// @ 메서드
/// Widget    build(BuildContext context)
///
///*****************************************************************************
///
class SearchPageInfo extends StatelessWidget {
  const SearchPageInfo({
    Key key,
    @required this.directory,
  }) : super(key: key);

  final String directory;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      margin: EdgeInsets.fromLTRB(0,0,15,0),
      child: Image.asset(directory),
    );
  }
}
