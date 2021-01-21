import 'package:flutter/material.dart';

import '../Store.dart';
import 'ZZimTemplate.dart';

Container ZZimBuildPage(List<Store> _storeList) {
  Widget returnWidget;

  if (_storeList.isEmpty) {
    returnWidget = Center(
      child: Text(
        '텅',
        style: TextStyle(
          fontSize: 100,
        ),
      ),
    );
  } else {
    returnWidget = ZZimTemplate(storeList: _storeList);
  }

  return Container(
    color: Color(0x09000000),
    child: returnWidget,
  );
}