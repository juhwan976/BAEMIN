import 'package:flutter/material.dart';

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