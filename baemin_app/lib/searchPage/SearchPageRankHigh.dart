import 'package:flutter/material.dart';

import 'SearchPageInfo.dart';
import 'SearchPageRankingName.dart';

///*****************************************************************************
///
/// 검색 페이지의 실시간 검색어 중 1 ~ 3위에 해당하는 항목을 빌드하는 위젯
///
/// @ 매개변수
///             Key       key
/// @required   int       rank            : 해당 항목의 순위
/// @required   String    name            : 해당 항목의 이름
/// @required   int       info            : 해당 항목의 순위 변동 정보
///             double    bottomPadding   : 중간을 맞추기 위해 넣은  padding
/// @required   Function  onPressed       : 해당 항목을 터치했을 경우 실행될 함수
///
/// @ 메서드
/// String    _returnRankPicDirectory()
/// String    _returnInfoDirectory()
///
/// Widget    build(BuildContext context)
///
///*****************************************************************************
///
class SearchPageRankHigh extends StatelessWidget {
  const SearchPageRankHigh({
    Key key,
    @required this.rank,
    @required this.name,
    @required this.info,
    this.bottomPadding = 0,
    @required this.onPressed,
  }) : super(key: key);

  final int rank;
  final String name;
  final int info;
  final double bottomPadding;
  final Function onPressed;

  /// 랭킹 사진의 디렉토리명을 반환하는 메서드
  String _returnRankPicDirectory() {
    String _rank;

    switch (rank) {
      case 1:
        _rank = 'one';
        break;
      case 2:
        _rank = 'two';
        break;
      case 3:
        _rank = 'three';
        break;
      default:
        break;
    }

    return 'assets/Search/deco_number_' + _rank + '.png';
  }

  /// 상태 사진의 디렉토리명을 반환하는 메서드
  String _returnInfoDirectory() {
    String _info;

    switch (info) {
      case 0:
        _info = 'new';
        break;
      case 1:
        _info = 'riseup';
        break;
      case 2:
        _info = 'dropdown';
        break;
      case 3:
        _info = 'keep';
        break;
      default:
        break;
    }

    return 'assets/Search/deco_' + _info + '.png';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, bottomPadding),
      child: GestureDetector(
        child: Row(
          children: <Widget>[
            Container(
              height: 35,
              margin: EdgeInsets.fromLTRB(13, 0, 5, 0),
              child: Image.asset(_returnRankPicDirectory()),
            ),
            Expanded(
              child: SearchPageRankingName(name: name),
            ),
            SearchPageInfo(directory: _returnInfoDirectory()),
          ],
        ),
        onTap: onPressed,
      ),
    );
  }
}
