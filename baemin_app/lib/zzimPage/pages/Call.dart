import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../Store.dart';
import '../ZZimBuildPage.dart';

class Call extends StatelessWidget {
  const Call({
    Key key,
    @required this.buildContext,
    @required this.scrollBehaviorSubject,
  }) : super(key: key);

  final BuildContext buildContext;
  final BehaviorSubject<bool> scrollBehaviorSubject;

  @override
  Widget build(BuildContext context) {
    List<Store> _storeList = new List<Store>();

    return ZZimBuildPage(
      storeList: _storeList,
      title: '전화주문',
      buildContext: buildContext,
      scrollBehaviorSubject: scrollBehaviorSubject,
    );
  }
}
