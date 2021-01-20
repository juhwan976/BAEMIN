import 'package:flutter/material.dart';

import '../../Store.dart';
import '../ZZimBuildPage.dart';

class Call extends StatelessWidget {
  const Call({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Store> _storeList = new List<Store>();

    return ZZimBuildPage(_storeList);
  }
}
