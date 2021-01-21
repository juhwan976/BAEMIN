import 'package:flutter/material.dart';

import '../Store.dart';

class StoreDetailPage extends StatefulWidget {
  StoreDetailPage({
    Key key,
    this.store,
  }) : super(key: key);
  final Store store;

  _StoreDetailPageState createState() => _StoreDetailPageState();
}

class _StoreDetailPageState extends State<StoreDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          widget.store.name,
        ),
      ),
    );
  }
}
