import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/Call.dart';
import 'pages/Rightnow.dart';
import 'pages/ZZimed.dart';

class ZZimPage extends StatefulWidget {
  ZZimPage({
    Key key,
    @required this.fromAnotherPage,
  }) : super(key: key);

  final bool fromAnotherPage;

  @override
  _ZZimPageState createState() => _ZZimPageState();
}

class _ZZimPageState extends State<ZZimPage> {
  Widget _buildLeading(bool fromAnotherPage) {
    if (fromAnotherPage) {
      return CupertinoButton(
        child: Icon(
          Icons.arrow_back_rounded,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    double _thisHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: _buildLeading(widget.fromAnotherPage),
          backgroundColor: Colors.white,
          toolbarHeight: (Platform.isIOS)?_thisHeight * 0.109375: 100, // 84, 안드로이드일 경우 높이는 임시
          elevation: 0.0,
          brightness: Brightness.light,
          bottom: PreferredSize(
            preferredSize: null,
            child: Theme(
              data: ThemeData(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
              child: Column(
                children: <Widget>[
                  TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.black,
                    indicatorWeight: 3.5,
                    labelColor: Colors.black,
                    labelPadding: EdgeInsets.all(5),
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontSize: 20,
                    ),
                    unselectedLabelColor: Colors.black12,
                    tabs: [
                      Text('찜한가게', textScaleFactor: 0.82),
                      Text('바로결제', textScaleFactor: 0.82),
                      Text('전화주문', textScaleFactor: 0.82),
                    ],
                  ),
                  Container(
                    height: 1.0,
                    color: Colors.black12,
                  ),
                ],
              ),
            ),
          ),
          centerTitle: true,
          title: Text('찜한가게', textScaleFactor: 0.82),
        ),
        body: TabBarView(
          children: <Widget>[
            ZZimed(),
            Rightnow(),
            Call(),
          ],
        ),
      ),
    );
  }
}
