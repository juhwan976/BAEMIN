import 'package:flutter/material.dart';

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
