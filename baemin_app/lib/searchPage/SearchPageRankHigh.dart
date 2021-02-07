import 'package:flutter/material.dart';

import 'SearchPageInfo.dart';
import 'SearchPageRankingName.dart';

class SearchPageRankHigh extends StatelessWidget {
  const SearchPageRankHigh({
    Key key,
    @required this.rank,
    @required this.name,
    @required this.info,
    this.height,
  }) : super(key: key);

  final int rank;
  final String name;
  final int info;
  final double height;

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
      default:
        break;
    }

    return 'assets/Search/deco_' + _info + '.png';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: (height ?? 35),
          margin: EdgeInsets.fromLTRB(13, 0, 5, 0),
          child: Image.asset(_returnRankPicDirectory()),
        ),
        Expanded(
          child: SearchPageRankingName(name: name),
        ),
        SearchPageInfo(directory: _returnInfoDirectory()),
      ],
    );
  }
}