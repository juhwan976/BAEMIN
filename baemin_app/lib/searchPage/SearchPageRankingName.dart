import 'package:flutter/material.dart';

class SearchPageRankingName extends StatelessWidget {
  const SearchPageRankingName({
    Key key,
    @required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      textScaleFactor: 0.82,
      style: TextStyle(
        fontSize: 19,
      ),
    );
  }
}
