import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../Store.dart';
import '../ZZimBuildPage.dart';

///*****************************************************************************
///
/// 찜한가게 페이지의 바로결제 탭
///
///*****************************************************************************
///
class Rightnow extends StatelessWidget {
  const Rightnow({
    Key? key,
    required this.buildContext,
    required this.scrollBehaviorSubject,
  }) : super(key: key);

  final BuildContext buildContext;
  final BehaviorSubject<bool> scrollBehaviorSubject;

  @override
  Widget build(BuildContext context) {
    List<Store> _storeList = List<Store>.empty();

    return ZZimBuildPage(
      storeList: _storeList,
      title: '바로결제',
      buildContext: context,
      scrollBehaviorSubject: scrollBehaviorSubject,
    );
  }
}
